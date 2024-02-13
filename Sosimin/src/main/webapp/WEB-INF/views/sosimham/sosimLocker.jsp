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
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
    
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sosimham/sosimham.css" />
    
    <!--  icon  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
    
<!--     <link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css"> -->
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<!--     <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet"> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	
	
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
		if(dong == '초량동'){
			changeImage(
					"${pageContext.request.contextPath}/resources/images/sosimham/초량동.jpg"
					, 35.121209637658666
					, 129.03976168551299);
		}else if(dong == '좌천동'){
			changeImage(
					"${pageContext.request.contextPath}/resources/images/sosimham/좌천동.jpg"
					, 35.13032932937977
					, 129.04911568191497);
		}
			
			
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
                        <li><a href="./"><i class="lni lni-home"></i>홈</a></li>
                        <li>소심함 위치 정보</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
	<div class="about-section">
	  <h1>소심함이란?</h1>
	  <p><span class="sosimColor">소심한</span> 시민들을 위한 중고거래를</p>
	  <p>안전하고 편리하게 하기위한 <span class="sosimColor">무인 물품 보관함</span> </p>
	</div>
   	<div class="menu" >
		<div class="btn-group">
		  <button type="button" class="btngu btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		    구 선택
		  </button>
		  <ul class="dropdown-menu">
		  	<c:forEach var="i" items="${resultMap}" >
		    	<li><a class="dropdown-item itemGu ${i.key}" id="${i.key}" value="${i.key}" name="GuNames">${i.key}</a></li>
		    </c:forEach>
		  </ul>
		  <button type="button" class="btndong btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		    동 선택
		  </button>
		  <ul class="dropdown-menu dongSelect">
		  	<li><a class="dropdown-item itemDong" href="#">구를 먼저 선택해주세요.</a></li>
		  </ul>
		 </div>
	 </div>
	
	
	<div id="theater_top">
				<div id="theater_price">
					<h3>소심함 위치</h3>
					<div id="img_div">
						<img src="${pageContext.request.contextPath}/resources/images/sosimham/진구.jpg" alt="진구" id="image">
					</div>
				</div>				
				
				<div id="theater_map">
					<h3>오시는 길</h3>
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
								  },
								  {
								    id: "초량동",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/초량동.jpg",
								    lat: 35.121209637658666,
								    lng: 129.03976168551299
								  },
								  {
								    id: "좌천동",
								    imageSrc: "${pageContext.request.contextPath}/resources/images/sosimham/좌천동.jpg",
								    lat: 35.13032932937977,
								    lng: 129.04911568191497
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


							</script>
						</div>
					</div>
				</div>
	<div class="container">
		<div class="row justify-content-center">
	    <div class="col-4">
	    	<h4>서비스 이용 방법<br><br></h4>
	    	1. 물품 판매 시 "<span class="sosimColor">소심함</span> 사용"을 체크<br>
	    	2. 판매자는 원하는 시간대에 아래의 위치에 있는 소심함에 물건을 넣는다.<br>
	    	3. 구매자에게 판매 물품의 위치를 채팅으로 알려준다.<br>
	    	4. 구매자는 해당 위치의 물건을 확인하고 입금 또는 현금거래를 한다.<br>
	    	5. 판매자에게 비밀번호를 받고 해당 소심함을 열어 물건을 꺼낸다.<br>
	    	6. 물품의 보관기간은 기본 3 일을 기준으로 하고 최장 1 주일까지로 한다.<br>
	    	7. 무인택배함의 구성은 전체 64개 박스로 구성합니다.<br>
	    	(대형 2 개, 중대형 2 개, 중형 6 개, 중소형 36 개, 소형 18 개로구성합니다)<br>
	    	8. 각 박스는 개별 스마트 전자키가 부착된 독립형 박스로 구성됩니다.<br>
	    </div>
	    <div class="col-4">
			<h4>사용가능한 <span class="sosimColor">소심함</span> 위치 목록</h4><br>
			<span class="juso">구 :</span><br> 
			<c:forEach var="gu" items="${resultMap}">
				${gu.key},&nbsp; 
			</c:forEach>
			<br><br>
			<span class="juso">동 :</span><br> 
			<c:forEach var="dong" items="${resultMap}">
				${dong.value}
			</c:forEach>
			<br>
	    </div>
	    </div>
  	</div>
				
				
	<div class="about-section">
		<h1>소심함 사용시 의무와 책임</h1>
		<p>판매자 및 이용자 주의 의무 및 사용금지항목 안내</p>
	</div>
				
	<div class="container">
	 	<div class="row justify-content-center">
		  	<div class="col-sm-8">
				<h5>이용 및 사용금지 조치</h5><br>
					1. 무인보관함(소심함)에 들어가 장난을 치는 경우<br>
					(무인보관함(소심함)에 사람이나 동물 등을 유도해 넣고 도어를 잠그는 행위 등)<br>
					2. 무인보관함(소심함)을 파손하는 행위<br>
					3. 무인보관함(소심함)에 맡겨진 물건을 3 회 이상 일부러 찾아가지 않아 다른 사용자가 사용하지 못하게 하는 행위를 한때<br>
					4. 무인보관함(소심함)에 맡겨진 물건을 3 일 이상 보관되는 행위가 3 회 이상 반복될 때<br><br>
					<h5>판매자의 주의 의무</h5><br>
					1. 무인보관함(소심함) 현장관리요원(보안상황실 보안원)에게 폭언을 행하거나, 무인보관함(소심함)을 파손 또는 훼손하는 자<br>
					2. 공장동이나 상가 입주민의 택배물을 무인보관함(소심함)에 맡기는 경우<br>
					3. 기타 무인보관함(소심함) 운영과 관련하여 수회 민원이 발생한 판매자<br><br>
					<h5>이용자 주의 의무</h5><br>
					① 이용자(소시민 서비스 이용자)는 본 운영규정에 의한 관리자 및 운영자 조치에 적극
					협조하여야 하며, <br>다음 각호의 사항에 대해서는 관리자 및 운영자에게
					배상의무 및 책임을 요구할 수 없다.<br>
					1. 이용자가 생물(한우, 어패류 선물세트 등 부패하기 쉬운 택배물)을
					무인보관함(소심함)에 보관하여 자연 부패했을 경우<br>
					2. 이용자가 판매자로부터 통보받은 비빌번호나 무인보관함(소심함) 번호를
					분실하였을 경우<br>
					3. 무인보관함(소심함)에 1 주일 이상 장기간 보관하여 운영자에 의해 강제로 택배함
					문을 개방하여 해당 물건을 판매자에게 반려된 경우<br>
					4. 보관중인 물건에서 악취나 물 등이 흘러 계속 보관하기 어려운 상황에
					따라 운영자에 의해 강제로 문을 개방하여 해당 택배물을 꺼낸 경우<br>
					② 이용자는 무인보관함(소심함)을 사용 중 부주의나 고의로 파손하였을 경우 배상
					책임이 있다.<br><br>
					<h5>무인보관함(소심함) 물품 보관기간</h5><br>
					① 무인보관함(소심함)(64 개)은 적절한 순환이용을 위해서 보관함 내 장기 보관행위가 없도록 적극 통제한다.<br>
					② 이용자가 판매자로부터 무인보관함(소심함) 번호와 비밀번호를 통보받은
					후에도 본인의 물건을 회수하지 않는 경우 그 물건의 보관기간은 기본
					3 일을 기준으로 하고 최장 1 주일까지로 한다.<br>
					③ 1 주일이 지나도 회수되지 않은 물건은 운영자에 의해 강제로 개방되어
					물건을 해당 판매자에게 반려조치 한다<br>
					<br>
					<br>
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