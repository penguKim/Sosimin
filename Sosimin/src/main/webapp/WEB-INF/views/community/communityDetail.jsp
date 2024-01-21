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
<style type="text/css">
	.post, #replyArea {
	    width: 40%;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #ccc;
	    border-radius: 10px;
	}
	.post-header, .post-category {
	    border-bottom: 1px solid #ccc;
	    padding-bottom: 10px;
	    margin-bottom: 20px;
	}
	.post-title {
	    margin: 0;
	}
	.post-meta {
	    color: #999;
	    font-size: 0.8em;
	}
	.post-content {
	    text-align: justify;
	    color: #000;
	    height: 500px;
	}

	#commandCell {
	width: 40%;
	margin: 10px auto;
	    text-align: justify;
	}

	#replyTextarea {
		width: 70%;
		height: 50px;
		resize: none; /* 사이즈 조절 막기 */
		vertical-align: middle;
	}
	
	#replySubmit {
		width: 85px;
		height: 55px;
		vertical-align: middle;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- 게시판 상세내용 보기 -->
	<div class="container">
		<div class="post">
		    <div class="post-header">
		    	카테고리명
		        <h2 class="post-title">게시글 제목</h2>
		        <p class="post-meta">홍길동 &nbsp;&nbsp;&nbsp;LV.1</p>
		        <p class="post-meta">1분전 &nbsp;&nbsp;조회수 0</p>
		    </div>
		    <div class="post-content">
		        <p>근로조건의 기준은 인간의 존엄성을 보장하도록 법률로 정한다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다. 감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.</p>
				<p>모든 국민은 법 앞에 평등하다. 누구든지 성별·종교 또는 사회적 신분에 의하여 정치적·경제적·사회적·문화적 생활의 모든 영역에 있어서 차별을 받지 아니한다.</p>
		    </div>
		</div>
				<div id="commandCell">
			<%-- 		<c:if test="${not empty sessionScope.sId and (sessionScope.sId eq board.board_name or sessionScope.sId eq 'admin') }"> --%>
						<input type="button" class="btn btn-secondary" value="수정" onclick="location.href='BoardModifyForm?board_num=${board.board_num}&pageNum=${param.pageNum }'">
						<input type="button" class="btn btn-danger" value="삭제" onclick="confirmDelete()">
			<%-- 		</c:if> --%>
					
					<%-- 목록은 BoardList 서블릿 요청(파라미터 : 페이지번호) --%>
					<input type="button" class="btn btn-secondary" value="목록" onclick="location.href='BoardList?pageNum=${param.pageNum}'">
				</div>
		<section id="replyArea">
			<form action="BoardTinyReplyWrite" method="post">
			<input type="hidden" name="board_num" value="${board.board_num }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<%-- 만약, 아이디를 전송해야할 경우 reply_namem 파라미터 포함 --%>
			<%-- 단, 현재는 별도의 닉네임들을 사용하지 않으므로 임시로 세션아이디 전달 --%>
			<%-- (실제로 세션 아이디 사용시에는 컨트롤러에서 HttpSession 객체를 통해 접근) --%>
			<input type="hidden" name="reply_name" value="${sessionScope.sId }">
			<%-- 세션 아이디가 없을 경우(미로그인 시) 댓글 작성 차단 --%>
			<%-- textarea 및 버튼 disabled 처리 --%>
			<c:choose>
				<c:when test="${empty sessionScope.sId }"> <%-- 세션 아이디 없음 --%>
					<textarea id="replyTextarea" name="reply_content" placeholder="로그인 한 사용자만 작성 가능합니다" disabled></textarea>
					<input type="submit" value="댓글쓰기" id="replySubmit" disabled>
				</c:when>
				<c:otherwise>
					<textarea id="replyTextarea" name="reply_content" required></textarea>
					<input type="submit" value="댓글쓰기" id="replySubmit">
				</c:otherwise>
			</c:choose>
			</form>
			<div id="replyListArea">
				<table>
				<tr>
					<td class="replyContent">
					</td>
				</tr>
				<%-- 댓글 내용(reply_content), 작성자(reply_name), 작성일시(reply_date) 표시 --%>
				<%-- 반복문을 통해 List 객체로부터 Map 객체 꺼내서 출력 --%>
				<c:forEach var="tinyReplyBoard" items="${tinyReplyBoardList }">
						<%-- 댓글 1개에 대한 제어(대댓글 작성 폼 표시, 댓글 제거)를 위한 id 값 지정 --%>
						<%-- 각 댓글(tr 태그)별 고유 id 생성하기 위해 댓글 번호를 id 에 조합 --%>
					<tr id="replyTr_${tinyReplyBoard.reply_num }">
						<td class="replyContent">
							<%-- 대댓글 구분을 위해 reply_re_lev 값이 0 보다 크면 들여쓰기(공백2칸) --%>
							<c:forEach var="i" begin="1" end="${tinyReplyBoard.reply_re_lev }">&nbsp;&nbsp;</c:forEach>
							${tinyReplyBoard.reply_content }
							<%-- 세션 아이지 존재할 경우 대댓글 작성 이미지(reply-icon.png) 추가 --%>
							<c:if test="${not empty sessionScope.sId }">
								<%-- 대댓글 작성 아이콘 클릭 시 자바스크립트 함수 reReplyWriteForm() 호출 --%>
								<%-- 파라미터 : 댓글 번호, 댓글 참조글번호, 댓글 들여쓰기레벨, 댓글 순서번호 --%>
								<a href="javascript:reReplyWriteForm(${tinyReplyBoard.reply_num }, ${tinyReplyBoard.reply_re_ref }, ${tinyReplyBoard.reply_re_lev }, ${tinyReplyBoard.reply_re_seq })"> <%-- 하이퍼링크의 기본 기능으로 이동 --%>
									<img src="${pageContext.request.contextPath }/resources/images/reply-icon.png">
								</a>
								<%-- 또한, 세션 아이디가 댓글 작성자와 동일하거나 관리자일 경우 --%>
								<%-- 댓글 삭제이미지(delete-icon.png) 추가 --%>
								<c:if test="${sessionScope.sId eq tinyReplyBoard.reply_name or sessionScope.sId eq 'admin' }">
									<%-- 대댓글 작성 아이콘 클릭 시 자바스크립트 함수 confirmReplyDelete() 호출 --%>
									<%-- 파라미터 : 댓글 번호 --%>
								<a href="javascript:void(0)" onclick="confirmReplyDelete(${tinyReplyBoard.reply_num })"> <%-- void(0)으로 하이퍼링크를 막고 onclick 이벤트로 이동 --%>
									<img src="${pageContext.request.contextPath }/resources/images/delete-icon.png">
								</a>
								</c:if>
							</c:if>
						</td>
						<td class="replyWriter">${tinyReplyBoard.reply_name }</td>
						<td class="replyDate">
	<%-- 						${tinyReplyBoard.reply_date } --%>
							<%-- 파싱은 문자열을 객체로 변환하는것이고 포맷은 객체를 문자열로 변환하는 것이다. --%>
							<%--
							만약, 테이블 조회 결과를 Map 타입으로 저장 시 날짜 및 시각 데이터가
							JAVA 8 부터 지원하는 LocalXXX 타입으로 관리된다! (ex. LocalDate, LocalTime, LocalDateTime)
							=> 일반 Date 타입에서 사용하는 형태로 파싱 후 다시 포맷 변경하는 작업 필요 
							=> JSTL fmt 라이브러리의 <fmt:parseDate> 태그 활용하여 파싱 후
							   <fmt:formatDate> 태그 활용하여 포맷팅 수행
							=> 1) <fmt:parseDate>
							      var : 파싱 후 해당 날짜를 다룰 객체명
							      value : 파싱될 대상 날짜 데이터
							      pattern : 파싱 대상 날짜 데이터의 형식(이 때, 시각을 표시하는 문자 T 는 단순 문자로 취급하기 위해 'T' 로 표기)
							      type : 대상 날짜 파싱 타입(time : 시각, date : 날짜, both : 둘 다)
							   2) <fmt:formatDate>
							      value : 출력(포맷팅)할 날짜 데이터
							      pattern : 포맷팅 할 날짜 형식
							--%>
							<fmt:parseDate var="parsedReplyDate" value="${tinyReplyBoard.reply_date }" pattern="yyyy-MM-dd'T'HH:mm" type="both" />						 
							<fmt:formatDate value="${parsedReplyDate }" pattern="MM-dd HH:mm"/>
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</section>
	</div>
</body>
</html>