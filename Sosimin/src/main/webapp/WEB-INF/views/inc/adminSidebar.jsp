<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul class="sidebar-nav" id="sidebar-nav">

	<li class="nav-item">
		<a class="nav-link collapsed" href="AdminMain">
			<i class="bi bi-house"></i>
			<span>관리자메인</span>
		</a>
	</li><!-- End Dashboard Nav -->

	<li class="nav-item">
		<a class="nav-link collapsed" href="MemberList">
			<i class="bi bi-person"></i>
			<span>회원관리</span>
		</a>
	</li><!-- End Profile Page Nav -->

	<li class="nav-item">
		<a class="nav-link collapsed" href="ProductList">
			<i class="bi bi-archive"></i>
			<span>상품관리</span>
		</a>
	</li><!-- End Contact Page Nav -->


	<li class="nav-item">
		<a class="nav-link collapsed" href="OrderList">
			<i class="bi bi-cart2"></i>
			<span>거래관리</span>
		</a>
	</li><!-- End Profile Page Nav -->
  
	<li class="nav-item">
		<a class="nav-link collapsed" href="NowSearchList">
		<i class="bi bi-search"></i>
		<span>실시간 검색어 관리</span>
		</a>
	</li><!-- End Register Page Nav -->

	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-cash-coin"></i><span>페이관리</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="MemberPay">
					<i class="bi bi-circle"></i><span>페이정보관리</span>
				</a>
			</li>
			<li>
				<a href="SosiminAccount">
					<i class="bi bi-circle"></i><span>약정계좌관리</span>
				</a>
			</li>
			<li>
				<a href="ChargeRefund">
					<i class="bi bi-circle"></i><span>충전/환급관리</span>
				</a>
			</li>
			<li>
				<a href="SpentRevenue">
					<i class="bi bi-circle"></i><span>사용/수익관리</span>
				</a>
			</li>
		</ul>
	</li><!-- End Forms Nav -->

	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-x-circle"></i><span>신고관리</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="MemberReport">
					<i class="bi bi-circle"></i><span>회원신고관리</span>
				</a>
			</li>
			<li>
				<a href="BoardReport">
					<i class="bi bi-circle"></i><span>게시글신고관리</span>
				</a>
			</li>
		</ul>
	</li><!-- End Components Nav -->


	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-people"></i><span>고객센터관리</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="CsNoticeList">
					<i class="bi bi-circle"></i><span>공지사항관리</span>
				</a>
			</li>
			<li>
				<a href="CsFaqList">
					<i class="bi bi-circle"></i><span>자주묻는질문관리</span>
				</a>
			</li>
			<li>
				<a href="CsOneOnOneList">
					<i class="bi bi-circle"></i><span>1대1채팅관리</span>
				</a>
			</li>
		</ul>
	</li><!-- End Icons Nav -->


	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-chat-dots"></i><span>커뮤니티관리</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="CommunityList">
					<i class="bi bi-circle"></i><span>게시글관리</span>
				</a>
			</li>
			<li>
				<a href="CommunityReplyList">
					<i class="bi bi-circle"></i><span>댓글관리</span>
				</a>
			</li>
		</ul>
	</li><!-- End Tables Nav -->

</ul>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul class="sidebar-nav" id="sidebar-nav">

	<li class="nav-item">
		<a class="nav-link " href="AdminMain">
			<i class="bi bi-house"></i>
			<span>관리자메인</span>
		</a>
	</li><!-- End Dashboard Nav -->

	<li class="nav-item">
		<a class="nav-link collapsed" href="MemberList">
			<i class="bi bi-person"></i>
			<span>회원관리</span>
		</a>
	</li><!-- End Profile Page Nav -->

	<li class="nav-item">
		<a class="nav-link collapsed" href="ProductList">
			<i class="bi bi-archive"></i>
			<span>상품관리</span>
		</a>
	</li><!-- End Contact Page Nav -->


	<li class="nav-item">
		<a class="nav-link collapsed" href="OrderList">
			<i class="bi bi-cart2"></i>
			<span>거래관리</span>
		</a>
	</li><!-- End Profile Page Nav -->
  
	<li class="nav-item">
		<a class="nav-link collapsed" href="">
		<i class="bi bi-credit-card-2-back"></i>
		<span>소심함관리</span>
		</a>
	</li><!-- End Register Page Nav -->

	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-cash-coin"></i><span>페이관리</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="MemberPay">
					<i class="bi bi-circle"></i><span>페이정보관리</span>
				</a>
			</li>
			<li>
				<a href="SosiminAccount">
					<i class="bi bi-circle"></i><span>약정계좌관리</span>
				</a>
			</li>
			<li>
				<a href="ChargeRefund">
					<i class="bi bi-circle"></i><span>충전/환급관리</span>
				</a>
			</li>
			<li>
				<a href="SpentRevenue">
					<i class="bi bi-circle"></i><span>사용/수익관리</span>
				</a>
			</li>
		</ul>
	</li><!-- End Forms Nav -->

	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-x-circle"></i><span>신고관리</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="ReportMember">
					<i class="bi bi-circle"></i><span>회원신고관리</span>
				</a>
			</li>
			<li>
				<a href="ReportProduct">
					<i class="bi bi-circle"></i><span>상품신고관리</span>
				</a>
			</li>
			<li>
				<a href="ReportCommunity">
					<i class="bi bi-circle"></i><span>커뮤니티신고관리</span>
				</a>
			</li>
			<li>
				<a href="ReportReply">
					<i class="bi bi-circle"></i><span>댓글신고관리</span>
				</a>
			</li>
		</ul>
	</li><!-- End Components Nav -->


	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-people"></i><span>고객센터관리</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="CsNoticeList">
					<i class="bi bi-circle"></i><span>공지사항관리</span>
				</a>
			</li>
			<li>
				<a href="CsFaqList">
					<i class="bi bi-circle"></i><span>자주묻는질문관리</span>
				</a>
			</li>
			<li>
				<a href="CsOneOnOneList">
					<i class="bi bi-circle"></i><span>1대1채팅관리</span>
				</a>
			</li>
		</ul>
	</li><!-- End Icons Nav -->


	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-chat-dots"></i><span>커뮤니티관리</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
			<li>
				<a href="CommunityList">
					<i class="bi bi-circle"></i><span>게시글관리</span>
				</a>
			</li>
			<li>
				<a href="CommunityReplyList">
					<i class="bi bi-circle"></i><span>댓글관리</span>
				</a>
			</li>
		</ul>
	</li><!-- End Tables Nav -->

</ul>
>>>>>>> stash
