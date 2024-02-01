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
}

</style>
<script type="text/javascript">
	$(function() {
		let width = $(window).width();
		console.log(width);
		
		// 30초마다 게시글 임시저장
		let tempSave = setInterval(tempToast, 30000);
		
		// 임시저장한 게시글 불러오기
		$.ajax({
			type: "POST",
			url: "TempCheck",
			dataType: "json",
			success: function(temp) {
				if(temp.length != 0) {
					// 인터벌 중지
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
				        	// 카테고리 등록
				        	if(temp.temp_category != 0) { // 미선택이 아닌 경우
					        	$(".formCategory option:selected").prop("selected", false);
					        	$(".formCategory option[value='" + temp.temp_category + "']").prop("selected", true);
				        	}
				        	// 제목 등록
				        	$("#title").val(temp.temp_subject);
				        	$('#titleLenth').text('제목 (' + temp.temp_subject.length + '/40)');
				        	// 내용 등록
				        	$("#content").val(temp.temp_content);
				        	$('#contentLength').text('내용 (' + temp.temp_content.length + '/1000)');
				        	// 인터벌 시작
				        	tempSave = setInterval(tempToast, 30000);
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
				        			// 인터벌 시작
				        			tempSave = setInterval(tempToast, 30000);
								}
				        	});
				        }
				    });
					
				}
			}
		});
		
		// 제목 글자수 제한
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
	    
		// 내용 글자수 제한
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
				event.preventDefault(); // 서브밋 중지
				clearInterval(tempSave); // 인터벌 중지
			if (!$(".needs-validation")[0].checkValidity()) { // 유효성 검사
				event.stopPropagation();
				// 유효성 실패 추가
				$(".needs-validation").addClass('was-validated');

				// 항목 검사
				$(".needs-validation").find('.formFocus').each(function() {
					
				    if ($(this).is('select')) { // 셀렉트 박스인 경우
				        
				        if ($(this).find('option:selected').val() == "") {
				            // 선택된 옵션의 값이 없는 경우
				            $(this).focus();
							Swal.fire({
								position: 'center',
								icon: 'warning',
								title: '게시글의 주제를 선택해주세요.',
								showConfirmButton: false,
								timer: 2000,
								toast: true
							});
				            $('#writeBtn').blur();
				            tempSave = setInterval(tempToast, 30000);
				            return false;
				        }
				    } else if ($(".formFocus#title").val() == '') {
				        // 제목이 없는 경우
				        $(this).focus();
						Swal.fire({
							position: 'center',
							icon: 'warning',
							title: '게시글의 제목을 입력해주세요.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
				        $('#writeBtn').blur();
				        tempSave = setInterval(tempToast, 30000);
				        return false;
				    } else if ($(".formFocus#content").val() == '') {
				        // 내용이 없는 경우
				        $(this).focus();
						Swal.fire({
							position: 'center',
							icon: 'warning',
							title: '게시글의 내용을 입력해주세요.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
				        $('#writeBtn').blur();
				        tempSave = setInterval(tempToast, 30000);
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
			        	tempSave = setInterval(tempToast, 30000);
			        }
			    });
			}
		});
		
		// 게시글 임시저장
		$('#tempBtn').on('click', function(event) {
			clearInterval(tempSave);
			// form을 가져와 form 객체로 저장
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
					});
					$(this).blur();
					tempSave = setInterval(tempToast, 30000);
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
				});
				$(this).blur();
			}
		});
	}
	
	// ---- 이미지 파일 처리
	var formData = new FormData();
	
	// 폼데이터에 없는 파일 인덱스 판별
	function clickFile() {
	    for (var i = 1; i <= 5; i++) {
	        if (!formData.get('file' + i)) {
	            $('#file' + i).click();
	            break;
	        }
	    }
	}
	
	// 파일 업로드하여 썸네일 생성
// 	function showThumbnail(input) {
		
// 	    if (input.files && input.files[0]) { // 각 input에 첫번째 파일이 있는 경우
// 	        var reader = new FileReader();
// 	        var fileId = input.id; // input의 id 요소
	
// 	        reader.onload = function (e) { // reader 객체의 onload 이벤트 설정
// 	            var thumbnail = $('<div class="thumbnail col-auto mx-2 pt-3 px-1">').html('<div class="imageArea position-relative"><img class="border rounded-3" src="' + e.target.result + '" style=\"width: 80px; height: 80px;\"><i class="delBtn material-icons position-absolute translate-middle">cancel</i></div>');
// 	            thumbnail.find('i').click(function() { // thumnail 안의 i 태그에 클릭 이벤트 추가
// 	                removeThumbnail($(this).parent(), fileId); // imageArea 요소, fileId를 지정
// 	            });
// 	            $('#thumbnailArea > div').append(thumbnail);
// 	            formData.append(fileId, input.files[0]); // input의 아이디명으로 formdata 객체에 추가
	            
// 	        }
	
// 	        reader.readAsDataURL(input.files[0]); // url 형태로 파일을 반환
// 	    }
// 	}

	
	function showThumbnail(input) {
		
	    if (input.files && input.files[0]) { // 각 input에 첫번째 파일이 있는 경우
	        var fileId = input.id; // input의 id 요소
            formData.append(fileId, input.files[0]); // input의 아이디명으로 formdata 객체에 추가
            
			var data = new FormData();
			data.append(fileId, input.files[0]);
	        console.log("파일아이디 알려줘 ㅣ " + fileId);
	        
            $.ajax({
    			type: "POST",
    			url: "ImageUpload",
    			enctype: 'multipart/form-data',
    			data: data,
    			<%-- multipart/form-data로 전송 --%>
    			contentType: false, 
    			<%-- formData가 String이 되지않음 --%>
    			processData: false, 
    			success: function(result) {
    				console.log(result);
    				if(result != 'false') {
	   	 	            var thumbnail = $(
  	 	            		'<div class="thumbnail col-auto mx-2 pt-3 px-1">').html(
  	 	            				'<div class="imageArea position-relative">'
  	 	            			   +'<img class="border rounded-3" src="${pageContext.request.contextPath}/resources/upload/' 
  	 	            			   + result + '" style=\"width: 80px; height: 80px;\">'
  	 	            			   +'<i class="delBtn material-icons position-absolute translate-middle">cancel</i>'
	 	            			   +'</div>'
  	 	            			   );
	   	 	            thumbnail.find('i').click(function() { // thumnail 안의 i 태그에 클릭 이벤트 추가
	   	 	                removeThumbnail($(this).parent(), fileId); // imageArea 요소, fileId를 지정
	   	 	            });
	   	 	            $('#thumbnailArea > div').append(thumbnail);
    				}
    				Swal.fire({
    					position: 'center',
    					icon: 'success',
    					title: '사진 업로드함 ㅅㄱ.',
    					showConfirmButton: false,
    					timer: 2000,
    					toast: true
    				});
    				$(this).blur();
    			}
    		});
	            
// 	        reader.onload = function (e) { // reader 객체의 onload 이벤트 설정
// 	            var thumbnail = $('<div class="thumbnail col-auto mx-2 pt-3 px-1">').html('<div class="imageArea position-relative"><img class="border rounded-3" src="' + e.target.result + '" style=\"width: 80px; height: 80px;\"><i class="delBtn material-icons position-absolute translate-middle">cancel</i></div>');
// 	            thumbnail.find('i').click(function() { // thumnail 안의 i 태그에 클릭 이벤트 추가
// 	                removeThumbnail($(this).parent(), fileId); // imageArea 요소, fileId를 지정
// 	            });
// 	            $('#thumbnailArea > div').append(thumbnail);
	            
// 	        }
	
// 	        reader.readAsDataURL(input.files[0]); // url 형태로 파일을 반환
	    }
	}
	
	// 썸네일 제거하여 파일 제거
	function removeThumbnail(del, fileId) {
        console.log("파일아이디 알려줘 ㅣ " + fileId);
		var data = new FormData();
		data.append(fileId, $("#" + fileId)[0].files[0]);
        
        $.ajax({
			type: "POST",
			url: "ImageDelete",
			enctype: 'multipart/form-data',
			data: data,
			<%-- multipart/form-data로 전송 --%>
			contentType: false, 
			<%-- formData가 String이 되지않음 --%>
			processData: false, 
			success: function(result) {
				console.log(result);
				if(result != 'false') {
// 				    var thumbnail = $(del).parent(); // imageArea의 부모인 thumnail 클래스 지정
					
// 				    formData.delete(fileId); // key가 fileId인 값을 formdata에서 제거
				
// 				    // 파일 입력 필드의 값을 조정합니다.
// 				    var nextFileId = Number(fileId.replace('file', '')) + 1; // 삭제 파일Id의 인덱스 + 1
// 				    while (formData.get('file' + nextFileId)) { // 다음 인덱스부터 마지막까지 반복
// 				    	// 삭제된 순번의 자리에 다음 순번 파일을 넣기
// 				        formData.set('file' + (nextFileId - 1), formData.get('file' + nextFileId));
// 				        nextFileId++;
// 				    }
// 				    formData.delete('file' + (nextFileId - 1)); // 마지막 파일 제거
				
// 				    // 인풋 태그의 파일 제거(동일 파일 제거 후 재업로드시 onchange를 위함)
// 				    $("#" + fileId).val('');
				    
// 				    thumbnail.remove(); // 썸네일 영역 삭제
// 				}
// 				Swal.fire({
// 					position: 'center',
// 					icon: 'success',
// 					title: '사진 업로드함 ㅅㄱ.',
// 					showConfirmButton: false,
// 					timer: 2000,
// 					toast: true
// 				});
// 				$(this).blur();
				}
			}
		});
		
// 	    var thumbnail = $(del).parent(); // imageArea의 부모인 thumnail 클래스 지정
	
// 	    formData.delete(fileId); // key가 fileId인 값을 formdata에서 제거
	
// 	    // 파일 입력 필드의 값을 조정합니다.
// 	    var nextFileId = Number(fileId.replace('file', '')) + 1; // 삭제 파일Id의 인덱스 + 1
// 	    while (formData.get('file' + nextFileId)) { // 다음 인덱스부터 마지막까지 반복
// 	    	// 삭제된 순번의 자리에 다음 순번 파일을 넣기
// 	        formData.set('file' + (nextFileId - 1), formData.get('file' + nextFileId));
// 	        nextFileId++;
// 	    }
// 	    formData.delete('file' + (nextFileId - 1)); // 마지막 파일 제거
	
// 	    // 인풋 태그의 파일 제거(동일 파일 제거 후 재업로드시 onchange를 위함)
// 	    $("#" + fileId).val('');
	    
// 	    thumbnail.remove(); // 썸네일 영역 삭제
	    
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
										<option selected disabled value="">카테고리</option>
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
							</div>
						</div>
				   	</div>
				    <div class="post-content mt-3">
						<div class="form-floating">
							<textarea class="form-control communityFormSubject formFocus" name="community_content" id="content" style="height: 500px;" required></textarea>
							<label id="contentLength" for="content">내용 (0/1000)</label>
						</div>
				    </div>
				    <div class="post-file mt-3" id="uploadArea">
				    	<div class="row mx-auto" style="height:110px;">
							<div class="col-2 border rounded-3 h-100 me-2" id="fileArea" onclick="clickFile()">
							<i class="material-icons d-flex justify-content-center" style="font-size:110px;">image</i>
							</div>
							<div class="col border rounded-3 d-flex align-items-center h-100" id="thumbnailArea">
								<div class="scrolling-wrapper row flex-nowrap mx-auto h-100">
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