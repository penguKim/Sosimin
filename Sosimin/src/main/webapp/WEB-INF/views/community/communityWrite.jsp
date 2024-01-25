<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>Sosimin</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
	
	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
<script type="text/javascript">
	$(function() {
		let width = $(window).width();
		console.log(width);
		
		// 10초마다 게시글 임시저장
		let tempSave = setInterval(tempToast, 10000);
		
		
		
// 		$("#writeBtn").on("click", function() {
// 			Swal.fire({
// 			      title: '정말로 그렇게 하시겠습니까?',
// 			      text: "다시 되돌릴 수 없습니다. 신중하세요.",
// 			      icon: 'warning',
// 			      showCancelButton: true,
// 			      confirmButtonColor: '#3085d6',
// 			      cancelButtonColor: '#d33',
// 			      confirmButtonText: '승인',
// 			      cancelButtonText: '취소',
// 			      reverseButtons: true, // 버튼 순서 거꾸로
			      
// 			    }).then((result) => {
// 			      if (result.isConfirmed) {
// 			        Swal.fire(
// 			          '승인이 완료되었습니다.',
// 			          '화끈하시네요~!',
// 			          'success'
// 			        )
// 			      }
// 			    });
// 		});
		
		// 게시글 등록하기
		$('#writeBtn').on('click', function(event) {
				event.preventDefault();
				clearInterval(tempSave);
			if (!$(".needs-validation")[0].checkValidity()) {
				event.stopPropagation();
				$(".needs-validation").addClass('was-validated');
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '항목을 입력해주세요.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				})
				$(".needs-validation").find('.formFocus').each(function() {
					
				    if ($(this).is('select')) {
				        // 셀렉트 박스인 경우
				        if ($(this).find('option:selected').val() == '') {
				            // 선택된 옵션의 값이 빈 문자열인 경우
				            $(this).focus();
				            $('#writeBtn').blur();
				            tempSave = setInterval(tempToast, 10000);
				            return false;
				        }
				    } else if ($(this).val() == '') {
				        // 셀렉트 박스가 아니고, 값이 없는 경우
				        $(this).focus();
				        $('#writeBtn').blur();
				        tempSave = setInterval(tempToast, 10000);
				        return false;
				    }
					
// 		            if ($(this).val() == '') {
// 		                $(this).focus();
// 		                $('#writeBtn').blur();
// 		                tempSave = setInterval(tempToast, 10000);
// 		                return false;
// 		            }
		        });
			} else {
// 				event.preventDefault();
				Swal.fire({
			        title: '게시글을 등록하시겠습니까?',
			        text: "등록 후 커뮤니티 게시판으로 이동합니다.",
			        icon: 'question',
			        showCancelButton: true,
			        confirmButtonColor: '#39d274',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '등록',
			        cancelButtonText: '취소',
			        reverseButtons: true,
			    }).then((result) => {
			        if (result.isConfirmed) {
			            $(".needs-validation").submit();
			        } else {
			        	$("#writeBtn").blur();
			        	tempSave = setInterval(tempToast, 10000);
			        }
			    });
			}
		});
		
		// 게시글 임시저장
		$('#tempBtn').on('click', function(event) {
			clearInterval(tempSave);
			
			Swal.fire({
				position: 'center',
				icon: 'success',
				title: '작성글이 임시저장되었습니다.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			})
			$(this).blur();
			tempSave = setInterval(tempToast, 10000);
		});
		
	});
	
	function tempToast() {
		Swal.fire({
			position: 'bottom',
			icon: 'success',
			title: '작성글이 임시저장되었습니다.',
			showConfirmButton: false,
			timer: 2000,
			toast: true
		})
	}
	
</script>
</head>
<body>
	<!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

	<!-- Preloader -->
	<div class="preloader" style="opacity: 0; display: none;">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->
	
	<!-- Start Header Area -->
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- End Header Area -->
	
	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">XX동 커뮤니티</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="Community">커뮤니티</a></li>
                        <li>게시글 작성</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
   	<section class="communityArea section">
		<div class="container">
			<h1>게시글 작성</h1>
			<form action="" name="writeForm" class="needs-validation" method="post" enctype="multipart/form-data" novalidate>
				<div class="communityForm post p-4 w-50 mx-auto">
				    <div class="post-header border-bottom">
				    	<div class="row">
					    	<div class="col-xl-4 col-md-6 col-sm-6 col-6">
								<select class="formCategory form-select mb-3 formFocus" required>
										<option selected disabled value="">카테고리</option>
										<option>동네소식</option>
										<option>동네질문</option>
										<option>일상</option>
								</select>
					    	</div>
				    	</div>
				    	<div class="row">
							<div class="col-12">
								<div class="form-floating mb-1">
									<input type="text" class="form-control form-control-lg formFocus" id="title" placeholder="제목을 입력하세요" required>
									<label for="title">제목</label>
								</div>
<!-- 								<div class="input-group"> -->
<!-- 									<input type="text" name="name" class="form-control form-control-lg" placeholder="제목을 입력하세요"> -->
<!-- 								</div> -->
								<div class="form-text" id="basic-addon4">
									무언가를 표시할때 사용할거야
								</div>
							</div>
						</div>
				   	</div>
				    <div class="post-content mt-3">
<!-- 				    <div class="post-content position-relative mt-3"> -->
<!-- 				    	<div class="row"> -->
<!-- 				    	</div> -->
					<div class="form-floating">
						<textarea class="form-control communityFormSubject formFocus" placeholder="Leave a comment here" id="floatingTextarea" style="height: 500px;" required></textarea>
						<label for="floatingTextarea">내용</label>
					</div>
				    </div>
				</div>
				<div class="mx-auto w-50 mt-2 row d-flex justify-content-between" id="commandCell">
<!-- 				<div> -->
					<input type="button" class="btn btn-secondary col-xl-2 col-md-3 col-12 me-2" value="돌아가기" onclick="history.back()">
					<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 me-auto" id="tempBtn" value="임시저장" formaction="tempWritePro">
<!-- 				</div> -->
					<input type="submit" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" id="writeBtn" value="등록하기" formaction="CommunityWritePro">
				</div>
		    </form>
<!-- 					<tr> -->
<!-- 						<td><label for="file1">파일첨부</label></td> -->
<!-- 						<td> -->
<%-- 							파일 첨부 형식은 input 태그 type="file" 속성 활용 --%>
<%-- 							한번에 하나의 파일 선택 --%>
<!-- 							<input type="file" name="file1"> -->
<!-- 							<input type="file" name="file2"> -->
<!-- 							<input type="file" name="file3"> -->
<!-- 	<!-- 						<br>--------------<br> -->
<%-- 							한번에 복수개의 파일 선택 시 multiple 속성 추가 --%>
<!-- 	<!-- 						<input type="file" name="file" multiple> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->

		</div>
	</section>
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