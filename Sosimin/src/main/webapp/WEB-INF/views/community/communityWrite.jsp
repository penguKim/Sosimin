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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
<script type="text/javascript">
	$(function() {
		
	});
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
                        <li>커뮤니티</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
   	<section class="product-grids section">
		<div class="container col-12 mx-auto mt-50">
			<h1>게시판 글 등록</h1>
			<form action="CommunityWritePro" name="writeForm" method="post" enctype="multipart/form-data">
				<div class="post border border-1 rounded-3 p-4">
				    <div class="post-header border-bottom row">
				    	<div>
		<!-- 					<select class="category form-select mb-3 is-invalid" style="width:40%;"> -->
							<select class="category form-select mb-3" style="width:40%;">
									<option selected disabled>카테고리</option>
									<option>동네소식</option>
									<option>동네질문</option>
									<option>일상</option>
							</select>
				    	</div>
				    	
						<div class="col-lg-6 col-md-6 col-12">
							<div class="input-group">
								<input type="text" name="name" class="form-control form-control-lg" placeholder="제목을 입력하세요">
							</div>
							<div class="form-text" id="basic-addon4">Example help text goes outside the input group.</div>
						</div>
			    	</div>
				    <div class="post-content position-relative mt-3">
				    	<textarea rows="" cols=""></textarea>
				    </div>
				</div>
			
			<!-- ------------------------------------------ -->
				<table>
					<tr>
						<td><label for="board_name">카테고리</label></td>
						<td>
							<select>
								<option>카테고리를 선택해주세요</option>
								<option>동네소식</option>
								<option>동네질문</option>
								<option>일상</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label for="board_subject">제목</label></td>
						<td><input type="text" id="board_subject" name="board_subject" required="required" /></td>
					</tr>
					<tr>
						<td><label for="board_content">내용</label></td>
						<td>
							<textarea id="board_content" name="board_content" rows="15" cols="40" required="required"></textarea>
						</td>
					</tr>
					<tr>
						<td><label for="file1">파일첨부</label></td>
						<td>
							<%-- 파일 첨부 형식은 input 태그 type="file" 속성 활용 --%>
							<%-- 한번에 하나의 파일 선택 --%>
							<input type="file" name="file1">
							<input type="file" name="file2">
							<input type="file" name="file3">
	<!-- 						<br>--------------<br> -->
							<%-- 한번에 복수개의 파일 선택 시 multiple 속성 추가 --%>
	<!-- 						<input type="file" name="file" multiple> -->
						</td>
					</tr>
				</table>
				<section id="commandCell">
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="reset" value="다시쓰기">&nbsp;&nbsp;
					<input type="button" value="취소" onclick="history.back()">
				</section>
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
</body>
</html>