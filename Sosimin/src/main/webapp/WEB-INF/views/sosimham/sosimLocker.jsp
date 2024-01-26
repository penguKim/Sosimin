<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Sosimin</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
    <link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sosimham/sosimham.css" />
	
	<script>
	$(function(){
		// 드롭다운 메뉴 아이템이 클릭되었을 때 실행되는 함수
		$('.itemGu').click(function() {
			// 클릭된 드롭다운 메뉴 아이템의 텍스트를 가져와서 버튼의 내용으로 설정합니다.
			var gu = $(this).text();
		    $('.btngu').text(gu);
		    let object = ${object};
		    console.log("object : " + object);
		    console.log(object[gu]);
		    $(".dongSelect").html("");
		    for(let i = 0; i<object[gu].length; i++){
			    $(".dongSelect").prepend(
		    		'<li><a class="dropdown-item itemDong" onclick="itemdong(this)">'+ object[gu][i] +'</a></li>'
			    );
		    }
	    });
		//@@@@@@@@@@@@@@@@@@@@@@@@@theater@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	    var urlParams = new URLSearchParams(window.location.search);
	    var theaterName = urlParams.get('theater_name');

	    // 버튼들을 선택합니다
	    var theaterButtons = $("input[name='theaterNames']");

	    // 버튼 클릭 이벤트 핸들러를 등록합니다
	    theaterButtons.on("click", function() {
	      // 이전에 선택된 버튼의 배경색을 초기화합니다
	      theaterButtons.css("background-color", "");

	      // 클릭한 버튼의 배경색을 보라색으로 변경합니다
	      $(this).css("background-color", "purple");
	    });

	    // 파라미터로 넘어온 버튼을 찾아서 해당 버튼을 클릭한 것처럼 처리합니다
	    theaterButtons.each(function() {
	      if ($(this).val() === theaterName) {
	        $(this).trigger("click");
	      }
	    });
		//@@@@@@@@@@@@@@@@@@@@@@@@@theater@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	});// document.ready END
	function itemdong(dong){
		var dong = $(dong).text();
		$('.btndong').text(dong);
	}
	</script>
</head>

<body>
    <!-- /End Preloader -->
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
	<h1> 소심함 무인택배함 </h1>
	 <!-- Example single danger button -->
	
	<div class="btn-group categoryBtn px-0 col-xl-6 col-md-12 col-sm-12 col-12 mb-2" role="group" aria-label="Basic radio toggle button group">
		<c:forEach var="i" items="${resultMap}" varStatus="status" >
			<input type="radio" class="btn-check" name="category" id="${i.key}" value="${i.key}" autocomplete="off" >
			<label class="btn btn-outline-primary" for="${i.key}">${i.key}</label>
		</c:forEach>
	</div>
	
			<hr>
				<input type="hidden" value="${theaterName}">
					<c:set var="theaterName" value="${theaterName.theater_name}"></c:set>
				<div id="img_div">
					<img src="${pageContext.request.contextPath}/resources/images/sosimham/서구.jpg" alt="서구" id="image">
				</div>
			<hr>
			<div class="menu" >
				<nav class="theater1">
					<c:forEach var="theaterName" items="${theaterNames}" varStatus="status">
						<input type="button" name="theaterNames" class="${theaterName.theater_name}" id="${theaterName.theater_name}" value="${theaterName.theater_name}">
					</c:forEach>
				</nav>
			</div>
			<hr>
			
			<div id="theater_event">
				<a href="http://localhost:8081/c5d2308t1/detail?movie_id=20203702">
				<img src="${pageContext.request.contextPath}/resources/images/강서구.jpg" alt="서구" id="image">
				</a>
			</div>
			
			<div class="btn-group">
			  <button type="button" class="btngu btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
			    구 선택
			  </button>
			  <ul class="dropdown-menu">
			  	<c:forEach var="i" items="${resultMap}" >
			    	<li><a class="dropdown-item itemGu" href="#">${i.key}</a></li>
			    </c:forEach>
			  </ul>
			  <button type="button" class="btndong btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
			    동 선택
			  </button>
			  <ul class="dropdown-menu dongSelect">
			  	<li><a class="dropdown-item itemDong" href="#">구를 먼저 선택해주세요.</a></li>
			  </ul>
			 </div>
			<ul class="tab-menu" id="menu">
		        <li class="on"><a href="movieSelect?theater_name=${theaterName.theater_name}" title="현재 선택됨">예매하기</a></li>
		        <li class="last" onclick=""><a href="theater_parking?theater_name=${theaterName.theater_name}" id="carOk">위치/주차안내</a></li>
		    </ul>
		    
		    
			<div id="theater_top">
				<div id="theater_price">
					<h3>[ 가격 안내 ]</h3>
					<table id="price_table">
						<tr>
							<th colspan="4" id="table_name">일반 2D</th>
						</tr>
						<tr>
							<th>구분</th>
							<th>타입</th>
							<th>금액</th>
						</tr>
					
						<tr>
							<th rowspan="4">인원</th>
							<td>일반</td>
							<td>15,000</td>
						</tr>
						<tr>
							<td>청소년</td>
							<td>11,000</td>
						</tr>
						<tr>
							<td>경로</td>
							<td>7,000</td>
						</tr>
						<tr>
							<td>우대</td>
							<td>5,000</td>
						</tr>
					</table>
				</div>				
				
				<div id="theater_map">
					<h3>[ 오시는 길 ]</h3>
						<div id="map">
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a75e8ce5f3bdcb17d52cf91eac1f473"></script>
							<script>
							
								var container = document.getElementById('map');
								var options = {
									center: new kakao.maps.LatLng(35.149236094733254, 129.0635624238869),
									level: 3
								};
								var map = new kakao.maps.Map(container, options);
						
								// 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(35.149278694688036, 129.06357447166218); 
					
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								    position: markerPosition
								});
					
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
							
							</script>
		
							<script>
							
							
							var selectedId;
// 								이미지 지도로 변경 및 마커스 찍기
							 function changeImage(imageSrc, lat, lng) {
							  var image = document.getElementById("image");
							  image.src = imageSrc;
							  
							  var container = document.getElementById('map');
							  var options = {
							    center: new kakao.maps.LatLng(lat, lng),
							    level: 2
							  };
							  var map = new kakao.maps.Map(container, options);
							  
							  var markerPosition = new kakao.maps.LatLng(lat, lng);
							  var marker = new kakao.maps.Marker({
							    position: markerPosition
							  });
							  marker.setMap(map);
							}
								
							
							 var locations = [
								  {
								    id: "서면삼정타워",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/삼정타워점.JPG",
								    lat: 35.15301369233767,
								    lng: 129.05962274791744
								  },
								  {
								    id: "동래",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/동래.JPG",
								    lat: 35.221414075646194,
								    lng: 129.0855232950597
								  },
								  {
								    id: "서면상상마당",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/상상마당.JPG",
								    lat: 35.15423948976798,
								    lng: 129.05748931736966
								  },
								  {
								    id: "부산명지",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/명지점.png",
								    lat: 35.09440141296223,
								    lng: 128.90351489468253
								  },
								  {
								    id: "아시아드",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/아시아드점.png",
								    lat: 35.19154582406568,
								    lng: 129.06328187601284
								  },
								  {
								    id: "센텀시티",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/센텀점.png",
								    lat: 35.1691119842877,
								    lng: 129.13038331260668
								  },
								  {
								    id: "하단아트몰링",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/동구점.png",
								    lat: 35.489848332547005,
								    lng: 129.43101483150292
								  },
								  {
								    id: "서면",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/CGV서면.png",
								    lat: 35.149278694688036,
								    lng: 129.06357447166218
								  },
								  {
								    id: "화명",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/화명점.png",
								    lat: 35.23471793459627,
								    lng: 129.00987511366884
								  },
								  {
								    id: "해운대",
								    imageSrc: "${pageContext.request.contextPath}/resources/img/해운대점.png",
								    lat: 35.1628435626128,
								    lng: 129.1584244156929
								  }
								];
							 
							 var selectedContainer = null;
							 
							 locations.forEach(function(location) {
							   var container = document.getElementById(location.id);
							   if (container) { 
							     container.onclick = function() {
							       changeImage(location.imageSrc, location.lat, location.lng);
							       selectedId = location.id; // 클릭한 위치의 ID를 변수에 저장합니다
							       var theaterElements = document.getElementsByName("theaterNames");
							       for (var i = 0; i < theaterElements.length; i++) {
							         var value = theaterElements[i].value;
							       }
							       
							       if (selectedContainer) {
							         selectedContainer.style.backgroundColor = ''; // 체크된 버튼의 배경색을 원래의 배경색으로 변경합니다
							       }
							       
							       // 선택한 버튼의 배경색을 변경합니다
							       container.style.backgroundColor = 'purple';
							       
							       // 선택한 버튼을 selectedContainer 변수에 저장합니다
							       selectedContainer = container;
							       
							       changeImageIfNeeded();
							     };
							   }
							 });



							 var buttons = document.querySelectorAll('input[type="button"]');
							 buttons.forEach(function(button) {
							   button.addEventListener('click', function(event) {
							     // 선택된 버튼의 아이디 값을 가져와서 변수에 저장
							     selectedId = event.target.id;
							   });
							 });

							 document.querySelector('.on a').addEventListener('click', function(event) {
							   event.preventDefault();
							   var url = event.target.href;
							   if (selectedId) {
							     url += selectedId;
							   }
							   window.location.href = url;
							 });
							 
							 document.querySelector('.last a').addEventListener('click', function(event) {
							   event.preventDefault();
							   var url = event.target.href;
							   if (selectedId) {
							     url += selectedId;
							   }
							   window.location.href = url;
							 });

							</script>
						</div>
					</div>
				</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<footer class="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

</body>

</html>