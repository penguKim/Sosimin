<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>

<script type="text/javascript">
//로그인시 웹소켓 연결
$(function() {
	var sId = "${sessionScope.sId}";
	if(sId != ""){
		connect();
	}else{
		ws.close();
	}
	
});
function connect() {
	// 사용자 세션 아이디 변수에 저장
	current_user_id = "${sessionScope.sId}";

	// 웹소켓 연결에 사용할 기본 주소 설정(ws 프로토콜 사용)
	// => 보안을 위해서는 ws 대신 wss 사용해야함
	let ws_base_url = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}";
	// => 주의! request 객체의 contextPath 값은 "/XXX" 형식으로 리턴되므로 문자열 결합 시 / 생략
	
	// 웹소켓 요청(Handshake)
	// => WebSocket 객체 생성(생성자 파라미터로 요청 주소 전달)
	ws = new WebSocket(ws_base_url + "/echo2");
	// => 이 요청을 서버에서 처리하기 위해 매핑을 수행해야하는데
	//    이 매핑은 컨트롤러가 아닌 xml 파일에서 설정 필요
	//    (=> ws-context.xml 파일 만들어서 설정)
	
	// WebSocket 객체의 onxxx 이벤트에 각각의 함수 연결
	// => 주의! onxxx 이벤트에 전달하는 함수는 반드시 함수명만 기술
	ws.onopen = onOpen;
	ws.onmessage = onMessage;
	ws.onclose = onClose;
	ws.onerror = onError;
	
}


	
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
	
		
		
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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
		$("#Popular").addClass("hidden");
		$("#Relation").addClass("hidden");
	}
	
	//엔터키 누를 경우 텍스트 가지고 주소 이동
	//(form태그 쓰면 css 다 부서짐 그래서 그냥 이렇게 함)
	$("#searchKeyword").keyup(function(event) {
	    if (event.keyCode === 13) {
	      searchKeyword();
	    }
  	});

	
	$(".recentWordColor").css("color","#39d274");
	$(".popularWordColor").css("color","black");
	
	
	$("#searchKeyword").keyup(function(){
		$.ajax({
			type:"GET",
			url:"RelationSearchKeyWord",
			data: {searchKeyWord : $("#searchKeyword").val()},
			success:function(res){
				$("#Popular").hide();
				$("#Recent").hide();
				$("#Relation").removeClass("hidden");
				let relationBox = 
					'<table id="Relation">'
		    		+'<tr id= "Relationdata">'
		    		+	'<td colspan="2">'
		    		+       '<img src="${pageContext.request.contextPath}/resources/images/MainPhoto/상점검색.png" width="18" height="14" alt="추천 상점 아이콘"> 상점검색 &gt;'
		    		+ 		'<a href="FindStore?searchKeyword="'+ $("#searchKeyword").val() +'>'
		    		+			$("#searchKeyword").val()
		    		+		'</a>'
		    		+ 		"  상점명으로 검색" 
		    		+	'</td>'
		    		+'</tr>'
		    		+'<tr>'
					+	'<td>'
					+	'	<a></a>'
					+	'</td>'
					+	'<td>'
					+	'	<a id="closeSearchBox">'
					+	'		닫기'
					+	'	</a>'
					+	'</td>'
					+'</tr>' 
		    		+'</table>'
				$("#Relation").html(relationBox)
				let relationKeyWord = ""
				for(let data of res){
					relationKeyWord += "<tr><td colspan='2'>" + data + "</td></tr>";
				}
		    		
				$("#Relationdata").after(relationKeyWord)
				
						
				
			},
			error:function(){
// 				alert("통신 실패.")
			}
		});
	});
	
	
	
	
});// document.ready function END
	
	function searchKeyword(pkeyword) {
		$("#Relation").removeClass("hidden");
		$("#Relation").show();
		let keyword = "";
		if(pkeyword == null){
			keyword = $("#searchKeyword").val();
		}else{
			keyword = pkeyword;
		}
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
		
			var searchKeywordUrl = "SearchProduct?keyword=" + encodeURIComponent(keyword);
			window.location.href = searchKeywordUrl;
		}else{
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '항목을 입력해주세요.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			})
		}
	}
	
	
	function sendKeyword(element) {
		var keyword = $(element).text(); // 클릭된 요소의 텍스트 값을 가져옵니다.
		var searchKeywordUrl = "SearchProduct?keyword=" + encodeURIComponent(keyword);
		window.location.href = searchKeywordUrl;
		searchKeyword(keyword);
	}
	
	function showHandler(){
		$("#Recent").show();
	}
	
	function RecentSearchs(){
		$("#Recent").show();
		$("#Popular").addClass("hidden");
		$(".recentWordColor").css("color","#39d274");
		$(".popularWordColor").css("color","black");
		
	}
	
	function PopularSearches(){
		$("#Recent").hide();
		$("#Popular").removeClass("hidden");
		$(".recentWordColor").css("color","black");
		$(".popularWordColor").css("color","#39d274");
	}
	
	function localStorageClean(){
		window.localStorage.removeItem('keywords');
		// 테이블 생성
		let tableHTML = '<table>';
		tableHTML += 
			'<tr>'
			+'	<td class="SelRecentborderBottom">'
			+'		<a onclick="RecentSearchs()" class="recentWordColor">최근검색어</a>'
			+'	</td>'
			+'	<td class="PopularborderBottom">'
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
			+ '  <td class="SelRecentborderBottom">'
		    + '    <a onclick="RecentSearchs()" class="recentWordColor">최근검색어</a>'
		    + '  </td>'
		    + '  <td class="PopularborderBottom">'
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
			    	+ "    <a onclick='sendKeyword(this)'>"+keyword+"</a>"
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
	
	
	/* 카테고리 선택시 이동 */
	$(function() {
		$("#submenu-1-3>li").on("click", function() {
			let length =  $("#submenu-1-3>li").length;
			let	category = $(this).text();
			
			location.href="SearchProduct?product_category=" + category;
		});
		
		
	});
	
	/* 로그아웃 링크 클릭 시 호출되는 함수 */
	function confirmLogout() {
		 let isLogout = confirm("로그아웃하시겠습니까?"); 
		 if(isLogout) {
			 location.href = "MemberLogout";
		 }
	}


</script>
<style>
.hidden{
	display: none;
}
</style>



<!-- Start Topbar -->
<div class="topbar">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 col-md-4 col-12">
<!--               기본으로 언어 선택이 있던 영역 -->
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
                    	<c:choose>
                    		<c:when test="${empty sessionScope.sId }">
		                        <li>
		                            <a href="MemberLogin">로그인</a>
		                        </li>
		                        <li>
		                            <a href="MemberJoin">회원가입</a>
		                        </li>
                    		</c:when>
                    		<c:otherwise>
                    			<c:if test="${sessionScope.sId eq 'admin' }">
		                           <a href="AdminMain">관리자페이지</a>
                    			</c:if>
		                        <li>
		                           <a href="MyPage">${sessionScope.sId }님의 마이페이지</a>
		                        </li>
		                        <li>
		                           <a href="PayInfo">소심페이</a>
		                        </li>
		                        <li>
		                           <a href="javascript:confirmLogout()">로그아웃</a>
		                        </li>
                    		</c:otherwise>
                    	</c:choose>
                    	<li>
                        	<!-- 나라별 언어 선택 -->
                            <div class="select-position">
                                <select id="select5">
                                    <option value="ko" selected>한국어</option>
                                    <option value="en" >영어</option>
                                    <option value="ja">일본어</option>
                                    <option value="ch">중국어</option>
                                </select>
                            </div>
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
                            <input type="text" id="searchKeyword" placeholder="상품명, 지역명, @상점명 입력" value="${param.keyword}">
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
                <div class="searchBoxBlock">
                <div id="Recent" >
                	<!-- 최근검색어 테이블이 표시될 영역 -->
                </div>
                <div id="Relation" >
                	<!-- 연관검색어 테이블이 표시될 영역 -->
                </div>
                <div id="Popular" class="hidden">
                	<table id="PopularTableBoarder">
                		<tr class="PopularCenter">
                			<td class="RecentborderBottom"><a onclick="RecentSearchs()" class="recentWordColor">최근검색어</a></td>
                			<td class="SelPopularborderBottom"><a onclick="PopularSearches()" class="popularWordColor">인기검색어</a></td>
                		</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">1</a> <a onclick="sendKeyword(this)">Zara</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">11</a> <a onclick="sendKeyword(this)">H&M</a></td>
						</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">2</a> <a onclick="sendKeyword(this)">Gucci</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">12</a> <a onclick="sendKeyword(this)">Nike</a></td>
						</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">3</a> <a onclick="sendKeyword(this)">Adidas</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">13</a> <a onclick="sendKeyword(this)">Louis Vuitton</a></td>
						</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">4</a> <a onclick="sendKeyword(this)">Chanel</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">14</a> <a onclick="sendKeyword(this)">Burberry</a></td>
						</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">5</a> <a onclick="sendKeyword(this)">Prada</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">15</a> <a onclick="sendKeyword(this)">Versace</a></td>
						</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">6</a> <a onclick="sendKeyword(this)">Tommy Hilfiger</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">16</a> <a onclick="sendKeyword(this)">Calvin Klein</a></td>
						</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">7</a> <a onclick="sendKeyword(this)">Ralph Lauren</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">17</a> <a onclick="sendKeyword(this)">Armani</a></td>
						</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">8</a> <a onclick="sendKeyword(this)">Givenchy</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">18</a> <a onclick="sendKeyword(this)">Fendi</a></td>
						</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">9</a> <a onclick="sendKeyword(this)">Balenciaga</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">19</a> <a onclick="sendKeyword(this)">Alexander McQueen</a></td>
						</tr>
						<tr>
						    <td><a class="popularWordColorTd marginLeftRank">10</a> <a onclick="sendKeyword(this)">Dior</a></td>
						    <td><a class="popularWordColorTd marginLeftRank">20</a> <a onclick="sendKeyword(this)">Prabal Gurung</a></td>
						</tr>

                		<tr class="PopularCenter">
                			<td><a id="closeSearchBox"></a></td>
                			<td><a id="closeSearchBox">닫기</a></td>
                		</tr>
                	</table>
                </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-2 col-5">
                <div class="middle-right-area">
                	<a href="ProductRegist">
	                	<img src="https://m.bunjang.co.kr/pc-static/resource/bcc7abb5d531bcf26033.png" width="23" height="26" alt="판매하기버튼 이미지">
	                	<span class="rightMenu">판매하기</span>  
                	</a>


                	<a href="MyPage">
	                	<img src="https://m.bunjang.co.kr/pc-static/resource/31370b164bc5b7cc4fef.png" width="23" height="24" alt="내상점버튼 이미지">
	                	<span class="rightMenu">관심</span>   
                	</a>
<%--                 	<a href="chat/main2?member_id=${sId }"> --%>
                	<a href="ChatMain2">
	                	<img src="https://m.bunjang.co.kr/pc-static/resource/32554a59cf002b3def10.png" width="23" height="24" alt="번개톡버튼 이미지">
	                	<span class="rightMenu">채팅톡</span>  
                	</a>


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
                                <a href="./" class="active" aria-label="Toggle navigation">홈</a>
                            </li>
                            <li class="nav-item">
                                <a href="SearchProduct">카테고리</a>
                                <ul class="sub-menu collapse" id="submenu-1-3">
                                    <li class="nav-item"><a href="javascript:void(0)" >상의</a></li>
	                                <li class="nav-item"><a href="javascript:void(0)" >하의</a></li>
	                                <li class="nav-item"><a href="javascript:void(0)" >아우터</a></li>
	                                <li class="nav-item"><a href="javascript:void(0)" >아동복</a></li>
	                                <li class="nav-item"><a href="javascript:void(0)" >셋업/세트</a></li>
	                                <li class="nav-item"><a href="javascript:void(0)" >패션/잡화</a></li>
	                                <li class="nav-item"><a href="javascript:void(0)" >신발</a></li>
	                                <li class="nav-item"><a href="javascript:void(0)" >기타</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
								<a href="Community">커뮤니티</a>
                                <ul class="sub-menu collapse" id="submenu-1-2">
                                    <li class="nav-item"><a href="Community?category=4">인기글</a></li>
                                    <li class="nav-item"><a href="Community?category=1">동네소식</a></li>
                                    <li class="nav-item"><a href="Community?category=2">동네질문</a></li>
                                    <li class="nav-item"><a href="Community?category=3">일상</a></li>
                                    <li class="nav-item"><a href="SosimLocker">소심함 위치 안내</a></li>
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























