<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>

<script type="text/javascript">



$(function(){
// ######################테스트 데이터 설정######################
var clickCount = 0;

  $('.nav-inner').click(function() {
    clickCount++;

    if (clickCount === 3) {
      var keywords = ["테스트1", "테스트2", "테스트3", "테스트4", "테스트5", "테스트6", "테스트7", "테스트8", "테스트9", "테스트10"];
      localStorage.setItem("keywords", JSON.stringify(keywords));

      alert("keywords 배열이 로컬 스토리지에 저장되었습니다.");
      updateTable();
      clickCount = 0;
    }
  });
// ######################테스트 데이터 설정######################

	
	
// 	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 로컬 스토리지 값이 변경될 때 실행할 함수
	
	updateTable();
	
	// 로컬 스토리지 값이 변경될 때 updateTable 함수 실행
	window.addEventListener('storage', function(event) {
	  if (event.key === 'keywords') {
	    updateTable();
	  }
	});
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	/* 
	@@@ 검색창과 관련된 설정 항목 @@@
	1. 검색창은 Id가 searchBox 인 영역을 클릭 했을 경우 나타난다.
	2. 이 검색창은 
		1) 마우스 스크롤
		2) searchBox 밖의 영역 클릭
		3) "닫기" 글자 클릭 
		했을 경우 사라진다.
	3. 이 검색창은
	   1) 아무것도 입력하지 않고 엔터키 클릭
	   2) 돋보기 클릭 시
	   검색기능이 동작하지 않는다
	*/
	hideHandler();
	$(window).on("scroll", hideHandler);
	
	// 특정 영역 외의 클릭 이벤트를 감지하는 코드입니다
	$(document).on('click', function(event) {
	    // 클릭된 요소가 특정 영역 내에 속하는지 확인합니다
	    if (!$(event.target).closest('#searchBox').length || $(event.target).is('#closeSearchBox')) {
	        // 클릭된 요소가 특정 영역 외부에 있을 경우 경고창을 띄웁니다
	        if(!$(event.target).is('.localStarageDeleteOne') && !$(event.target).is('#localStorageClean') ){
		    	hideHandler();
		    }
	    }
	});
	
	
	function hideHandler() {
		$("#Recent").hide();
		$("#Popular").hide();
	}
	
	//엔터키 누를 경우 텍스트 가지고 주소 이동
	//(form태그 쓰면 css 다 부서짐 그래서 그냥 이렇게 함)
	$("#searchKeyword").keyup(function(event) {
	    if (event.keyCode === 13) {
	      searchKeyword();
	    }
  	});

	$(".recentWordColor").css("color","red");
	$(".popularWordColor").css("color","black");
});// document.ready function END

function searchKeyword() {
	var keyword = $("#searchKeyword").val();
	if(keyword != "" && keyword != null){
		//@@@@@@@@@@@@@@@@@@로컬스토리지 설정@@@@@@@@@@@@@@@@@@@@@
		// 로컬스토리지에 저장할 키의 이름
		const localStorageKey = 'keywords';
		// 기존의 키워드 배열 가져오기
		let keywords = JSON.parse(localStorage.getItem(localStorageKey)) || [];
		// 새로운 키워드 추가하기
		keywords.push(keyword);
		// 최대 갯수를 초과하는 경우 가장 오래된 데이터부터 제거
		if (keywords.length > 10) {
		  keywords = keywords.slice(keywords.length - 10);
		}
		// 로컬스토리지에 업데이트된 키워드 배열 저장
		localStorage.setItem(localStorageKey, JSON.stringify(keywords));
		//@@@@@@@@@@@@@@@@@@로컬스토리지 설정@@@@@@@@@@@@@@@@@@@@@
	
		var searchKeywordUrl = "searchKeyword?keyword=" + encodeURIComponent(keyword);
		window.location.href = searchKeywordUrl;
	}
}
function showHandler(){
	$("#Recent").show();
}

function RecentSearchs(){
	alert("최근검색어");
	$("#Recent").show();
	$("#Popular").hide();
	$(".recentWordColor").css("color","red");
	$(".popularWordColor").css("color","black");
	
}

function PopularSearches(){
	alert("인기검색어");
	$("#Recent").hide();
	$("#Popular").show();
	$(".recentWordColor").css("color","black");
	$(".popularWordColor").css("color","red");
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

function localStorageClean(){
	window.localStorage.clear();
	// 테이블 생성
	let tableHTML = '<table>';
	tableHTML += 
		'<tr>'
		+'	<td>'
		+'		<a onclick="RecentSearchs()" class="recentWordColor">최근검색어</a>'
		+'	</td>'
		+'	<td>'
		+'		<a onclick="PopularSearches()" class="popularWordColor">인기검색어</a>'
		+'	</td>'
		+'</tr>';
		
	tableHTML +=
		'<tr>'
		+'<td colspan="2">'
		+'최근 검색어가 없습니다.'
		+'</td>'
		+'</tr>'
		
	tableHTML += 
		'<tr>'
		+	'<td>'
		+	'	<a onclick="localStorageClean()" id="localStorageClean">최근검색어 삭제</a>'
		+	'</td>'
		+	'<td>'
		+	'	<a id="closeSearchBox">'
		+	'		닫기'
		+	'	</a>'
		+	'</td>'
		+'</tr>' 
		
		
	tableHTML += '</table>';

	// HTML 영역에 테이블 추가
	$("#Recent").html(tableHTML);
}

function updateTable() {
	const localStorageKey = 'keywords';
	const keywords = JSON.parse(localStorage.getItem(localStorageKey)) || [];
	// 테이블 생성
	let tableHTML = '<table>';
	tableHTML +=
		'<tr>'
		+ '  <td>'
	    + '    <a onclick="RecentSearchs()" class="recentWordColor">최근검색어</a>'
	    + '  </td>'
	    + '  <td>'
	    + '    <a onclick="PopularSearches()" class="popularWordColor">인기검색어</a>'
	    + '  </td>'
	    + '</tr>';
	// 키워드 배열을 순회하며 테이블 행 추가
	if(keywords.length == 0){
		tableHTML +=
			"<tr>"
			+"	<td colspan='2'>"
			+"		최근 검색어가 없습니다."
			+"	</td>"
			+"</tr>"
	}else{
		for (let index = keywords.length - 1; index >= 0; index--) {
			const keyword = keywords[index];
		    tableHTML +=
		    	"<tr class=" + keyword + ">"
		    	+ "  <td class='keywordWidth'>"
		    	+   keyword
		    	+ "  </td>"
		    	+ "  <td class='localStarageDeleteOneTd'>"
		    	+ "    <a class='localStarageDeleteOne' onclick='localStarageDeleteOne(\"" + keyword + "\")'>x</a>"
		    	+ "  </td>"
		    	+ "</tr>";
		}
	}

	  tableHTML +=
		  '<tr>'
		  + '<td>'
		  + '  <a onclick="localStorageClean()" id="localStorageClean">최근검색어 삭제</a>'
		  + '</td>'
		  + '<td>'
		  + '  <a id="closeSearchBox">'
		  + '    닫기'
		  + '  </a>'
		  + '</td>'
		  + '</tr>' 

	  tableHTML += '</table>';
	  // HTML 영역에 테이블 추가
	  $("#Recent").html(tableHTML);
}

function localStarageDeleteOne(keyword) {
	// 로컬 스토리지에서 keywords 배열 가져오기
	const storedKeywords = JSON.parse(localStorage.getItem("keywords")) || [];
	// 일치하는 키워드 찾아서 삭제
	const updatedKeywords = storedKeywords.filter((storedKeyword) => storedKeyword !== keyword);
	// 수정된 keywords 배열 다시 로컬 스토리지에 저장
	localStorage.setItem("keywords", JSON.stringify(updatedKeywords));
	updateTable();
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
                           <a href="MyPage">내상점</a>
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
                            <button onclick="searchKeyword()">
                            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
								  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg>
                            </button>
                        </div>
                    </div>
                    <!-- navbar search Ends -->
                </div>
                <!-- End Main Menu Search -->
                <div id="Recent" >
                	<!-- 최근검색어 테이블이 표시될 영역 -->
                </div>
                <div id="Popular">
                	<table border="1">
                		<tr>
                			<td><a onclick="RecentSearchs()" class="recentWordColor">최근검색어</a></td>
                			<td><a onclick="PopularSearches()" class="popularWordColor">인기검색어</a></td>
                		</tr>
                		<tr>
                			<td colspan="2">1 군만두</td>
                		</tr>
                		<tr>
                			<td colspan="2">2 참치 올린 불닭</td>
                		</tr>
                		<tr>
                			<td colspan="2">3 고추짬뽕</td>
                		</tr>
                		<tr>
                			<td colspan="2">4 깐풍기</td>
                		</tr>
                		<tr>
                			<td colspan="2">5 깐쇼새우</td>
                		</tr>
                		<tr>
                			<td colspan="2">6 이재모피자</td>
                		</tr>
                		<tr>
                			<td colspan="2">7 국밥</td>
                		</tr>
                		<tr>
                			<td colspan="2">8 카라멜팝콘</td>
                		</tr>
                		<tr>
                			<td colspan="2">9 컨트리맨즈</td>
                		</tr>
                		<tr>
                			<td colspan="2">10 아웃백 스테이크 하우스</td>
                		</tr>
                		<tr>
                			<td colspan="2"><a id="closeSearchBox">닫기</a></td>
                		</tr>
                	</table>
                </div>
            </div>
            <div class="col-lg-4 col-md-2 col-5">
                <div class="middle-right-area">
                	<a href="ProductRegist">판매하기  </a>

                	<a href="./">관심  </a>
                	<a href="Chat">채팅톡</a>

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
                                    <li class="nav-item"><a href="CsMain">고객센터</a></li>


                                    <li class="nav-item"><a href="login.html">Login</a></li>
                                    <li class="nav-item"><a href="register.html">Register</a></li>
                                    <li class="nav-item"><a href="mail-success.html">Mail Success</a></li>
                                    <li class="nav-item"><a href="404.html">404 Error</a></li>
                                </ul>
                                
                            </li>
                            <li class="nav-item">
                                <a href="./">카테고리</a>
                                <ul class="sub-menu collapse" id="submenu-1-3">
                                    <li><a href="javascript:void(0)" >상의</a></li>
	                                <li><a href="javascript:void(0)" >하의</a></li>
	                                <li><a href="javascript:void(0)" >아우터</a></li>
	                                <li><a href="javascript:void(0)" >아동복</a></li>
	                                <li><a href="javascript:void(0)" >셋업/세트</a></li>
	                                <li><a href="javascript:void(0)" >패션/잡화</a></li>
	                                <li><a href="javascript:void(0)" >신발</a></li>
	                                <li><a href="javascript:void(0)" >기타</a></li>
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
