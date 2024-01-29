<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Sosimin</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
    <link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sosimham.css" />
	
	<script>
	$(function(){
		// 드롭다운 메뉴 아이템이 클릭되었을 때 실행되는 함수
		$('.itemGu').click(function() {
			// 클릭된 드롭다운 메뉴 아이템의 텍스트를 가져와서 버튼의 내용으로 설정합니다.
			var gu = $(this).text();
		    $('.btngu').text(gu);
		    let object = "${object}";
		    console.log("object : " + object);
		    console.log(object[gu]);
		    $(".dongSelect").html("");
		    for(let i = 0; i<object[gu].length; i++){
			    $(".dongSelect").prepend(
		    		'<li><a class="dropdown-item itemDong" onclick="itemdong(this)">'+ object[gu][i] +'</a></li>'
			    );
		    }
	    });
		
	});// document.ready END
	function itemdong(dong){
		var dong = $(dong).text();
		$('.btndong').text(dong);
	}
	</script>
</head>

<body>
    <!-- /End Preloader -->
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
	<h1> 소심함 무인택배함 </h1>
	 <!-- Example single danger button -->
	<div class="btn-group">
	  <button type="button" class="btngu btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	    구 선택
	  </button>
	  <ul class="dropdown-menu">
	  	<c:forEach var="i" items="${resultMap}" >
	    	<li><a class="dropdown-item itemGu" href="#">${i.key}</a></li>
	    </c:forEach>
	  </ul>
	  <button type="button" class="btndong btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	    동 선택
	  </button>
	  <ul class="dropdown-menu dongSelect">
	  	<li><a class="dropdown-item itemDong" href="#">구를 먼저 선택해주세요.</a></li>
	  </ul>
	 </div>
	
	<div class="btn-group categoryBtn px-0 col-xl-6 col-md-12 col-sm-12 col-12 mb-2" role="group" aria-label="Basic radio toggle button group">
		<input type="radio" class="btn-check" name="category" id="allCategory" value="전체" autocomplete="off" checked>
		<label class="btn btn-outline-primary" for="allCategory">전체</label>
		<c:forEach var="i" items="${resultMap}" >
			<input type="radio" class="btn-check" name="category" id="${i.key}" value="${i.key}" autocomplete="off" >
			<label class="btn btn-outline-primary" for="${i.key}">${i.key}</label>
		</c:forEach>
	</div>
	
	<img src="${pageContext.request.contextPath}/resources/images/sosimham/강서구.jsp">
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<footer class="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

</body>

</html>