<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>

<script type="text/javascript">
$(function(){
	/* 
	@@@ 검색창과 관련된 설정 항목 @@@
	1. 검색창은 Id가 searchBox 인 영역을 클릭 했을 경우 나타난다.
	2. 이 검색창은 
		1) 마우스 스크롤
		2) searchBox 밖의 영역 클릭
		3) "닫기" 글자 클릭 
		했을 경우 사라진다.
	*/
	hideHandler();
	$(window).on("scroll", hideHandler);
	
	// 특정 영역 외의 클릭 이벤트를 감지하는 코드입니다
	$(document).on('click', function(event) {
	    // 클릭된 요소가 특정 영역 내에 속하는지 확인합니다
	    if (!$(event.target).closest('#searchBox').length || $(event.target).is('#closeSearchBox')) {
	        // 클릭된 요소가 특정 영역 외부에 있을 경우 경고창을 띄웁니다
	    	hideHandler();
	    }
	});
	
	
	function hideHandler() {
		$("#Recent").hide();
		$("#Popular").hide();
	}
	
});// document.ready function END

function showHandler(){
	$("#Recent").show();
}

function RecentSearchs(){
	alert("최근검색어");
	$("#Recent").show();
	$("#Popular").hide();
	$("#recentWordColor").css("color","red");
	$("#popularWordColor").css("color","black");
	
}

function PopularSearches(){
	alert("인기검색어");
	$("#Recent").hide();
	$("#Popular").show();
	$("#recentWordColor").css("color","black");
	$("#popularWordColor").css("color","red");
}

function searchKeywordChange(keyWord){
	if($(keyWord).val() != null){
		$("#searchArea").html(
				'<table border="1">'
	    		+'<tr>'
	    		+	'<td>'+ $(keyWord).val() +'</td>'
	    		+	'<td>연관검색어 테스트</td>'
	    		+'</tr>'
	    		+'<tr>'
	    		+	'<td>공란</td>'
	    		+	'<td><a id="closeSearchBox">닫기</a></td>'
	    		+'</tr>'
	    	    +'</table>'			
		);
	}
}

</script>

<!-- Start Topbar -->
<div class="topbar">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 col-md-4 col-12">
                <div class="top-left">
                    <ul class="menu-top-link">
                        <li>
                        	<!-- 나라별 언어 선택 -->
                            <div class="select-position">
                                <select id="select5">
                                    <option value="ko-kr" selected>한국어</option>
                                    <option value="0" >English</option>
                                    <option value="1">Español</option>
                                    <option value="2">Filipino</option>
                                    <option value="3">Français</option>
                                    <option value="4">العربية</option>
                                    <option value="5">हिन्दी</option>
                                    <option value="6">বাংলা</option>
                                </select>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-12">
                <div class="top-middle">
                    <ul class="useful-links">
<!--                         <li><a href="./">Home</a></li> -->
<!--                         <li><a href="about-us.html">About Us</a></li> -->
<!--                         <li><a href="contact.html">Contact Us</a></li> -->
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-12">
                <div class="top-end">
<!--                     <div class="user"> -->
<!--                            <a href="login.html">내상점</a> -->
<!--                     </div> -->
                    <ul class="user-login">
                        <li>
                           <a href="login.html">내상점</a>
                        </li>
                        <li>
                            <a href="MemberLogin">로그인</a>
                        </li>
                        <li>
                            <a href="MemberJoin">회원가입</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Topbar -->

<!-- Start Header Middle -->
<div class="header-middle">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-3 col-md-3 col-7">
                <!-- Start Header Logo -->
                <a class="navbar-brand" href="./">
                    <img src="${pageContext.request.contextPath}/resources/images/logo/sosiminLogo.png" alt="Logo">
                </a>
                <!-- End Header Logo -->
            </div>
            <div class="col-lg-5 col-md-7 d-xs-none" id="searchBox" onclick="showHandler()">
                <!-- Start Main Menu Search -->
                <div class="main-menu-search">
                    <!-- navbar search start -->
                    <div class="navbar-search search-style-5">
                        <div class="search-input">
                            <input type="text" id="searchKeyword" placeholder="상품명, 지역명, @상점명 입력" onkeyup="searchKeywordChange(this)" >
                        </div>
                        <div class="search-btn">
                            <button onclick="location.href='searchKeyword'">
                            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
								  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg>
                            </button>
                        </div>
                    </div>
                    <!-- navbar search Ends -->
                </div>
                <!-- End Main Menu Search -->
                <div id="Recent">
                	<table border="1">
                		<tr>
                			<td><a onclick="RecentSearchs()" id="recentWordColor">최근검색어</a></td>
                			<td><a onclick="PopularSearches()" id="popularWordColor">인기검색어</a></td>
                		</tr>
                		<tr border="1">
                			<td colspan="2">1</td>
                		</tr>
                		<tr>
                			<td colspan="2">2</td>
                		</tr>
                		<tr>
                			<td colspan="2">3</td>
                		</tr>
                		<tr>
                			<td colspan="2">4</td>
                		</tr>
                		<tr>
                			<td colspan="2">5</td>
                		</tr>
                		<tr>
                			<td colspan="2">6</td>
                		</tr>
                		<tr>
                			<td colspan="2">7</td>
                		</tr>
                		<tr>
                			<td colspan="2">8</td>
                		</tr>
                		<tr>
                			<td colspan="2">9</td>
                		</tr>
                		<tr>
                			<td>최근검색어 삭제</td>
                			<td><a id="closeSearchBox">닫기</a></td>
                		</tr>
                	</table>
                </div>
                <div id="Popular">
                	<table border="1">
                		<tr>
                			<td><a onclick="RecentSearchs()">최근검색어</a></td>
                			<td><a onclick="PopularSearches()">인기검색어</a></td>
                		</tr>
                		<tr>
                			<td>1</td>
                			<td>군만두</td>
                		</tr>
                		<tr>
                			<td>2</td>
                			<td>참치 올린 불닭</td>
                		</tr>
                		<tr>
                			<td>3</td>
                			<td>고추짬뽕</td>
                		</tr>
                		<tr>
                			<td>4</td>
                			<td>깐풍기</td>
                		</tr>
                		<tr>
                			<td>5</td>
                			<td>깐쇼새우</td>
                		</tr>
                		<tr>
                			<td>6</td>
                			<td>이재모피자</td>
                		</tr>
                		<tr>
                			<td>7</td>
                			<td>국밥</td>
                		</tr>
                		<tr>
                			<td>8</td>
                			<td>카라멜팝콘</td>
                		</tr>
                		<tr>
                			<td>9</td>
                			<td>컨트리맨즈</td>
                		</tr>
                		<tr>
                			<td>최근검색어 삭제</td>
                			<td><a id="closeSearchBox">닫기</a></td>
                		</tr>
                	</table>
                </div>
            </div>
            <div class="col-lg-4 col-md-2 col-5">
                <div class="middle-right-area">
                	<a href="ProductRegist">판매하기  </a>

                	<a href="./">관심  </a>
                	<a href="./">채팅톡</a>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Header Middle -->
<!-- Start Header Bottom -->
<div class="container">
    <div class="row align-items-center">
        <div class="col-lg-8 col-md-6 col-12">
            <div class="nav-inner">
                <!-- End Mega Category Menu -->
                <!-- Start Navbar -->
                <nav class="navbar navbar-expand-lg">
                    <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                        <ul id="nav" class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <a href="./" class="active" aria-label="Toggle navigation">Home</a>
                            </li>
                            <li class="nav-item">
								<a href="./">커뮤니티</a>
                                <ul class="sub-menu collapse" id="submenu-1-2">
                                    <li class="nav-item"><a href="about-us.html">About Us</a></li>
                                    <li class="nav-item"><a href="csMain">고객센터</a></li>


                                    <li class="nav-item"><a href="login.html">Login</a></li>
                                    <li class="nav-item"><a href="register.html">Register</a></li>
                                    <li class="nav-item"><a href="mail-success.html">Mail Success</a></li>
                                    <li class="nav-item"><a href="404.html">404 Error</a></li>
                                </ul>
                                
                            </li>
                            <li class="nav-item">
                                <a href="./">카테고리</a>
                                <ul class="sub-menu collapse" id="submenu-1-3">
                                    <li><a href="product-grids.html">상의</a></li>
	                                <li><a href="product-grids.html">하의</a></li>
	                                <li><a href="product-grids.html">아우터</a></li>
	                                <li><a href="product-grids.html">아동복</a></li>
	                                <li><a href="product-grids.html">셋업/세트</a></li>
	                                <li><a href="product-grids.html">패션/잡화</a></li>
	                                <li><a href="product-grids.html">신발</a></li>
	                                <li><a href="product-grids.html">기타</a></li>
<!--                                     <li class="nav-item"><a href="product-grids.html">Shop Grid</a></li> -->
<!--                                     <li class="nav-item"><a href="product-list.html">Shop List</a></li> -->
<!--                                     <li class="nav-item"><a href="product-details.html">shop Single</a></li> -->
<!--                                     <li class="nav-item"><a href="cart.html">Cart</a></li> -->
<!--                                     <li class="nav-item"><a href="checkout.html">Checkout</a></li> -->
                                </ul>
                            </li>
                        </ul>
                    </div> <!-- navbar collapse -->
                </nav>
                <!-- End Navbar -->
            </div>
        </div>
    </div>
</div>
<!-- End Header Bottom -->
