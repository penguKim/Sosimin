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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<article id="writeForm">
		<h1>게시판 글 등록</h1>
		<form action="CommunityWritePro" name="writeForm" method="post" enctype="multipart/form-data">
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
	</article>
</body>
</html>