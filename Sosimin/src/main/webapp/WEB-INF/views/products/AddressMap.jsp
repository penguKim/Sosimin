<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style>
	#mapButton{
    width: 485px;
    height: 50px;
    font-size: 20px;
    margin-top: 10px;
    background-color: white;
	}
	#mapButton:hover{
    color: #fff;
    background-color: #39d274;
    border-color: transparent;
}
	}
</style>
<script>
$(function() {

	navigator.geolocation.getCurrentPosition(function(position) {
		  var latitude = position.coords.latitude; // 현재 위치의 위도
		  var longitude = position.coords.longitude; // 현재 위치의 경도

		  var mapContainer = document.getElementById('map'); // 지도를 표시할 div
		  var mapOption = {
		    center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표를 현재 위치로 설정
		    level: 1 // 지도의 확대 레벨
		  };

		  // 지도를 생성합니다
		  var map = new kakao.maps.Map(mapContainer, mapOption);

		  // 사용자의 현재 위치를 표시할 마커를 생성합니다
		  var markerPosition = new kakao.maps.LatLng(latitude, longitude);
		  var marker = new kakao.maps.Marker({
		    position: markerPosition
		  });

		  // 마커를 지도에 표시합니다
		  marker.setMap(map);

		  // 주소-좌표 변환 객체를 생성합니다
		  var geocoder = new kakao.maps.services.Geocoder();
		  var infowindow = new kakao.maps.InfoWindow({ zindex: 1 });

		  // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		  kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
		      if (status === kakao.maps.services.Status.OK) {
		        displayAddress(result, mouseEvent.latLng);
		      }
		    });
		  });

		  // 좌표로 법정동 상세 주소 정보를 요청하는 함수입니다
		  function searchDetailAddrFromCoords(coords, callback) {
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		  }

		  // 주소 정보를 표시하는 함수입니다
		  function displayAddress(result, coords) {
		    var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		    detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

		    var content = '<div class="bAddr">' +
		      '<span class="title">법정동 주소정보</span>' +
		      detailAddr +
		      '</div>';
			
		      var address = result[0].address.address_name; // 지번 주소
	          
	          
	          if(address.split(' ')[0] == "부산" || address.split(' ')[0] == "대구" || address.split(' ')[0] == "인천" || address.split(' ')[0] == "광주" || address.split(' ')[0] == "대전" || address.split(' ')[0] == "울산"  ) {
	        	  var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          } else if(address.split(' ')[0] == "서울" ) {
	        	  var modifiedAddress = address.split(' ')[0] + "특별시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          } else {
	        	  var modifiedAddress = address.split(' ')[0]  + " " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          }
		      
	          $("#myMap").val(modifiedAddress);
	          localStorage.setItem("tradePlace", modifiedAddress);
		    // 마커를 클릭한 위치에 표시합니다
		    marker.setPosition(coords);
		    marker.setMap(map);

		    // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		  }

		  // 처음 지도를 열었을 때 현재 위치의 상세 주소 정보를 가져와서 표시합니다
		  searchDetailAddrFromCoords(markerPosition, function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		      displayAddress(result, markerPosition);
		    }
		  });
		});
	
}); // $(document).ready() 끝	

function submitAddress() {
// 	  var address = result[0].address.address_name; // result는 주소 정보를 담고 있는 변수라고 가정합니다.
	  var address = $("#myMap").val();
	  window.opener.setAddress(address);
	  window.close();
	}
</script>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a75e8ce5f3bdcb17d52cf91eac1f473&libraries=services"></script>
	<div id="map" style="width:500px;height:400px;"></div>
	<div><input type="button" value="확인" onclick="submitAddress()" id="mapButton"></div>
	<input type="hidden" name="myMap" id="myMap" size="25" required readonly>
</body>
</html>