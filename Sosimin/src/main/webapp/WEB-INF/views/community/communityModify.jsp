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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
<script type="text/javascript">
	$(function() {
		// 회원의 지역 정보 가져오기
		$.ajax({
			type: "POST",
			url: "TownCheck",
			dataType: "json",
			success: function(data) {
				if(typeof data.gu !== 'undefined') {
					$(".breadcrumbs-content").html(
							'<h1 class="page-title">' + data.gu + '의 커뮤니티</h1>'
							);
				} else {
					$(".breadcrumbs-content").html(
							'<h1 class="page-title">부산광역시의 커뮤니티</h1>'
							);
				}

			}
		});
		
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
		
		
		$("#titleLenth").text('제목 (' + $("#title").val().length + '/40)');
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
	            $('#titleLenth').text('제목 (40/40)');
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
	    
	    $("#contentLength").text('내용 (' + $("#content").val().length + '/1000)');
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
	            $('#contentLength').text('내용 (1000/1000)');
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
	});
	
	
	

	// 5장의 이미지 판별
	function clickFile() {
	    var existCount = $('.thumbnail').length;  // 이미 존재하는 썸네일 수
	    var uploadableCount = 5 - existCount;  // 업로드 가능한 이미지 수
	
	    if (uploadableCount <= 0) {
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '최대 5장만 등록가능합니다.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
			$("#fileArea i").css("color", "red");
	        return false;
	    } else {
	        $("#file" + (existCount + 1)).click();
	    }
	}
	
	// 파일 업로드하여 썸네일 생성
	function showThumbnail(input) {
		
	    if (input.files && input.files[0]) { // 각 input에 첫번째 파일이 있는 경우
	    	var file = input.files[0];
	    	var fileType = file["type"]; // 파일의 형식을 image/jpeg 등의 형식으로 출력
	        var validImageTypes = ["image/gif", "image/jpeg", "image/png"];

	    	if($.inArray(fileType, validImageTypes) < 0) { // fileType 이 배열에 포함되지 않으면 -1 리턴
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '허용되지 않는 확장자입니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
				$(input).replaceWith($(input).clone(true)); // clone()으로 복제후 replaceWith()로 교체
	    		return;
	    	}
	    	
	    	var reader = new FileReader();
	        var fileId = input.id; // input의 id 요소
            
// 	        console.log("파일아이디 알려줘 ㅣ " + fileId);
	        
			reader.onload = function (e) {
 	            var thumbnail = $(
	 	            		'<div class="thumbnail col-auto mx-2 pt-3 px-1 ' + fileId + '">').html(
 	 	            				'<div class="imageArea position-relative">'
  	 	            			   +'	<img class="border rounded-3" src="' 
  	 	            			  		 + e.target.result + '" style=\"width: 80px; height: 80px;\">'
  	 	            			   +'	<i class="delBtn material-icons position-absolute translate-middle"'
  	 	            			   +"onclick='removeThumbnail(this, \"" + fileId + "\", \"false\" )'>cancel</i>"
	 	            			   +'</div>'
  	 	            			   );
		   	 	$('#thumbnailArea > div').append(thumbnail);
   						
   			}
			
			reader.readAsDataURL(input.files[0]);
  					
  			$(".scrolling-wrapper").scrollLeft($(".scrolling-wrapper").width());
  			$(this).blur();
	            
	    }
	}
	
	function removeThumbnail(del, fileId , path) {
        console.log("파일아이디 알려줘 ㅣ " + fileId);
        console.log("파일아이디 숫자만 알려줘 ㅣ " + fileId.substring(4));
        
   	    var imageArea = $(del).parent(); // x버튼의 부모인 imageArea 클래스 지정
   	    var thumbnail = imageArea.parent(); // imageArea의 부모인 thumnail 클래스 지정
		var currentFileIndex = Number(fileId.replace('file', ''));
		var nextFileIndex = currentFileIndex + 1; 
		var newIdAndName;
		if(path == "false") {
			while ($("#file" + nextFileIndex).length) { 
				// id 및 name 변경
				var nextFile = $("#file" + nextFileIndex);
				let src = $(".file" + nextFileIndex + " img").attr("src");
				console.log(src);
				if(src && src.startsWith("data:image/")) {
					$(".file" + nextFileIndex + " i").attr("onclick", "removeThumbnail(this, 'file" + currentFileIndex + "', 'false')");
				} else {
					$(".file" + nextFileIndex + " i").attr("onclick", "removeThumbnail(this, 'file" + currentFileIndex + "')");
				}
				$(".file" + nextFileIndex).addClass('file' + currentFileIndex).removeClass("file" + nextFileIndex);
				                
				newIdAndName = 'file' + currentFileIndex;
				nextFile.attr({"id": newIdAndName, "name": newIdAndName});
				
				currentFileIndex++;
				nextFileIndex++;
			}
			
			let thisIndex = Number(fileId.replace('file', ''));
			
			// 인풋 태그의 파일 제거(동일 파일 제거 후 재업로드시 onchange를 위함)
			var oldFileInput = $("#file" + thisIndex);
			var newFileInput = oldFileInput.clone(true);
			oldFileInput.replaceWith(newFileInput);
			newFileInput.attr({"id": 'file5', "name": 'file5'});

			thumbnail.remove(); // 썸네일 영역 삭제
			$("#fileArea i").css("color", ""); // 업로드 아이콘 정상 색상
           	
		} else {
			console.log("파일의 경로는? : " + path);
			Swal.fire({
				title: '기존의 사진을 삭제하시겠습니까?',
				text: "삭제한 사진은 복구하지 못합니다.",
				icon: 'question',
				showCancelButton: true,
				confirmButtonColor: '#d33',
				cancelButtonColor: '#6c757d',
				confirmButtonText: '삭제',
				cancelButtonText: '취소',
				reverseButtons: true,
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						type: "POST",
						url: "CommunityImageDelete",
						data: {
							community_id: ${param.community_id},
							['community_image' + fileId.substring(4)]: path 
						},
						success: function(result) {
							console.log(result);
				        	
							while ($("#file" + nextFileIndex).length) { 
								// id 및 name 변경
								var nextFile = $("#file" + nextFileIndex);
								let src = $(".file" + nextFileIndex + " img").attr("src");
								console.log(src);
								if(src && src.startsWith("data:image/")) {
									$(".file" + nextFileIndex + " i").attr("onclick", "removeThumbnail(this, 'file" + currentFileIndex + "', 'false')");
								} else {
									$(".file" + nextFileIndex).addClass('file' + currentFileIndex).removeClass("file" + nextFileIndex);
								}
								                
								newIdAndName = 'file' + currentFileIndex;
								nextFile.attr({"id": newIdAndName, "name": newIdAndName});
								
								currentFileIndex++;
								nextFileIndex++;
							}
				             
							let thisIndex = Number(fileId.replace('file', ''));
				
							// 인풋 태그의 파일 제거(동일 파일 제거 후 재업로드시 onchange를 위함)
							var oldFileInput = $("#file" + thisIndex);
							oldFileInput.val('');
							var newFileInput = oldFileInput.clone(true);
							oldFileInput.replaceWith(newFileInput);
							newFileInput.attr({"id": 'file5', "name": 'file5'});
					   
							thumbnail.remove(); // 썸네일 영역 삭제
							$("#fileArea i").css("color", ""); // 업로드 아이콘 정상 색상
						}
					}); // ajax
				} else {
					$(this).blur();
				}
			}); // alert 콜백
		} // path 판별
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
                        <h1 class="page-title">&nbsp;</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="Community?pageNum=${param.pageNum }">커뮤니티</a></li>
                        <li>게시글 수정</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
   	<section class="communityArea section">
		<div class="container">
<!-- 			<h1>게시글 수정</h1> -->
			<form action="CommunityModifyPro" name="modifyForm" class="needs-validation" method="post" enctype="multipart/form-data" novalidate>
				<div class="communityForm post p-4 mx-auto" style="width: 65%;">
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
									<label id="titleLenth" for="title">제목 (0/40)</label>
								</div>
							</div>
						</div>
				   	</div>
				    <div class="post-content mt-3">
						<div class="form-floating">
							<textarea class="form-control communityFormSubject formFocus" name="community_content" id="content" style="height: 500px;" required>${com.community_content }</textarea>
							<label id="contentLength" for="content">내용 (0/1000)</label>
						</div>
				    </div>
<!--    				    <div class="post-file mt-3"> -->
<%--    							<c:forEach var="image" items="${imageList}" varStatus="status"> --%>
<%--    						<div class="file" id="fileItemArea${status.index + 1 }"> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${image ne null and image ne ''}"> --%>
<%-- 										<a href="${pageContext.request.contextPath }/resources/upload/${image}" download="${fn:substringAfter(image, '_')}">${fn:substringAfter(image, '_')}</a> --%>
<%-- 										<a href="javascript:deleteFile(${com.community_id}, '${image }', ${status.index + 1 })"> --%>
<!-- 											<i class="material-icons">cancel</i> -->
<!-- 										</a>	 -->
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										<input type="file" name="file${status.index + 1 }"> --%>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
<!-- 						</div> -->
<%--    							</c:forEach> --%>
<!-- 				    </div> -->
   				    <div class="post-file mt-3" id="uploadArea">
				    	<div class="row mx-auto" style="height:110px;">
							<div class="col-2 border rounded-3 h-100 me-2" id="fileArea" onclick="clickFile()">
							<i class="material-icons d-flex justify-content-center" style="font-size:110px;">image</i>
							</div>
							<div class="col border rounded-3 d-flex align-items-center h-100" id="thumbnailArea">
								<div class="scrolling-wrapper row flex-nowrap mx-auto h-100">
									<c:forEach var="image" items="${imageList}" varStatus="status">
									    <c:if test="${image ne null and image ne ''}">
									        <div class="thumbnail col-auto mx-2 pt-3 px-1 file${status.index + 1}">
									            <div class="imageArea  position-relative">
									                <img class="border rounded-3" src="${pageContext.request.contextPath}/resources/upload/${image}" style="width: 80px; height: 80px;">
									                <i class="delBtn material-icons position-absolute translate-middle" onclick='removeThumbnail(this, "file${status.index + 1}", "${image}")'>cancel</i>
									            </div>
									        </div>
									    </c:if>
									</c:forEach>
								</div>
							</div>
							<input type="file" id="file1" name="file1" accept="image/*" style="display:none" onchange="showThumbnail(this)">
							<input type="file" id="file2" name="file2" accept="image/*" style="display:none" onchange="showThumbnail(this)">
							<input type="file" id="file3" name="file3" accept="image/*" style="display:none" onchange="showThumbnail(this)">
							<input type="file" id="file4" name="file4" accept="image/*" style="display:none" onchange="showThumbnail(this)">
							<input type="file" id="file5" name="file5" accept="image/*" style="display:none" onchange="showThumbnail(this)">
						</div>
						<div class="row">
							<div class="col">
								이미지는 최대 5장까지 등록가능합니다.
							</div>
						</div>
				    </div>
				</div>
				<div class="mx-auto mt-2 row d-flex justify-content-between" id="commandCell" style="width: 65%;">
					<input type="button" class="btn btn-secondary col-xl-2 col-md-3 col-12 me-2" value="돌아가기" onclick="history.back()">
					<input type="submit" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" id="modifyBtn" value="수정하기">
				</div>
				<input type="hidden" name="community_id" value="${com.community_id }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
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