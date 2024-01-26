<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
<script type="text/javascript">
	$(function() {
		// 게시글 수정하기
		$('#modifyBtn').on('click', function(event) {
			event.preventDefault();
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
				});
				
				$(".needs-validation").find('.formFocus').each(function() {
				    if ($(this).is('select')) {
				        // 셀렉트 박스인 경우
				        if ($(this).find('option:selected').val() == '') {
				            // 선택된 옵션의 값이 빈 문자열인 경우
				            $(this).focus();
				            $('#writeBtn').blur();
				            return false;
				        }
				    } else if ($(this).val() == '') {
				        // 셀렉트 박스가 아니고, 값이 없는 경우
				        $(this).focus();
				        $('#writeBtn').blur();
				        return false;
				    }
		        });
			} else {
				Swal.fire({
			        title: '게시글을 수정하시겠습니까?',
			        text: "등록 후 해당 게시글로 이동합니다.",
			        icon: 'question',
			        showCancelButton: true,
			        confirmButtonColor: '#39d274',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '등록',
			        cancelButtonText: '취소',
			        reverseButtons: true,
			    }).then((result) => {
			        if (result.isConfirmed) {
			            $(".needs-validation")[0].submit();
			        } else {
			        	$(this).blur();
			        }
			    });
			}
		});
	});
	
	function deleteFile(community_id, image, index) {
		
		Swal.fire({
	        title: '이미지를 삭제하시겠습니까?',
	        text: "삭제한 이미지는 복구할 수 없습니다.",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '등록',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	$.ajax({
					type: "POST",
					url: "CommunityDeleteFile",
					data: {
						community_id: community_id,
						community_image1: image
					},
					success: function(result) {
						console.log("파일 삭제 요청 결과 : " + result + ", " + typeof(result));
						if(result == 'true') { // 삭제 성공 시
							$("#fileItemArea" + index).html("<input type='file' name='file" + index + "'>");
						} else if(result == 'false') {
							console.log("파일 삭제 실패!");	
						}
					}
				});
	        } else {
	        	$(this).blur();
	        }
	    });
		
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
                        <li>게시글 수정</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
   	<section class="communityArea section">
		<div class="container">
			<h1>게시글 수정</h1>
			<form action="CommunityModifyPro" name="modifyForm" class="needs-validation" method="post" enctype="multipart/form-data" novalidate>
				<div class="communityForm post p-4 w-50 mx-auto">
				    <div class="post-header border-bottom">
				    	<div class="row">
				    	<div class="col-xl-4 col-md-6 col-sm-6 col-6">
							<select class="formCategory form-select mb-3 formFocus" name="community_category" required>
									<optgroup label="카테고리">
										<option value="1" <c:if test="${com.community_category eq '1' }">selected</c:if>>동네소식</option>
										<option value="2" <c:if test="${com.community_category eq '2' }">selected</c:if>>동네질문</option>
										<option value="3" <c:if test="${com.community_category eq '3' }">selected</c:if>>일상</option>
									</optgroup>
									
							</select>
				    	</div>
				    	</div>
				    	<div class="row">
							<div class="col-12">
								<div class="form-floating mb-1">
									<input type="text" class="form-control form-control-lg formFocus" name="community_subject" id="title" value="${com.community_subject }" required>
									<label for="title">제목</label>
								</div>
								<div class="form-text" id="basic-addon4">
									무언가를 표시할때 사용할거야
								</div>
							</div>
						</div>
				   	</div>
				    <div class="post-content mt-3">
						<div class="form-floating">
							<textarea class="form-control communityFormSubject formFocus" name="community_content" id="floatingTextarea" style="height: 500px;" required>${com.community_content }</textarea>
							<label for="floatingTextarea">내용</label>
						</div>
				    </div>
   				    <div class="post-file mt-3">
   						<div class="file" id="fileItemArea1">
							<c:choose>
								<c:when test="${not empty com.community_image1}">
									<c:set var="original_file_name1" value="${fn:substringAfter(com.community_image1, '_')}"/>
<%-- 									<img src="${pageContext.request.contextPath }/resources/upload/${com.community_image1}" class="imgFIle" onclick="imageModal(this)"> --%>
									
									<a href="${pageContext.request.contextPath }/resources/upload/${com.community_image1}" download="${original_file_name1}">${original_file_name1}</a>
									<%-- 파일명 뒤의 삭제 아이콘 클릭 시 deleteFile() 함수 호출 --%>
									<a href="javascript:deleteFile(${com.community_id}, '${com.community_image1 }', 1)">
									<%-- void(0)을 사용하면 해당 태그의 동작을 취소하고 onxxx를 사용하여 호출가능하다. --%>
		<!-- 							<a href="javascript:void(0)" onclick="delefeFile()"> -->
										<i class="material-icons">cancel</i>
<%-- 										<img alt="" src="${pageContext.request.contextPath }/resources/images/delete-icon.png" class="img_btnDelete"><br> --%>
									</a>	
								</c:when>
								<c:otherwise>
									<input type="file" name="file1">
								</c:otherwise>
							</c:choose>
						</div>
				    	<input type="file" name="file2">
				    	<input type="file" name="file3">
				    	<input type="file" name="file4">
				    	<input type="file" name="file5">
				    </div>
				</div>
				<div class="mx-auto w-50 mt-2 row d-flex justify-content-between" id="commandCell">
					<input type="button" class="btn btn-secondary col-xl-2 col-md-3 col-12 me-2" value="돌아가기" onclick="history.back()">
					<input type="submit" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" id="modifyBtn" value="수정하기">
				</div>
				<input type="hidden" name="community_id" value="${com.community_id }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
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