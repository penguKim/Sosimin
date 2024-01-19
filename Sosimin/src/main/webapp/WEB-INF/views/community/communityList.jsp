<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="container-sm">
		<section id="listForm">
			<form action="">
				<div class="form-group row row-cols-1 row-cols-sm-2 row-cols-md-2">
					<input type="text" name="searchKeyword" class="col-9 col-md-5 form-control">
					<input type="button" value="검색" class=" col-3 col-md-1 btn btn-primary">
				</div>
			</form>
			<div>
				<table>
					<tr id="tr_top">
						<td width="100px">번호</td>
						<td>제목</td>
						<td width="150px">작성자</td>
						<td width="150px">날짜</td>
						<td width="100px">조회수</td>
					</tr>
					<%-- JSTL 과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
					<c:forEach var="board" begin="0" end="15" varStatus="status">
						<tr>
							<td>${status.index }</td>
							<td id="subject">
		<%-- 						<a href="BoardDetail?board_num=${board.board_num }&pageNum=${pageNum }"> --%>
									제목입니다.
		<!-- 							</a> -->
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
		</section>
	</div>
</body>
</html>