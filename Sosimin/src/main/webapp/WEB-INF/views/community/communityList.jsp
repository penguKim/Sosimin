<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<!--     <link rel="stylesheet" href="https://bootstrapmade.com/assets/css/demo.css?v=5.2"> -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<div class="container-sm">
		<div>
			부산진구의 게시글입니다.
		</div>
		<br>
		<br>
		<br>
		<div class="row">
			<div class="col btn-group">
				<input type="button" class="btn btn-outline-primary" value="전체">
				<input type="button" class="btn btn-outline-primary" value="인기글">
				<input type="button" class="btn btn-outline-primary" value="동네소식">
				<input type="button" class="btn btn-outline-primary" value="동네질문">
				<input type="button" class="btn btn-outline-primary" value="일상">
			</div>
			<div class="col">
				<form action="">
<!-- 					<div class="form-group row row-cols-1 row-cols-sm-2 row-cols-md-2"> -->
					<div class="form-group row">
						<input type="text" name="searchKeyword" class="col-5 col-md-7 form-control w-50">
						<input type="button" value="검색" class=" col-3 col-md-2 btn btn-primary">
						<input type="button" value="글쓰기" class="col-4 col-md-2 btn btn-primary mx-1" onclick="location.href='CommunityWrite'" />
					</div>
				</form>
			</div>
		</div>
			<div>
				<table class="table table-hover">
					<tr class="table-light">
						<td width="100px">번호</td>
						<td>제목</td>
						<td width="150px">작성자</td>
						<td width="150px">날짜</td>
						<td width="100px">조회수</td>
					</tr>
					<c:forEach var="board" begin="0" end="15" varStatus="status">
						<tr>
							<td>${status.index }</td>
							<td id="subject">
								<a href="CommunityDetail?community_id=1&pageNum=1">
									제목입니다.
									</a>
							</td>
							<td>작성자</td>
							<td>
		<%-- 						<fmt:formatDate value="${board.board_date }" pattern="yy-MM-dd HH:mm"/> --%>
								2024-01-19
							</td>
							<td>0</td>
						</tr>
					</c:forEach>
				</table>
			</div>
	</div>
<!-- 	<footer class="footer"> -->
<%-- 		<jsp:include page="../inc/bottom.jsp"></jsp:include> --%>
<!-- 	</footer> -->
</body>
</html>