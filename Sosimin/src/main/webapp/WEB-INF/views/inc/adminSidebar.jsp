<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul class="sidebar-nav" id="sidebar-nav">

	<li class="nav-item">
		<a class="nav-link " href="AdminMain">
			<i class="bi bi-grid"></i>
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
		<a class="nav-link collapsed" href="ProductBoardList">
			<i class="bi bi-envelope"></i>
			<span>상품관리</span>
		</a>
	</li><!-- End Contact Page Nav -->


	<li class="nav-item">
		<a class="nav-link collapsed" href="OrderList">
			<i class="bi bi-person"></i>
			<span>거래관리</span>
		</a>
	</li><!-- End Profile Page Nav -->
  
	<li class="nav-item">
		<a class="nav-link collapsed" href="MemberAccount">
		<i class="bi bi-card-list"></i>
		<span>계좌관리</span>
		</a>
	</li><!-- End Register Page Nav -->

	<li class="nav-item">
		<a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-journal-text"></i><span>페이관리</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
		<ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
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
			<i class="bi bi-menu-button-wide"></i><span>신고관리</span><i class="bi bi-chevron-down ms-auto"></i>
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
			<i class="bi bi-gem"></i><span>고객센터관리</span><i class="bi bi-chevron-down ms-auto"></i>
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
			<i class="bi bi-layout-text-window-reverse"></i><span>커뮤니티관리</span><i class="bi bi-chevron-down ms-auto"></i>
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
