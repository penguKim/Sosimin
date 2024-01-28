<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Sosimin</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

<!-- ========================= 자바스크립트 시작 ========================= -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script>
<%-- 무한스크롤 적용을 위해 페이지번호 부여 --%>
let pageNum = "1";
let maxPage = "";
let pay_history_type = "";

$(function() {
	<%-- 뒤로가기 방지 --%>
	window.addEventListener('pageshow', function(event) { <%-- 페이지가 로드되거나 새로고침 발생 이벤트 --%>
		if (event.persisted) { <%-- 뒤로가기나 앞으로가기로 이동했을 시 true 리턴 --%>
		    location.reload(); <%-- 페이지 새로고침 --%>
		}
	});	
	
	<%-- 게시물 목록 불러오기 --%>
	load_list();
	
		
	$(window).scroll(function() {
		let scrollTop = $(window).scrollTop(); // 스크롤바 현재 위치
		let windowHeight = $(window).height(); // 브라우저 창 높이
		let documentHeight = $(document).height(); // 문서 높이
// 		console.log("scrollTop : " + scrollTop + ", windowHeight : " + windowHeight + ", documentHeight : "+ documentHeight);
			
		if(scrollTop + windowHeight + 1 >= documentHeight) {
			pageNum++; // 페이지번호 1 층가
			
			// 페이지 번호를 계속 불러오는 현상 막기
			if(maxPage != "" && pageNum <= maxPage) {
				load_list();
			}
		}
		
	});
	
	<%-- 모아보기 버튼을 클릭하면 파라미터를 넘기며 주소를 새로 요청함 --%>
	$(".btn-check").change(function() {
		let pay_history_type = $(this).val();
		location.href="PayInfo?pay_history_type="+pay_history_type;
	});

	
});

<%-- 게시물 목록을 AJAX와 JSON으로 처리하는 함수 --%>
function load_list() {
	<%-- 가입자의 이용내역을 불러오기 위해 pay_id 저장 --%>
	let pay_id = $("#pay_id").val();
	<%-- 타입별 모아보기 버튼을 위해 변수에 파라미터 값 저장 --%>
	pay_history_type = "${param.pay_history_type}"
	console.log("pay_history_type = " + pay_history_type + ", pay_id = " + pay_id + ", pageNum = " + pageNum);
	
	<%-- 파라미터값과 일치하는 체크박스 체크 --%>
	$(".btn-check").each(function() {
		if ($(this).val() === pay_history_type) {
			$(this).prop("checked", true);
			return false; // 반복문 종료
		}
	});
	
	<%-- 서블릿 요청 --%>
	$.ajax({
		type: "GET",
		url: "PayHistoryJson",
		data: {
			"pay_id": pay_id,
			"pay_history_type": pay_history_type,
			"pageNum": pageNum
		},
		dataType: "json",
		success:  function(data) {
			console.log(data);
			
			for(let item of data.payHistoryList) {
				let pay_list_year = JSON.parse(item.json_result);
				for (let year in pay_list_year) {
					console.log("? " + year);
					
					// 연도별로 영역을 만들고 상단에 연도 출력
					$("#payHistoryList").append(
		 				'<div id="'+ year +'"><span id="year">' + year + '</span>년<div>'
		 			)
					
					let pay_list_day = pay_list_year[year];
					
					for (let day in pay_list_day) {
						console.log("? " + day);
						// 날짜별로 ul 생성하기
						$("#"+ year +"").append(
		 					'<ul class="day" id="' + day + '">'
		 					+	'<li class="date_list" id=' + day + 'list>'
	 						+    	'<div class="date_area">'
	  				        +        	'<p>' + day + '</p>'
	  				        +    	'</div>'
		 					+	'</li>'
							+'</ul>'
						);
						let payment_list = pay_list_day[day];
				      for (let history of payment_list) {
				    	  console.log(history);
				    	  
						// pay_history_date 값을 분리하여 날짜와 시간을 추출
						var date = history.pay_history_date.slice(5, 10);
						var time = history.pay_history_date.slice(11, 16);
						
						// pay_history_type 값에 따라 다른 결과 출력
						let pay_history_type = "";
						let subject = "";
						if(history.pay_history_type == "1") {
							pay_history_type = "충전";
							subject = "페이충전";
						} else if(history.pay_history_type == "2") {
							pay_history_type = "환급";
							subject = "페이환급";
						} else if(history.pay_history_type == "3") {
							pay_history_type = "사용";
							subject = history.order_id;
						} else if(history.pay_history_type == "4") {
							pay_history_type = "수익";
							subject = history.order_id;
						}
				    	  
				    	  $("#"+ date +"list").append(
				    			'<div class="list_area col-lg-9 col-md-9 col-12">'
		 						+	'<div class="row content_list">'
		  				        +      '<div class="col-lg-7 col-md-7 col-12">'
		  				        +          '<h5 class="product-name">' + subject + '</h5>'
		  				        +          '<p class="pay-info-sub">'
		  				        +        		time + ' | '
		  				        +               pay_history_type
		  				        +          '</p>'
		  				        +      '</div>'
		  				        +      '<div class="col-lg-5 col-md-5 col-12">'
		  				        +          '<h5 class="pay-amount">' + history.pay_amount + '</h5>'
		  				        +          '<p class="pay-balance-sub">'
		  				        +					history.pay_history_balance
		  				        +          '</p>'
		  				        +      '</div>'
		  				        +	'</div>'
		  				        +'</div>'
						  );
// 				
// 					// 끝페이지 번호(maxPage) 값을 변수에 저장
// 					maxPage = data.maxPage;    
						}
					}
				}
			}	
			
		},
		error: function(request, status, error) {
	      // 요청이 실패한 경우 처리할 로직
	      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
		}
	});
	
}






</script>
</head>
<body>
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
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
                        <h1 class="page-title">페이정보</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li>페이정보</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
	
<!-- ============================================ 메인영역 시작 ================================================================= -->	
	 <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="card login-form pay-card">
                        <div class="card-body">
                            <div class="title paytitle">
                                <h3 class="user-name">${sessionScope.sId} 님</h3> <!-- 사용자프로필/sId -->
                                <h3 class="pay-name">
                                	<img src="${pageContext.request.contextPath}/resources/images/favicon.svg" height="35px">
                                	소심페이
                                </h3>
                            </div>
                            <div class="row">
	                           	<div class="pay-info col-lg-6 col-md-6 col-12">
									페이잔액
								</div>
	                           	<div class="pay-balance col-lg-6 col-md-6 col-12">
									${payInfo.pay_balance} 원
								</div>
								<input type="hidden" value="${payInfo.pay_id}" id="pay_id">
	                            <div class="button col-lg-6 col-md-6 col-12">
	                                <button class="btn" onclick="location.href='PayCharge'">충전하기</button>
	                            </div>
	                            <div class="button col-lg-6 col-md-6 col-12">
	                                <button class="btn" onclick="location.href='PayRefund'">환급하기</button>
	                            </div>
                            </div>
                        </div>
                     </div>   
                     <div class="card login-form">   
                        <div class="card-body">
                           	<div class="btn-group col">
						        <input type="radio" name="options" class="btn-check" id="btn-check1" value="" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check1">전체</label>
						        <input type="radio" name="options" class="btn-check" id="btn-check2" value="1" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check2">충전</label>
						        <input type="radio" name="options"class="btn-check" id="btn-check3" value="2" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check3">환급</label>
						        <input type="radio" name="options" class="btn-check" id="btn-check4" value="3" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check4">사용</label>
						        <input type="radio" name="options" class="btn-check" id="btn-check5" value="4" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check5">수익</label>
							</div>
							<div id="period_select">전체기간 <i class="fa fa-caret-down"></i></div>
							<hr>
							<div id="period_info">
								<div id="info_left">총 0건</div>
								<div id="info_right">2023.01.28 ~ 2024.01.28</div>
							</div>
							<hr>
							
							<div id="payHistoryList">
								<%-- 페이사용 내역이 출력되는 영역 --%>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


	
	
<!-- ============================================ 메인영역 끝 ================================================================= -->	
	<footer class="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</body>
</html>