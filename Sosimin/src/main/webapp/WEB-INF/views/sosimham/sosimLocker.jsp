<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>Sosimin</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
	
	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	
	
	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">소심함 위치 정보</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li>소심함 위치 정보</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
	
			<hr>
<!-- 			<div class="menu" > -->
<!-- 				<nav class="theater1"> -->
<%-- 					<c:forEach var="GuName" items="${ListGu}" varStatus="status"> --%>
<%-- 						<input type="button" name="GuNames" class="${GuName}" id="${GuName}" value="${GuName}"> --%>
<%-- 					</c:forEach> --%>
<!-- 				</nav> -->
<!-- 			</div> -->
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
			<hr>
			
			
<!-- 	    	<div class="btn-group categoryBtn px-0 col-xl-6 col-md-12 col-sm-12 col-12 mb-2" role="group" aria-label="Basic radio toggle button group"> -->
<%-- 				<c:forEach var="i" items="${resultMap}" varStatus="status" > --%>
<%-- 					<input type="radio" class="btn-check" name="category" id="${i.key}" value="${i.key}" autocomplete="off" > --%>
<%-- 					<label class="btn btn-outline-primary" for="${i.key}">${i.key}</label> --%>
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
		    
			<div id="theater_top">
				<div id="theater_price">
					<h3>[ 택배 보관함 위치 ]</h3>
					<div id="img_div">
						<img src="${pageContext.request.contextPath}/resources/images/sosimham/진구.jpg" alt="진구" id="image">
					</div>
				</div>				
				
				<div id="theater_map">
					<h3>[ 오시는 길 ]</h3>
						<div id="map">
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a75e8ce5f3bdcb17d52cf91eac1f473"></script>
							<script>
							
								var container = document.getElementById('map');
								var options = {
									center: new kakao.maps.LatLng(35.16283791857152, 129.0531628083784),
									level: 3
								};
								var map = new kakao.maps.Map(container, options);
						
								// 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(35.16283791857152, 129.0531628083784); 
					
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
								    id: "부산진구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/진구.jpg",
								    lat: 35.16283791857152,
								    lng: 129.0531628083784
								  },
								  {
								    id: "강서구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/강서구.jpg",
								    lat: 35.21219886170481,
								    lng: 128.98057003047273
								  },
								  {
								    id: "동래구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/동래구.jpg",
								    lat: 35.19630797610848,
								    lng: 129.09387772556312
								  },
								  {
								    id: "금정구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/금정구.jpg",
								    lat: 35.242845042663966,
								    lng: 129.09208055902218
								  },
								  {
								    id: "남구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/남구.jpg",
								    lat: 35.13654456628705,
								    lng: 129.08427447872236
								  },
								  {
								    id: "동구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/동구.jpg",
								    lat: 35.129291948140526,
								    lng: 129.04531078712344
								  },
								  {
								    id: "북구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/북구.jpg",
								    lat: 35.197384443559564,
								    lng: 128.990134815883
								  },
								  {
								    id: "사상구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/사상구.jpg",
								    lat: 35.152502576684626,
								    lng: 128.9914411323253
								  },
								  {
								    id: "사하구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/사하구.jpg",
								    lat: 35.10448114972414,
								    lng: 128.97491129253802
								  },
								  {
								    id: "서구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/서구.jpg",
								    lat: 35.097992866568646,
								    lng: 129.0243281161757
								  },
								  {
								    id: "수영구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/수영구.jpg",
								    lat: 35.145458797615035,
								    lng: 129.11316701614936
								  },
								  {
								    id: "연제구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/연제구.jpg",
								    lat: 35.17623288805716,
								    lng: 129.07974208388646
								  },
								  {
								    id: "영도구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/영도구.jpg",
								    lat: 35.09131768458653,
								    lng: 129.0679510693063
								  },
								  {
								    id: "중구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/중구.jpg",
								    lat: 35.106225641630374,
								    lng: 129.0323725506374
								  },
								  {
								    id: "해운대구",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/해운대구.jpg",
								    lat: 35.16308713064507,
								    lng: 129.16358565267765
								  }
								];
							 
							 var selectedContainer = null;
							 
							 locations.forEach(function(location) {
							   var container = document.getElementById(location.id);
							   if (container) { 
							     container.onclick = function() {
							       changeImage(location.imageSrc, location.lat, location.lng);
							       selectedId = location.id; // 클릭한 위치의 ID를 변수에 저장합니다
							       var GuElements = document.getElementsByName("GuNames");
							       for (var i = 0; i < GuElements.length; i++) {
							         var value = GuElements[i].value;
							       }
							       
							       if (selectedContainer) {
							         selectedContainer.style.backgroundColor = ''; // 체크된 버튼의 배경색을 원래의 배경색으로 변경합니다
							       }
							       
							       // 선택한 버튼의 배경색을 변경합니다
							       container.style.backgroundColor = '#39d274';
							       container.style.Color = '#fff';
							       
							       // 선택한 버튼을 selectedContainer 변수에 저장합니다
							       selectedContainer = container;
							       
							       changeImageIfNeeded();
							     };
							   }
							 });



// 							 var buttons = document.querySelectorAll('input[type="button"]');
// 							 buttons.forEach(function(button) {
// 							   button.addEventListener('click', function(event) {
// 							     // 선택된 버튼의 아이디 값을 가져와서 변수에 저장
// 							     selectedId = event.target.id;
// 							   });
// 							 });

// 							 document.querySelector('.on a').addEventListener('click', function(event) {
// 							   event.preventDefault();
// 							   var url = event.target.href;
// 							   if (selectedId) {
// 							     url += selectedId;
// 							   }
// 							   window.location.href = url;
// 							 });
							 
// 							 document.querySelector('.last a').addEventListener('click', function(event) {
// 							   event.preventDefault();
// 							   var url = event.target.href;
// 							   if (selectedId) {
// 							     url += selectedId;
// 							   }
// 							   window.location.href = url;
// 							 });

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