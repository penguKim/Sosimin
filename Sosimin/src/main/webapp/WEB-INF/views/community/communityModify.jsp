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
	
	
	// ---- 이미지 파일 처리
	var formData = new FormData();
	
	// 폼데이터에 없는 파일 인덱스 판별
	function clickFile() {
		var fileCount = 0; // 업로드 횟수 카운트
		
		for(var i = 1; i <= 5; i++) { // 파일이 업로드되었으면 카운트 추가
			if(formData.get('file' + i)) {
				fileCount++;
			}
		}
		
		// 카운트가 5이상일 경우 리턴
		if(fileCount >= 5) {
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '최대 5장만 등록가능합니다.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
			$("#fileArea i").css("color", "red");
			return;
		}
		
		// 업로드가 안된 input 클릭
	    for (var i = 1; i <= 5; i++) {
	        if (!formData.get('file' + i)) {
	            $('#file' + i).click();
	            break;
	        }
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
// 	    		$(input).val(""); // 해당 input태그의 파일 삭제
				$(input).replaceWith($(input).clone(true)); // clone()으로 복제후 replaceWith()로 교체
	    		return;
	    	}
	    	 
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
  	 	            				'<div class="imageArea ' + fileId + ' position-relative">'
  	 	            			   +'	<img class="border rounded-3" src="${pageContext.request.contextPath}/resources/upload/' 
  	 	            			  		 + result + '" style=\"width: 80px; height: 80px;\">'
  	 	            			   +'	<i class="delBtn material-icons position-absolute translate-middle"'
  	 	            			   +"onclick='removeThumbnail(this, \"" + fileId + "\")'>cancel</i>"
	 	            			   +'</div>'
  	 	            			   );
// 	   	 	            thumbnail.find('i').click(function() { // thumnail 안의 i 태그에 클릭 이벤트 추가
// 	   	 	                removeThumbnail($(this).parent(), fileId); // imageArea 요소, fileId를 지정
// 	   	 	            });
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
				    var imageArea = $(del).parent(); // x버튼의 부모인 imageArea 클래스 지정
				    var thumbnail = imageArea.parent(); // imageArea의 부모인 thumnail 클래스 지정
					
				    formData.delete(fileId); // key가 fileId인 값을 formdata에서 제거
				    $("#" + fileId).replaceWith($("#" + fileId).clone(true)); // input 태그에서 제거
				    // 파일 입력 필드의 값을 조정합니다.
				    var nextFileId = Number(fileId.replace('file', '')) + 1; // 삭제 파일Id의 인덱스 + 1
				    while (formData.get('file' + nextFileId)) { // 다음 인덱스부터 마지막까지 반복
				        // 삭제된 순번의 자리에 다음 순번 파일을 넣기
				        formData.set('file' + (nextFileId - 1), formData.get('file' + nextFileId));
				        // 다음 순번의 파일 함수 파라미터로 fileId값 1빼기
				        $(".file" + nextFileId + " i").attr("onclick", "removeThumbnail(this, 'file" + (nextFileId - 1) + "')");
				        // 다음 순번의 파일 영역 클래스로 1빼기
				        $(".file" + nextFileId).addClass('file' + (nextFileId - 1)).removeClass("file" + nextFileId);
				        nextFileId++;
				    }
				    
				    console.log("마지막 nextFileId : " + nextFileId);
				    formData.delete('file' + (nextFileId - 1)); // 마지막 파일 제거
				
				    // 인풋 태그의 파일 제거(동일 파일 제거 후 재업로드시 onchange를 위함)
// 				    $("#" + fileId).val('');
				    $("#file" + (nextFileId - 1)).replaceWith($("#file" + (nextFileId - 1)).clone(true));
				    console.log("마지막 파일엔 뭐가 들었지? : " + $("#file" + (nextFileId - 1)).val());
				    
				    thumbnail.remove(); // 썸네일 영역 삭제
				    $("#fileArea i").css("color", ""); // 업로드 아이콘 정상 색상
				}
			}
		});
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
   							<c:forEach var="image" items="${imageList}" varStatus="status">
   						<div class="file" id="fileItemArea${status.index + 1 }">
								<c:choose>
									<c:when test="${image ne null and image ne ''}">
										<a href="${pageContext.request.contextPath }/resources/upload/${image}" download="${fn:substringAfter(image, '_')}">${fn:substringAfter(image, '_')}</a>
										<a href="javascript:deleteFile(${com.community_id}, '${image }', ${status.index + 1 })">
											<i class="material-icons">cancel</i>
										</a>	
									</c:when>
									<c:otherwise>
										<input type="file" name="file${status.index + 1 }">
									</c:otherwise>
								</c:choose>
						</div>
   							</c:forEach>
				    </div>
<!--    				    <div class="post-file mt-3" id="uploadArea"> -->
<!-- 				    	<div class="row mx-auto" style="height:110px;"> -->
<!-- 							<div class="col-2 border rounded-3 h-100 me-2" id="fileArea" onclick="clickFile()"> -->
<!-- 							<i class="material-icons d-flex justify-content-center" style="font-size:110px;">image</i> -->
<!-- 							</div> -->
<!-- 							<div class="col border rounded-3 d-flex align-items-center h-100" id="thumbnailArea"> -->
<!-- 								<div class="scrolling-wrapper row flex-nowrap mx-auto h-100"> -->
<%-- 									<c:forEach var="image" items="${imageList}" varStatus="status"> --%>
<%-- 									    <c:if test="${image ne null and image ne ''}"> --%>
<!-- 									        <div class="thumbnail col-auto mx-2 pt-3 px-1"> -->
<%-- 									            <div class="imageArea file${status.index + 1} position-relative"> --%>
<%-- 									                <img class="border rounded-3" src="${pageContext.request.contextPath}/resources/upload/${image}" style="width: 80px; height: 80px;"> --%>
<%-- 									                <i class="delBtn material-icons position-absolute translate-middle" onclick='removeThumbnail(this, "file${status.index + 1}")'>cancel</i> --%>
<!-- 									            </div> -->
<!-- 									        </div> -->
<%-- 									    </c:if> --%>
<%-- 									</c:forEach> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<input type="file" id="file1" name="file1" accept="image/*" style="display:none" onchange="showThumbnail(this)"> -->
<!-- 							<input type="file" id="file2" name="file2" accept="image/*" style="display:none" onchange="showThumbnail(this)"> -->
<!-- 							<input type="file" id="file3" name="file3" accept="image/*" style="display:none" onchange="showThumbnail(this)"> -->
<!-- 							<input type="file" id="file4" name="file4" accept="image/*" style="display:none" onchange="showThumbnail(this)"> -->
<!-- 							<input type="file" id="file5" name="file5" accept="image/*" style="display:none" onchange="showThumbnail(this)"> -->
<!-- 						</div> -->
						<div class="row">
							<div class="col">
								이미지는 최대 5장까지 등록가능합니다.
							</div>
						</div>
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