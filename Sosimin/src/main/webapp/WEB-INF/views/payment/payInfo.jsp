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

<!-- ========================== 달력 ===================================== -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- ========================= 자바스크립트 시작 ========================= -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script>
<%-- 무한스크롤 적용을 위해 페이지번호 부여 --%>
let pageNum = "1";
let maxPage = "";
let pay_history_type = "";
let start_date = "";
let end_date = "";

$(function() {
	<%-- 뒤로가기 방지 --%>
	window.addEventListener('pageshow', function(event) { <%-- 페이지가 로드되거나 새로고침 발생 이벤트 --%>
		if (event.persisted) { <%-- 뒤로가기나 앞으로가기로 이동했을 시 true 리턴 --%>
		    location.reload(); <%-- 페이지 새로고침 --%>
		}
	});	
	
	<%-- 게시물 목록 불러오기 --%>
	load_list(pay_history_type, start_date, end_date);
	
	$(window).scroll(function() {
		let scrollTop = $(window).scrollTop(); // 스크롤바 현재 위치
		let windowHeight = $(window).height(); // 브라우저 창 높이
		let documentHeight = $(document).height(); // 문서 높이
// 		console.log("scrollTop : " + scrollTop + ", windowHeight : " + windowHeight + ", documentHeight : "+ documentHeight);
			
		if(scrollTop + windowHeight + 1 >= documentHeight) {
			pageNum++; // 페이지번호 1 층가
			
			// 페이지 번호를 계속 불러오는 현상 막기
			if(maxPage != "" && pageNum <= maxPage) {
				load_list(pay_history_type, start_date, end_date);
			}
		}
		
	});
	
	<%-- 모아보기 버튼을 클릭하면 에이젝스를 새로 요청함 --%>
	$("[name='options']").change(function() {
		pay_history_type = $(this).val();
		
		// div영역과 pageNum을 초기화
		$("#payHistoryList").html("");
		pageNum = "1";
		load_list(pay_history_type, start_date, end_date);
	});
	
	<%-- 기간 선택 버튼을 클릭하면 자동으로 날짜가 채워짐 --%>
	$("[name='period']").change(function() {
		// 체크박스 다중선택 막기
		if($(this).prop('checked')){	 
			$('input[type="checkbox"][name="period"]').prop('checked',false);
			$(this).prop('checked',true);
		}

		// 체크된 체크박스의 값을 가져와서 변수에 저장
		let period = parseInt($(this).val());
		
// 		console.log(period);
		
		// 오늘 날짜를 불러와서 end_date에 저장
		let today = new Date();
		let split_end_date = today.toISOString().split("T");
		let end_date = split_end_date[0];
		console.log(end_date);

		$("#end_date").val(end_date);

		// 오늘 날짜에서 버튼에 적힌 개월수만큼을 빼서 start_date에 저장
		var monthAgo = new Date(today.setMonth(today.getMonth() - period));
		console.log(monthAgo);
		let split_stert_date = monthAgo.toISOString().split("T");
		let start_date = split_stert_date[0];
		console.log(start_date);

		$("#start_date").val(start_date);
		
	});
	
	<%-- 날짜를 수정할 때 날짜 판별 --%>
	<%-- 시작날짜 --%>
	$("#start_date").click(function() {
		// 현재 날짜보다 미래이면 안됨
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		// new Date(today-timeOff).toISOString()은 '2024-01-30T11:48'를 반환
		var today = new Date(now_utc-timeOff).toISOString().substring(0, 10);
		
		$("#start_date").attr("max", today);
	});
	
	$("#start_date").change(function() {
		// 끝날짜보다 미래이면 안됨
		let start_date_real = new Date($("#start_date").val());
		let end_date_real = new Date($("#end_date").val());
		
		if (start_date_real > end_date_real) {
			$("#start_date").val("");
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '마지막 날짜보다 이전의 날짜를 선택해주세요.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
		}
		
// 		console.log("체크 " + end_date);
		
		// 간격이 1년 이상 벌어지면 안됨
		// 두 날짜 사이의 차이를 계산
		let timeDiff = Math.abs(end_date_real.getTime() - start_date_real.getTime());
		
		// 계산한 값을 일 단위로 변환
		let diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
		
		// 1년(365일) 이상 차이나는지 판별합니다.
		if (diffDays >= 365) {
			$("#start_date").val("");
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '1년 이내의 기간만 검색 가능합니다.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
		} 
	});
	

	<%-- 끝날짜 --%>
	$("#end_date").click(function() {
		// 현재날짜보다 미래이면 안됨
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		// new Date(today-timeOff).toISOString()은 '2024-01-30T11:48'를 반환
		var today = new Date(now_utc-timeOff).toISOString().substring(0, 10);
		
		$("#end_date").attr("max", today);
		
	});
	
	$("#end_date").change(function() {
		// 시작날짜보다 과거이면 안됨
		var start_date_real = new Date($("#start_date").val());
		var end_date_real = new Date($("#end_date").val());
		
		if (start_date_real > end_date_real) {
			$("#end_date").val("");
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '시작 날짜보다 이후의 날짜를 선택해주세요.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
		}
		
		console.log("체크 " + start_date);
		
		// 간격이 1년 이상 벌어지면 안됨
		// 두 날짜 사이의 차이를 계산
		let timeDiff = Math.abs(end_date_real.getTime() - start_date_real.getTime());
		
		// 계산한 값을 일 단위로 변환
		let diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
		
		// 1년(365일) 이상 차이나는지 판별합니다.
		if (diffDays >= 365) {
			$("#end_date").val("");
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '1년 이내의 기간만 검색 가능합니다.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
		} 		
		
	});
	
	
	$("#withdrawPay").click(function() {
		
		if (!$("input:checkbox[name=agree]").prop("checked")) {
	    	Swal.fire({
				position: 'center',
				icon: 'error',
				title: '설명을 읽고 동의 해주세요.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
		} else {
			Swal.fire({
		        title: "정말로 소심페이를 탈퇴하시겠습니까?",
		        text: "탈퇴를 누르시면 탈퇴가 진행됩니다.",
		        icon: 'question',
		        showCancelButton: true,
		        confirmButtonColor: '#39d274',
		        cancelButtonColor: '#d33',
		        confirmButtonText: "탈퇴",
		        cancelButtonText: '취소',
		        reverseButtons: true,
		    }).then((result) => {
		    	if (result.isConfirmed) {
		    		location.href="PayWithdraw?pay_id=${payInfo.pay_id}";
			    } else {
					 event.preventDefault();
				}
		    }); 	
		}

	});
	
	
});

<%-- 게시물 목록을 AJAX와 JSON으로 처리하는 함수 --%>
function load_list(pay_history_type, start_date, end_date) {
	
	<%-- 가입자의 이용내역을 불러오기 위해 pay_id 저장 --%>
	let pay_id = $("#pay_id").val();
	
	<%-- 타입별 모아보기 버튼을 위해 변수에 파라미터 값 저장 --%>
	let type = pay_history_type;
	console.log("pay_history_type = " + type + ", pay_id = " + pay_id + ", pageNum = " + pageNum);
	
	<%-- 날짜 검색을 위해 파라미터값 저장 --%>
	let start = start_date;
	let end = end_date;
	console.log("start_date = " + start + ", end_date = " + end);
	
	
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
			"pay_history_type": type,
			"pageNum": pageNum,
			"start_date": start,
			"end_date": end
		},
		dataType: "json",
		success:  function(data) {
			
			console.log(data.payHistory);
			
			if(data.listCount == 0) {
				$("#payHistoryList").append("<div id='list_none'>사용 내역이 없습니다</div>");
			}
	
			$("#info_left").html("총 <span>" + data.listCount + "</span>건");
			
			// 연도별로 그룹화할 객체 생성
			let groupedData = {};

			// payHistoryList를 순회하며 연도별로 그룹화
			for (let item of data.payHistoryList) {
				let year = new Date(item.pay_history_date).getFullYear();
  
				if (!groupedData[year]) {
					groupedData[year] = [];
				}
  
				groupedData[year].push(item);
			}

			// 그룹화된 데이터를 이용하여 각 연도별로 div 영역에 추가
			let years = Object.keys(groupedData).reverse(); // 연도 속성을 반대로 순회할 배열 생성
			for (let year of years) {
				
				if($("#" + year).length === 0) {
					$("#payHistoryList").append(
						'<div id="'+ year +'">'
						+	'<span id="year">' + year + '</span>년'
						+	'<div class="year_list" id="' + year + 'list"></div>'
						+ '</div>'
					);
				}
				
				const paymentArray = groupedData[year]; // 데이터 배열

				for (let history of paymentArray) {
					console.log("history:" + history.buy_product_id);
					// pay_history_date 값을 분리하여 날짜와 시간을 추출
					let date = history.pay_history_date.slice(5, 10);
					let time = history.pay_history_date.slice(11, 16);
					
					// pay_history_type 값에 따라 다른 결과 출력
					let pay_history_type = "";
					let subject = "";
					if(history.pay_history_type == "1") {
						pay_history_type = "충전";
						subject = history.pay_history_message;
					} else if(history.pay_history_type == "2") {
						pay_history_type = "환급";
						subject = history.pay_history_message;
					} else if(history.pay_history_type == "3") {
						pay_history_type = "사용";
						if (!history.buy_product_id || history.buy_product_id === 'null') {
						    subject = "취소된 거래입니다";
						} else {
							subject = '<a href="ProductDetail?product_id=' + history.buy_product_id +'">' + history.buy_product_name + '</a><i class="fa fa-angle-right"></i>';
						}
					} else if(history.pay_history_type == "4") {
						pay_history_type = "수익";
						subject = '<a href="ProductDetail?product_id=' + history.sell_product_id +'">' + history.sell_product_name + '</a><i class="fa fa-angle-right"></i>';
					}
					
					let pay_amount = history.pay_amount.toLocaleString();
					let pay_history_balance = history.pay_history_balance.toLocaleString();
			    	  
			    	  $("#" + year + "list").append(
	 						'<div class="row content_list">'
	  				        +     '<div class="col-lg-2 col-md-2 col-12">'
	  				        +         '<h5 class="pay_date">' + date + '</h5>'
	  				        +     '</div>'
	  				        +     '<div class="col-lg-7 col-md-7 col-12 subject-area">'
	  				        +         '<h5 class="product-name">' 
	  				        + 				subject 
	  				        +		  '</h5>'
	  				        +         '<p class="pay-info-sub">'
	  				        +        		time + ' | '
	  				        +               pay_history_type
	  				        +         '</p>'
	  				        +     '</div>'
	  				        +     '<div class="col-lg-3 col-md-3 col-12">'
	  				        +          '<h5 class="pay-amount">' + pay_amount + '</h5>'
	  				        +          '<p class="pay-balance-sub">'
	  				        +				pay_history_balance
	  				        +         '</p>'
	  				        +     '</div>'
	  				        +'</div>'

						);
// 				
// 					// 끝페이지 번호(maxPage) 값을 변수에 저장
					maxPage = data.maxPage;
// 					console.log("maxPage" + maxPage);			
				}	
			}
		},
		error: function(request, status, error) {
	      // 요청이 실패한 경우 처리할 로직
	      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
		}
	});
	
}

<%-- 모달창에 있는 조회하기 버튼을 눌렀을 때 --%>
function select_date() {
	
	start_date = $("#start_date").val();
	end_date = $("#end_date").val();
	
	// div영역과 pageNum을 초기화
	$("#payHistoryList").html("");
	pageNum = "1";
	load_list(pay_history_type, start_date, end_date);
	
	$('#date_modal').modal('hide');
	
	// 입력한 기간을 판별하여 기간 영역에 넣기
	if($("input[name='period']:checked").val() != null && $("input[name='period']:checked").val() != "") {
		let checked = $("input[name='period']:checked").val();
		
		if($("input[name='period']:checked").val() == 12) {
			$("#info_right").html("1년");
		} else {
			$("#info_right").html(checked +"개월");
		}
		
	} else if(start_date != "" && end_date != "") {
		$("#info_right").html(start_date + " ~ " + end_date);
	} else {
		$("#info_right").html("전체기간");
	}
	
	$('input[name="period"]').prop('checked', false);
	
}




// 임시로 테스트용 거래수락 버튼 추가
function acceptPayment() {
	// 채팅방에서 produtct_id 들고오기
	event.preventDefault();
	Swal.fire({
        title: "거래를 수락하시겠습니까?",
        text: "확인을 누르시면 거래가 진행됩니다.",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#39d274',
        cancelButtonColor: '#d33',
        confirmButtonText: "수락",
        cancelButtonText: '취소',
        reverseButtons: true,
    }).then((result) => {
    	if (result.isConfirmed) {
			<%-- 서블릿 요청 --%>
			$.ajax({
				type: "GET",
				url: "AcceptPayment",
				data: {
					"product_id": 57,
					"product_buyer": "leess"
				},
				success:  function(data) {
					if(data == "not-login") {
						Swal.fire({
							icon: 'warning',
							title: '로그인을 해주세요!',
							text: '로그인 페이지로 이동합니다!',
							allowOutsideClick: false
						}).then((result) => {
								location.href="MemberLogin";
						});	
					} else if(data == "ordered") {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '이미 수락한 거래입니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});	
					} else if(data == "true") {
						Swal.fire({
							position: 'center',
							icon: 'success',
							title: '거래를 수락했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
					} else if(data == "inconsistency") {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '판매자 정보가 일치하지 않습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});				
					} else {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '거래 수락을 실패했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});			
					}
				},
				error: function(request, status, error) {
			      // 요청이 실패한 경우 처리할 로직
			      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
				}
			});
		} else {
    		 event.preventDefault();
		}
    });
}

// 임시로 테스트용 결제하기 버튼 추가
function payment() {
	// 채팅방에서 produtct_id 들고오기
	event.preventDefault();
	Swal.fire({
        title: "결제하시겠습니까?",
        text: "확인을 누르시면 결제가 완료됩니다.",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#39d274',
        cancelButtonColor: '#d33',
        confirmButtonText: "결제",
        cancelButtonText: '취소',
        reverseButtons: true,
    }).then((result) => {
    	if (result.isConfirmed) {
			location.href="Payment?product_id=57";
    	} else {
			event.preventDefault();
		}
   });
}

// 임시로 테스트용 구매확정 버튼 추가(에이젝스)
function confirmPayment() {
	// 채팅방에서 produtct_id 들고오기
// 	location.href="ConfirmPayment?product_id=303";
	event.preventDefault();
	Swal.fire({
        title: "구매를 확정하시겠습니까?",
        text: "확인을 누르시면 거래가 완료됩니다.",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#39d274',
        cancelButtonColor: '#d33',
        confirmButtonText: "확인",
        cancelButtonText: '취소',
        reverseButtons: true,
    }).then((result) => {
    	if (result.isConfirmed) {
			<%-- 서블릿 요청 --%>
			$.ajax({
				type: "GET",
				url: "ConfirmPayment",
				data: {
					"product_id": 57
				},
				success:  function(data) {
					if(data == "not-login") {
						Swal.fire({
							icon: 'warning',
							title: '로그인을 해주세요!',
							text: '로그인 페이지로 이동합니다!',
							allowOutsideClick: false
						}).then((result) => {
								location.href="MemberLogin";
						});	
					} else if(data == "true") {
						Swal.fire({
							position: 'center',
							icon: 'success',
							title: '구매를 확정했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
					} else if(data == "none") {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '구매 확정 가능한 상품이 없습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});				
					} else if(data == "inconsistency") {
							Swal.fire({
								position: 'center',
								icon: 'error',
								title: '구매자 정보가 일치하지 않습니다.',
								showConfirmButton: false,
								timer: 2000,
								toast: true
						});			
					} else if(data == "unpaid") {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '결제를 먼저 진행해주세요.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});			
					} else if(data == "not-access_token") {
						Swal.fire({
							icon: 'warning',
							title: '계좌 인증이 필요합니다',
							text: '계좌 인증 페이지로 이동합니다.',
							allowOutsideClick: false
						}).then((result) => {
								location.href="AccountVerification";
						});	
					} else if(data == "not-payInfo") {
						Swal.fire({
							icon: 'warning',
							title: '계좌 등록이 필요합니다',
							text: '계좌 등록 페이지로 이동합니다.',
							allowOutsideClick: false
						}).then((result) => {
								location.href="AccountRegist";
						});	
					} else {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '구매 확정을 실패했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});			
					}
			
				},
				error: function(request, status, error) {
			      // 요청이 실패한 경우 처리할 로직
			      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
				}
			});
    	} else {
			event.preventDefault();
		}
   });
	
}

// 임시로 테스트용 거래중단 버튼 추가(에이젝스)
function stopPayment() {
	// 채팅방에서 produtct_id 들고오기
	event.preventDefault();
	Swal.fire({
        title: "거래를 중단하시겠습니까?",
        text: "확인을 누르시면 거래가 중단됩니다.",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#39d274',
        cancelButtonColor: '#d33',
        confirmButtonText: "중단",
        cancelButtonText: '취소',
        reverseButtons: true,
    }).then((result) => {
    	if (result.isConfirmed) {
			<%-- 서블릿 요청 --%>
			$.ajax({
				type: "GET",
				url: "StopPayment",
				data: {
					"product_id": 57
				},
				success:  function(data) {
					if(data == "not-login") {
						Swal.fire({
							icon: 'warning',
							title: '로그인을 해주세요!',
							text: '로그인 페이지로 이동합니다!',
							allowOutsideClick: false
						}).then((result) => {
								location.href="MemberLogin";
						});	
					} else if(data == "none") {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '거래 중단 가능한 상품이 없습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});				
					} else if(data == "inconsistency") {
							Swal.fire({
								position: 'center',
								icon: 'error',
								title: '판매자 정보가 일치하지 않습니다.',
								showConfirmButton: false,
								timer: 2000,
								toast: true
						});			
					} else if(data == "true") {
						Swal.fire({
							position: 'center',
							icon: 'success',
							title: '거래를 중단했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
					} else {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '거래 중단을 실패했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});			
					}
			
				},
				error: function(request, status, error) {
			      // 요청이 실패한 경우 처리할 로직
			      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
				}
			});
    	} else {
			event.preventDefault();
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
                        <h1 class="page-title">소심페이정보</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> 홈</a></li>
                        <li>소심페이정보</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    <div id="buttonArea">
    	<input type="button" id="acceptBtn" value="(임시)거래수락" onclick="acceptPayment()">    	
	    <input type="button" value="(임시)결제하기" onclick="payment()">
	    <input type="button" value="(임시)구매확정" onclick="confirmPayment()">
   		<input type="button" id="stopBtn" value="거래중단" onclick="stopPayment()">
    </div>
	
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
                                	<a href="PayInfo">
	                                	<img src="${pageContext.request.contextPath}/resources/images/favicon.svg" height="35px">
	                                	소심페이
                                	</a>
                                </h3>
                            </div>
                            <div class="row">
	                           	<div class="pay-info col-lg-6 col-md-6 col-12">
									페이잔액
								</div>
	                           	<div class="pay-balance col-lg-6 col-md-6 col-12">
	                           		<c:set var="payBalance" value="${payInfo.pay_balance}" />
									<fmt:formatNumber value="${payBalance}" pattern="#,##0" />원
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
							<div id="date_select"><button id="select_date_modal" data-bs-toggle="modal" data-bs-target="#date_modal">전체기간<i class="fa fa-caret-down"></i></button></div>
							
							<div id="period_info">
								<div id="info_left"></div>
								<div id="info_right" onclick="#">전체기간</div>
							</div>
							
							<div id="payHistoryList">
								<%-- 페이사용 내역이 출력되는 영역 --%>
							</div>
                        </div>
                    </div>
					<div style="text-align: right;">
						<button class="btn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal">소심페이 탈퇴하기</button>
					</div>
					<!-- Review Modal -->
				    <div class="modal review-modal" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel"
				        aria-hidden="true">
				        <div class="modal-dialog">
				            <div class="modal-content">
				               	<form action="AccountRegistPro" method="post" class="account-regist">
					                <div class="modal-header">
					                    <h5 class="modal-title" id="exampleModalLabel">탈퇴 전 읽어주세요</h5>
					                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                </div>
					                <div class="modal-body">
					                    <div class="row">
					                        <div class="col-sm-12">
					                        	1. 소심페이 탈퇴 시 소심페이 잔액과 이용 내역이 모두 삭제됩니다.<br>
					                        	2. 본 서비스 해지 이후에도 소시민 계정은 그대로 사용하실 수 있습니다.<br>
					                        	3. 소심페이 잔액 및 이용내역 복구는 불가능합니다.
					                        	<br>
					                        	<br>
					                        	<label><input type="checkbox" name="agree"> 설명을 모두 읽었으며 동의합니다.</label>
					                        </div>
					                    </div>
					                </div>
					                <div class="modal-footer button">
						            	<button type="button" class="btn" id="withdrawPay">소심페이 탈퇴하기</button>
					                </div>
				               	</form>
				            </div>
				        </div>
				    </div>
				    <!-- End Review Modal -->
                </div>
            </div>
        </div>
    </div>

    <!-- Review Modal -->
    <div class="modal review-modal" id="date_modal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">조회 기간을 선택해주세요</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="btn-group col">
						        <input type="checkbox" name="period" class="btn-check" id="btn-date1" value="1" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-date1">1개월</label>
						        <input type="checkbox" name="period" class="btn-check" id="btn-date2" value="3" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-date2">3개월</label>
						        <input type="checkbox" name="period"class="btn-check" id="btn-date3" value="6" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-date3">6개월</label>
						        <input type="checkbox" name="period" class="btn-check" id="btn-date4" value="12" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-date4">최대(1년)</label>
							</div>
                        </div>
                        <div class="date_area col">
                            <div class="start_date"><input type="date" id="start_date"></div>
                            <div class="pattern"> ~ </div>
                            <div class="end_date"><input type="date" id="end_date"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer button">
                    <button type="button" class="btn" id="passwd-btn" onclick="select_date()">조회하기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Review Modal -->

	
	
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