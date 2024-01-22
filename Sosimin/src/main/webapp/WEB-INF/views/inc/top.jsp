<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Start Topbar -->
<div class="topbar">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 col-md-4 col-12">
                <div class="top-left">
                    <ul class="menu-top-link">
<!--                         <li> -->
<!--                         	나라별 화폐 선택 -->
<!--                             <div class="select-position"> -->
<!--                                 <select id="select4"> -->
<!-- <!--                                     <option value="0" selected>$ USD</option> --> 
<!--                                     <option value="1">€ EURO</option> -->
<!--                                     <option value="2">$ CAD</option> -->
<!--                                     <option value="3">₹ INR</option> -->
<!--                                     <option value="4">¥ CNY</option> -->
<!--                                     <option value="5">৳ BDT</option> -->
<!--                                 </select> -->
<!--                             </div> -->
<!--                         </li> -->
                        <li>
                        	<!-- 나라별 언어 선택 -->
                            <div class="select-position">
                                <select id="select5">
                                    <option value="0" selected>English</option>
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
                        <li><a href="./">Home</a></li>
                        <li><a href="about-us.html">About Us</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
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
                            <a href="login.html">로그인</a>
                        </li>
                        <li>
                            <a href="register.html">회원가입</a>
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
            <div class="col-lg-5 col-md-7 d-xs-none">
                <!-- Start Main Menu Search -->
                <div class="main-menu-search">
                    <!-- navbar search start -->
                    <div class="navbar-search search-style-5">
                        <div class="search-select">
                            <div class="select-position">
                                <select id="select1">
                                    <option selected>All</option>
                                    <option value="1">option 01</option>
                                    <option value="2">option 02</option>
                                    <option value="3">option 03</option>
                                    <option value="4">option 04</option>
                                    <option value="5">option 05</option>
                                </select>
                            </div>
                        </div>
                        <div class="search-input">
                            <input type="text" id="searchKeyword" placeholder="Search" >
                        </div>
                        <!-- input 타입으로 바꾸면 css 달라짐 -->
                        <div class="search-btn">
                            <button onclick="location.href='searchProduct'"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                    </div>
                    <!-- navbar search Ends -->
                </div>
                <!-- End Main Menu Search -->
            </div>
            <div class="col-lg-4 col-md-2 col-5">
                <div class="middle-right-area">
                	<a href="ProductRegist">판매하기  </a>
                	<a href="./">관심  </a>
                	<a href="./">채팅톡</a>
<!--                     <div class="nav-hotline"> -->
<!--                         <i class="lni lni-phone"></i> -->
<!--                         <h3>Hotline: -->
<!--                             <span>(+100) 123 456 7890</span> -->
<!--                         </h3> -->
<!--                     </div> -->
<!--                     <div class="navbar-cart"> -->
<!--                         <div class="wishlist"> -->
<!--                             <a href="javascript:void(0)"> -->
<!--                                 <i class="lni lni-heart"></i> -->
<!--                                 <span class="total-items">0</span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="cart-items"> -->
<!--                             <a href="javascript:void(0)" class="main-btn"> -->
<!--                                 <i class="lni lni-cart"></i> -->
<!--                                 <span class="total-items">2</span> -->
<!--                             </a> -->
<!--                             Shopping Item -->
<!--                             <div class="shopping-item"> -->
<!--                                 <div class="dropdown-cart-header"> -->
<!--                                     <span>2 Items</span> -->
<!--                                     <a href="cart.html">View Cart</a> -->
<!--                                 </div> -->
<!--                                 <ul class="shopping-list"> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0)" class="remove" title="Remove this item"><i -->
<!--                                                 class="lni lni-close"></i></a> -->
<!--                                         <div class="cart-img-head"> -->
<!--                                             <a class="cart-img" href="product-details.html"><img -->
<%--                                                     src="${pageContext.request.contextPath}/resources/images/header/cart-items/item1.jpg" alt="#"></a> --%>
<!--                                         </div> -->

<!--                                         <div class="content"> -->
<!--                                             <h4><a href="product-details.html"> -->
<!--                                                     Apple Watch Series 6</a></h4> -->
<!--                                             <p class="quantity">1x - <span class="amount">$99.00</span></p> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0)" class="remove" title="Remove this item"><i -->
<!--                                                 class="lni lni-close"></i></a> -->
<!--                                         <div class="cart-img-head"> -->
<!--                                             <a class="cart-img" href="product-details.html"><img -->
<%--                                                     src="${pageContext.request.contextPath}/resources/images/header/cart-items/item2.jpg" alt="#"></a> --%>
<!--                                         </div> -->
<!--                                         <div class="content"> -->
<!--                                             <h4><a href="product-details.html">Wi-Fi Smart Camera</a></h4> -->
<!--                                             <p class="quantity">1x - <span class="amount">$35.00</span></p> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                                 <div class="bottom"> -->
<!--                                     <div class="total"> -->
<!--                                         <span>Total</span> -->
<!--                                         <span class="total-amount">$134.00</span> -->
<!--                                     </div> -->
<!--                                     <div class="button"> -->
<!--                                         <a href="checkout.html" class="btn animate">Checkout</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             / End Shopping Item -->
<!--                         </div> -->
<!--                     </div> -->

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
                <!-- Start Mega Category Menu -->
<!--                 <div class="mega-category-menu"> -->
<!--                     <span class="cat-button"><i class="lni lni-menu"></i>카테고리</span> -->
<!--                     <ul class="sub-category"> -->
<!--                         <li><a href="product-grids.html">상의 <i class="lni lni-chevron-right"></i></a> -->
<!--                             <ul class="inner-sub-category"> -->
<!--                             	하위 카테고리 -->
<!--                                 <li><a href="product-grids.html">상의</a></li> -->
<!--                                 <li><a href="product-grids.html">하의</a></li> -->
<!--                                 <li><a href="product-grids.html">아우터</a></li> -->
<!--                                 <li><a href="product-grids.html">아동복</a></li> -->
<!--                                 <li><a href="product-grids.html">셋업/세트</a></li> -->
<!--                                 <li><a href="product-grids.html">패션/잡화</a></li> -->
<!--                                 <li><a href="product-grids.html">신발</a></li> -->
<!--                                 <li><a href="product-grids.html">기타</a></li> -->
<!--                             </ul> -->
<!--                         </li> -->
<!--                         <li><a href="product-grids.html">하의</a></li> -->
<!--                         <li><a href="product-grids.html">아우터</a></li> -->
<!--                         <li><a href="product-grids.html">아동복</a></li> -->
<!--                         <li><a href="product-grids.html">셋업/세트</a></li> -->
<!--                         <li><a href="product-grids.html">패션/잡화</a></li> -->
<!--                         <li><a href="product-grids.html">신발</a></li> -->
<!--                         <li><a href="product-grids.html">기타</a></li> -->
<!--                     </ul> -->
<!--                 </div> -->
                <!-- End Mega Category Menu -->
                <!-- Start Navbar -->
                <nav class="navbar navbar-expand-lg">
<!--                     <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse" -->
<!--                         data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" -->
<!--                         aria-expanded="false" aria-label="Toggle navigation"> -->
<!--                         <span class="toggler-icon"></span> -->
<!--                         <span class="toggler-icon"></span> -->
<!--                         <span class="toggler-icon"></span> -->
<!--                     </button> -->
                    <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                        <ul id="nav" class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <a href="index.html" class="active" aria-label="Toggle navigation">Home</a>
                            </li>
                            <li class="nav-item">
<!--                                 <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" -->
<!--                                     data-bs-target="#submenu-1-2" aria-controls="navbarSupportedContent" -->
<!--                                     aria-expanded="false" aria-label="Toggle navigation">커뮤니티</a> -->
								<a href="./">커뮤니티</a>
                                <ul class="sub-menu collapse" id="submenu-1-2">
                                    <li class="nav-item"><a href="about-us.html">About Us</a></li>
                                    <li class="nav-item"><a href="faq.html">Faq</a></li>
                                    <li class="nav-item"><a href="login.html">Login</a></li>
                                    <li class="nav-item"><a href="register.html">Register</a></li>
                                    <li class="nav-item"><a href="mail-success.html">Mail Success</a></li>
                                    <li class="nav-item"><a href="404.html">404 Error</a></li>
                                </ul>
                                
                            </li>
                            <li class="nav-item">
<!--                                 <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" -->
<!--                                     data-bs-target="#submenu-1-3" aria-controls="navbarSupportedContent" -->
<!--                                     aria-expanded="false" aria-label="Toggle navigation">카테고리</a> -->
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
<!--                             <li class="nav-item"> -->
<!--                                 <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" -->
<!--                                     data-bs-target="#submenu-1-4" aria-controls="navbarSupportedContent" -->
<!--                                     aria-expanded="false" aria-label="Toggle navigation">Blog</a> -->
<!--                                 <ul class="sub-menu collapse" id="submenu-1-4"> -->
<!--                                     <li class="nav-item"><a href="blog-grid-sidebar.html">Blog Grid Sidebar</a> -->
<!--                                     </li> -->
<!--                                     <li class="nav-item"><a href="blog-single.html">Blog Single</a></li> -->
<!--                                     <li class="nav-item"><a href="blog-single-sidebar.html">Blog Single -->
<!--                                             Sibebar</a></li> -->
<!--                                 </ul> -->
<!--                             </li> -->
<!--                             <li class="nav-item"> -->
<!--                                 <a href="contact.html" aria-label="Toggle navigation">Contact Us</a> -->
<!--                             </li> -->
                        </ul>
                    </div> <!-- navbar collapse -->
                </nav>
                <!-- End Navbar -->
            </div>
        </div>
<!--         <div class="col-lg-4 col-md-6 col-12"> -->
<!--             Start Nav Social -->
<!--             <div class="nav-social"> -->
<!--                 <h5 class="title">Follow Us:</h5> -->
<!--                 <ul> -->
<!--                     <li> -->
<!--                         <a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="javascript:void(0)"><i class="lni lni-instagram"></i></a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="javascript:void(0)"><i class="lni lni-skype"></i></a> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--             End Nav Social -->
<!--         </div> -->
    </div>
</div>
<!-- End Header Bottom -->
