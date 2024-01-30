<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Sosimin</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/quill.snow.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/quill.bubble.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/remixicon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/style2.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/css/admin/style.css" rel="stylesheet">
<!-- bootstrap-icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<%-- sweetalert --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />

<script type="text/javascript">

	
	$(function(){

		// 내 정보 수정 클릭 이벤트
		$("#myPageModifyInfoFrom").on("click", function() {
			openModifyMyInfoModal();
		});
			
		// 찜 버튼 클릭 이벤트
        $(".heart").on("click", function () {
            $(this).toggleClass("is-active");
    	    Swal.fire({
    			title: '찜했습니다!',         // Alert 제목
    			text: "감사합니다!",  // Alert 내용
    			icon:'success',                         // Alert 타입
    		});
        });
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		
		
		
		
	}); // document.ready 끝
	
	// 내 정보 수정 클릭 시 모달 띄우는 함수 정의
	function openModifyMyInfoModal() {
		$("#memberModifyInfoModal").modal("show");
	}
	
</script>


</head>
<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
		<jsp:include page="../inc/adminTop.jsp"></jsp:include>	
	</header><!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<jsp:include page="../inc/adminSidebar.jsp"></jsp:include>	
	</aside><!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>회원관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminMain">Home</a></li>
					<li class="breadcrumb-item active">회원관리</li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card" id="adminMemberTableArea">
						<div class="card-body">
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th>프로필사진</th>
										<th>이름</th>
										<th>아이디</th>
										<th>닉네임</th>
										<th>생년월일</th>
										<th>주소</th>
										<th>이메일</th>
										<th>휴대폰번호</th>
										<th>회원레벨</th>
										<th>회원상태</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
<%-- 									<c:forEach var="pay_list" items="${payHistoryList}"> --%>
										<tr>
											<td>
												<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
											</td>
											<td>${pay_list.pay_history_id}</td>
											<td>${pay_list.pay_history_id}</td>
											<td>${pay_list.pay_history_id}</td>
											<td>${pay_list.pay_history_id}</td>
											<td>${pay_list.pay_history_id}</td>
											<td>${pay_list.pay_id}</td>
											<td>${pay_list.pay_amount}</td>
											<td>${pay_list.pay_history_type}</td>
											<td>
<%-- 												<c:set var="datetime" value="${fn:split(pay_list.pay_history_date, 'T')}" /> --%>
<%-- 												<c:set var="date" value="${datetime[0]}" /> --%>
												${date}
											</td>
											<td class="green" id="adminMemberTdArea">
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#memberModifyInfoModal" id="myPageModifyInfoFrom">
													수정
												</button>
													
												<%-- 회원정보 수정 모달 설정 --%>
												<div class="modal" id="memberModifyInfoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered">
														<div class="modal-content">
															<div class="modal-header">
																<h1 class="modal-title fs-5" id="staticBackdropLabel">회원 정보 수정</h1>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div id="modifyMemberInfo" class="mx-auto my-5 w-75">
																	<form action="" class="row" method="post">
																		<div class="form-group" id="formGroupForMemberProfilePic">
																			<label for="reg-fn" id="mgForFiveMemberMod">프로필사진</label>
																			<img alt="" src=""><%-- 썸네일 처리!!!! --%>
																			<label for="memberProfilePicFile">
											<!-- 										<input type="button" class="btnProfilePicModify" value="사진 변경"> -->
																				<div class="btn btn-primary" id="memberProfilePicModifyButtonArea">사진 변경</div>
																			</label>
																			<input type="file" name="file" id="memberProfilePicFile">
																			<div class="btn btn-primary" id="memberProfilePicResetButtonArea">삭제</div>
																		</div>
											
																		<div class="form-group">
																			<label for="reg-fn" id="mgForTwoMemberMod">이름</label> 
																			<input class="form-control" placeholder="기존이름" maxlength="5" type="text" name="member_name" id="name" readonly>
																		</div>
																		<div class="form-group" >
																			<label for="reg-ln" id="mgForThreeMemberMod">아이디</label> 
																			<input class="form-control" placeholder="기존아이디" maxlength="20" type="text"  name="member_id" id="id" readonly>
																		</div>
																		<div class="form-group">
																			<label for="reg-pass" id="mgForFiveOneMemberMod">새 비밀번호</label> 
																			<input class="form-control" maxlength="16" placeholder="비밀번호를 수정할 경우에만 입력해주세요" type="password"  name="member_password" id="password">
																			<div id="checkPasswordResult" class="resultArea"></div><%--8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*) --%>
																		</div>
																		<div class="form-group">
																			<label for="reg-pass-confirm" id="mgForSevenTwoMemberMod">새 비밀번호 확인</label> 
																			<input class="form-control" maxlength="16" placeholder="비밀번호를 한 번 더 입력해주세요" type="password" id="passwordConfirm">
																			<div id="checkPasswordConfirmResult" class="resultArea"></div>
																		</div>
																		<div class="form-group">
																			<label for="reg-ln" id="mgForThreeMemberMod">닉네임</label> 
																			<input class="form-control" type="text" placeholder="기존닉네임" name="member_nickname" id="nickname" required>
																			<button type="button" id="checkNicknameDupButton" class="btn btn-primary">중복확인</button>
											<!-- 								<input type="button" value="닉네임만들기" id="generateNicknameButton"> -->
																			<%-- 입력값이 비어있을 경우 DB에서 임의로 난수발생해 insert 처리 --%>
																			<div id="checkNicknameResult" class="resultArea"></div><%--2~10글자의 한글, 숫자(선택입력) --%>
																		</div>
											
																		<div class="form-group">
																			<label for="reg-ln" id="mgForFourMemberMod">생년월일</label> 
																			<input class="form-control" type="date" name="member_birth" id="birthdate" required>
																			<%--회원가입과 동일하게 범위제한하고 기존 생년월일 placeholder --%>
																			<div id="checkBirthdateResult" class="resultArea"></div>
																		</div>
																		<div class="form-group">
																			<label for="reg-ln" id="mgForTwoMemberMod">주소</label> 
																			<input type="hidden" id="map">
																			<input class="form-control" type="text" placeholder="기존주소" name="member_address" id="myMap" required readonly>
																			<%--회원가입과 동일. 기존 주소 placeholder --%>
																			<button type="button" id="myMapButton" class="btn btn-primary" onclick="AddressMap()">동네인증</button>
																			<div id="checkAddressResult" class="resultArea"></div>
																		</div>
																		<div class="form-group">
																			<label for="reg-email" id="mgForThreeMemberMod">이메일</label> 
																			<input class="form-control" type="email" placeholder="기존이메일" name="member_email" id="email" required>
																			<%--회원가입과 동일하게 정규표현식 검증 및 중복확인. 기존 이메일 placeholder --%>
																			<button type="button" id="checkEmailDupButton" class="btn btn-primary">중복확인</button>
																			<div id="checkEmailResult" class="resultArea"></div>
																		</div>
																		<div class="form-group">
																			<label for="reg-phone" id="mgForFiveMemberMod">휴대폰번호</label> 
																			<input class="form-control" placeholder="기존휴대폰번호" type="tel" name="member_phone" id="phone" required>
																			<%--회원가입과 동일하게 인증, 정규표현식 검증, 중복확인(회원아이디 일치하고 휴대폰 번호 동일한 경우 자바스크립트 처리?). 기존 폰번호 placeholder --%>
																			<button type="button" class="btn btn-primary">인증</button>
																			<div id="checkPhoneResult" class="resultArea"></div>
																		</div>
																		<div class="form-group">
																			<label for="reg-fn" id="mgForFourMemberMod">회원레벨</label> 
																			<select>
																				<option>레벨 선택</option>
																				<option>1</option>
																				<option>2</option>
																				<option>3</option>
																			</select>
																		</div>
																		<div class="form-group">
																			<label for="reg-fn" id="mgForFourMemberMod">회원상태</label> 
																			<select>
																				<option>상태 선택</option>
																				<option>관리자</option>
																				<option>활동</option>
																				<option>정지</option>
																				<option>탈퇴</option>
																			</select>
																			<div id="checkReportCountResult" class="resultArea"></div><%--정지 선택 시 최종 신고 횟수 표시 --%>
																		</div>
																	</form>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modifyInfoClose">창닫기</button>
																<button type="submit" class="btn btn-primary" onclick="location.reload()">수정</button>
															</div>
														</div>
													</div>
												</div>		
											</td>
										</tr>
<%-- 									</c:forEach> --%>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->
						</div>
	 				</div>
				</div>
			</div>
		</section>
	</main><!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<jsp:include page="../inc/adminBottom.jsp"></jsp:include>	
	</footer><!-- End Footer -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/resources/js/admin/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart.umd.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin//quill.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/simple-datatables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/js/admin/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</body>
</html>