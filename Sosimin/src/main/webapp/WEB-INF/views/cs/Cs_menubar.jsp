<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- --------- 사이드메뉴창 ---------- -->
<div class="sidenav">
	<div id="admin"><a href="Mypage">마이페이지</a></div>
	<button class="dropdown-btn">구매내역
		<i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="MypageReservboardList">예매내역</a>
		<a href="MypageProductboardList">상품구매내역</a>
	</div>
	<button class="dropdown-btn">나의게시글 
		<i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="MypageOneOnOneList">1대1문의</a>
		<a href="MypageLostBoardList">분실물문의</a>
		<a href="MypageReviewList">나의리뷰</a>
	</div>
	<button class="dropdown-btn">회원정보 
		<i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="SideEditmember">회원정보수정</a>
	</div>
</div>
<!-- --------- 사이드메뉴 끝 ---------- -->


<script>
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  var dropdownContent = dropdown[i].nextElementSibling;
  dropdownContent.style.display = "block";
}
</script>