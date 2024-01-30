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
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
	
	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
<style type="text/css">
#fileArea {
    width: 100px;
    height: 100px;
/*     border: 1px solid #000; */
}

</style>
<script type="text/javascript">
	$(function() {
		let width = $(window).width();
		console.log(width);
		
		// 10초마다 게시글 임시저장
		let tempSave = setInterval(tempToast, 10000);
		
		// 임시저장한 게시글 불러오기
		$.ajax({
			type: "POST",
			url: "TempCheck",
			dataType: "json",
			success: function(temp) {
				if(temp.length != 0) {
					
					clearInterval(tempSave);
					
					Swal.fire({
				        title: '임시 저장한 게시글이 있습니다.',
				        text: "취소할 경우 임시저장 데이터는 사라집니다.",
				        icon: 'info',
				        showCancelButton: true,
				        confirmButtonColor: '#39d274',
				        cancelButtonColor: '#d33',
				        confirmButtonText: '등록',
				        cancelButtonText: '취소',
				        reverseButtons: true,
				        allowOutsideClick: false
				    }).then((result) => {
				        if (result.isConfirmed) {
				        	$(".formCategory option:selected").prop("selected", false);
				        	$(".formCategory option[value='" + temp.temp_category + "']").prop("selected", true);
				        	$("#title").val(temp.temp_subject);
				        	$('#titleLenth').text('제목 (' + temp.temp_subject.length + '/40)');
				        	$("#content").val(temp.temp_content);
				        	$('#contentLength').text('내용 (' + temp.temp_content.length + '/1000)');
				        	
				        	tempSave = setInterval(tempToast, 10000);
				        } else {
				        	$.ajax({
				        		type: "POST",
				        		url: "TempDelete",
				        		success: function(data) {
				        			if(data == 'true') {
				        				Swal.fire({
				        					position: 'center',
				        					icon: 'success',
				        					title: '임시 저장글이 삭제되었습니다.',
				        					showConfirmButton: false,
				        					timer: 2000,
				        					toast: true
				        				});
				        			}
				        			tempSave = setInterval(tempToast, 10000);
								}
				        	});
				        }
				    });
					
				}
			}
		});
		
	    $('#title').on('keyup', function() {
	        var text = $(this).val();
	        
	        // 텍스트 제한
	        if(text.length == 0 || text == "") {
		        $('#titleLenth').text('제목 (0/40)');
	        } else {
		        $('#titleLenth').text('제목 (' + text.length + '/40)');
	        }
	        
	        // 글자수 제한
	        if (text.length > 40) {
	        	// 제한수 넘으면 자르기
	            $(this).val($(this).val().substring(0, 40));
	            
				Swal.fire({
					position: 'center',
					icon: 'warning',
					title: '글자수는 40자까지 입력 가능합니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
	        };
	    });
	    
	    $('#content').on('keyup', function() {
	        var text = $(this).val();
	        
	        // 텍스트 변경
	        if(text.length == 0 || text == "") {
		        $('#contentLength').text('내용 (0/1000)');
	        } else {
		        $('#contentLength').text('내용 (' + text.length + '/1000)');
	        }
	        
	        // 글자수 제한
	        if (text.length > 1000) {
	        	// 제한수 넘으면 자르기
	            $(this).val($(this).val().substring(0, 1000));
	            
				Swal.fire({
					position: 'center',
					icon: 'warning',
					title: '글자수는 1000자까지 입력 가능합니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
	        };
	    });
	        
		
		
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
					
		        });
			} else {
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
			        allowOutsideClick: false
			    }).then((result) => {
			        if (result.isConfirmed) {
			            $(".needs-validation")[0].submit();
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
			
			var form = $('#writeForm')[0];
			var data = new FormData(form);
			
			$.ajax({
				type: "POST",
				url: "TempRegist",
				enctype: 'multipart/form-data',
				data: data,
				<%-- multipart/form-data로 전송 --%>
				contentType: false, 
				<%-- formData가 String이 되지않음 --%>
				processData: false, 
				success: function(result) {
					console.log(result);
					
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
				}
				
			});
		});
		
	});
	
	// 게시글 임시저장 토스트
	function tempToast() {
		var form = $('#writeForm')[0];
		var data = new FormData(form);
		
		$.ajax({
			type: "POST",
			url: "TempRegist",
			enctype: 'multipart/form-data',
			data: data,
			<%-- multipart/form-data로 전송 --%>
			contentType: false, 
			<%-- formData가 String이 되지않음 --%>
			processData: false, 
			success: function(result) {
				console.log(result);
				
				Swal.fire({
					position: 'center',
					icon: 'success',
					title: '작성글이 임시저장되었습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				})
				$(this).blur();
			}
		});
	}
	
	$(document).ready(function() {
		$('#asd').on('click', function(e) {
		    e.preventDefault(); // form의 기본 submit 이벤트를 막습니다.

		    $.ajax({
		        url: 'ImageTest',
		        type: 'POST',
		        data: formData,
		        processData: false, // 필수
		        contentType: false, // 필수
		        success: function(response) {
		            console.log('File uploaded successfully');
		        },
		        error: function(err) {
		            console.log('Error in file upload', err);
		        }
		    });
		});
	});

	
	// ---- 이미지 파일 처리
	var formData = new FormData();
	
	function clickFile() {
	    for (var i = 1; i <= 5; i++) {
	        if (!formData.get('file' + i)) {
	            $('#file' + i).click();
	            break;
	        }
	    }
	}
	
	function showThumbnail(input) {
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        var fileId = input.id;
	
	        reader.onload = function (e) {
	            var thumbnail = $('<div class="col-auto rounded-3 overflow-hidden mx-2 p-0 position-releative">').html('<img src="' + e.target.result + '" style=\"width: 80px; height: 80px;\"><i class="material-icons position-absolute translate-middle">cancel</i>');
	            thumbnail.find('i').click(function() {
	                removeThumbnail(this, fileId);
	            });
	            $('#thumbnailArea > div').append(thumbnail);
	            formData.append(fileId, input.files[0]); // 파일을 formData에 추가합니다.
	        }
	
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	function removeThumbnail(del, fileId) {
	    var thumbnail = $(del).parent();
	
	    formData.delete(fileId); // 파일을 formData에서 제거합니다.
	
	    // 파일 입력 필드의 값을 조정합니다.
	    var nextFileId = Number(fileId.replace('file', '')) + 1;
	    while (formData.get('file' + nextFileId)) {
	        formData.set('file' + (nextFileId - 1), formData.get('file' + nextFileId));
	        nextFileId++;
	    }
	    formData.delete('file' + (nextFileId - 1));
	
	    thumbnail.remove();
	}
	// ---- 이미지 파일 처리 ----
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
<!-- <form action="ImageTest" method="post" enctype="multipart/form-data" > -->
<!-- 	<input type="file" name="image" id="fileUpload" multiple hidden /> -->
<!-- 	<div id="uploadArea"></div> -->
<!-- 	<div id="previewArea"></div> -->
<!-- 	<input type="submit" value="파일"> -->
<!-- </form> -->
			<form action="CommunityWritePro" name="writeForm" class="needs-validation" id="writeForm" method="post" enctype="multipart/form-data" novalidate>
				<div class="communityForm post p-4 mx-auto" style="width: 65%;">
				    <div class="post-header border-bottom">
				    	<div class="row">
					    	<div class="col-xl-4 col-md-6 col-sm-6 col-6">
								<select class="formCategory form-select mb-3 formFocus" name="community_category" required>
										<option selected disabled value="0">카테고리</option>
										<option value="1">동네소식</option>
										<option value="2">동네질문</option>
										<option value="3">일상</option>
								</select>
					    	</div>
				    	</div>
				    	<div class="row">
							<div class="col-12">
								<div class="form-floating mb-1">
									<input type="text" class="form-control form-control-lg formFocus" id="title" name="community_subject" required>
									<label id="titleLenth" for="title">제목 (0/40)</label>
								</div>
<!-- 								<div class="input-group"> -->
<!-- 									<input type="text" name="name" class="form-control form-control-lg" placeholder="제목을 입력하세요"> -->
<!-- 								</div> -->
<!-- 								<div class="form-text" id="tBottom"> -->
<!-- 									(0/40) -->
<!-- 								</div> -->
							</div>
						</div>
				   	</div>
				    <div class="post-content mt-3">
						<div class="form-floating">
							<textarea class="form-control communityFormSubject formFocus" name="community_content" id="content" style="height: 500px;" required></textarea>
							<label id="contentLength" for="content">내용 (0/1000)</label>
						</div>
				    </div>
<!-- 				    <div class="post-file mt-3"> -->
<!-- 				    	<input type="file" name="file1"> -->
<!-- 				    	<input type="file" name="file2"> -->
<!-- 				    	<input type="file" name="file3"> -->
<!-- 				    	<input type="file" name="file4"> -->
<!-- 				    	<input type="file" name="file5"> -->
<!-- 				    </div> -->
				    <div class="post-file mt-3" id="uploadArea">
				    	<div class="row mx-auto" style="height:110px;">
							<div class="col-2 border rounded-3 h-100 me-2" id="fileArea" onclick="clickFile()">
							<i class="material-icons d-flex justify-content-center" style="font-size:110px;">image</i>
							</div>
							<div class="col border rounded-3 d-flex align-items-center" id="thumbnailArea">
								<div class="scrolling-wrapper row flex-nowrap mx-auto">
								</div>
							</div>
							<input type="file" id="file1" name="file1" style="display:none" onchange="showThumbnail(this)">
							<input type="file" id="file2" name="file2" style="display:none" onchange="showThumbnail(this)">
							<input type="file" id="file3" name="file3" style="display:none" onchange="showThumbnail(this)">
							<input type="file" id="file4" name="file4" style="display:none" onchange="showThumbnail(this)">
							<input type="file" id="file5" name="file5" style="display:none" onchange="showThumbnail(this)">
						</div>
				    </div>
				</div>
				<div class="mx-auto mt-2 row d-flex justify-content-between" id="commandCell" style="width: 65%;">
					<input type="button" class="btn btn-secondary col-xl-2 col-md-3 col-12 me-2" value="돌아가기" onclick="history.back()">
<!-- 					<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 me-auto" id="tempBtn" value="임시저장" formaction="tempWritePro"> -->
					<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 me-auto" id="tempBtn" value="임시저장">
<!-- 					<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 me-auto" id="tempBtn" value="임시저장"  -->
<!-- 												formaction="TempRegist" formenctype="multipart/form-data" formmethod="post"> -->
					<input type="submit" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" id="writeBtn" value="등록하기">
				</div>
		    </form>
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