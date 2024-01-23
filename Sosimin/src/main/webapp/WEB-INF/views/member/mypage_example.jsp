<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소시민:: 소심한 시민들의 거래</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/main.css" />
</head>

<body>
	<!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

	<!-- Preloader -->
	<div class="preloader" style="opacity: 0; display: none;">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->

	<!-- Start Header Area -->
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- End Header Area -->

	<!-- í¤ë : header -->
	<div th:replace="~{common/header :: headerFragment}"></div>
	<!-- ë´ë¹ë° -->


	<div id="wrapper" style="min-height: 800px;">
		<div class="container" style="height: auto;">

			<h5>마이페이지</h5>
			<br>

			<!-- íë¡í -->
			<div id="content"
				style="width: 200px; padding-top: -100px; float: left; padding-left: 0px;">
				<div class="card">
					<img class="card-img-top" src="./images/mypage/profile.png"
						alt="Card image" style="width: 100%">
					<div class="card-body">
						<h4 class="card-title">
							<div>
								<span th:text="${session.login.getUserName()}"></span> ( <span
									th:text="${session.login.getUserId()}"></span> )
							</div>
						</h4>

						<div>
							<ul>
								<li>ê±°ë ì§ì­ : <span th:text="${session.login.getUserAddr()}"></span></li>
								<li>ì íë²í¸ : <span th:text="${session.login.getUserTel()}"></span></li>
								<li>ì´ë©ì¼ : <span th:text="${session.login.getUserEmail()}"></span></li>
							</ul>
						</div>

						<a th:href="@{mypage_updated.action}" class="btn btn-primary"
							style="background-color: black; width: 100%; font-size: 11px">
							ë´ ì ë³´ ìì íê¸°</a>
						<div th:if="${session.login.userId}==Master">
							<a th:href="@{qa_list.action}" class="btn btn-primary"
								style="background-color: black; width: 100%; font-size: 11px">
								1:1 ë¬¸ì íì¸íê¸°</a>
						</div>
					</div>
				</div>
			</div>
			<!-- íë¡í ë-->

			<div id="content" style="padding-left: 230px; height: 0px;">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#home" style="color: black;">íë§¤ë´ì­</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#menu2" style="color: black;">ì°íìí</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#menu3" style="color: black;">ëì ëê¸</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#menu4" style="color: black;">ëì ì»¤ë®¤ëí°</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div id="home" class="container tab-pane active">
						<br>

						<!-- íë§¤ -->



						<table class="table" style="width: 850px;">
							<thead class="bg-light">
								<tr>
									<th scope="col" style="width: 50px">íë²</th>
									<th scope="col" style="width: 150px">ì´ë¯¸ì§</th>
									<th scope="col" style="width: 150px">ì´ë¦</th>
									<th scope="col" style="width: 250px">ì ëª©</th>
									<th scope="col" style="width: 100px">ê°ê²©</th>
									<th scope="col" style="width: 150px">ë±ë¡ì¼</th>
								</tr>

							</thead>
							<tbody>
								<tr th:each="item : ${saleLists}">
									<td th:text=" '#'+ ${item.prodNo}" style="line-height: 100px"></td>
									<td
										th:with="baseUrl=(${item.prodNo}? 'sale_article.action' : ${item.prodNo})">
										<a th:href="@{${baseUrl}(prodNo=${item.prodNo})}"> <img
											th:src="@{/upload/} + ${item.tmImg}" width="100px"
											height="100px" alt="" />
									</a>
									</td>
									<td th:text="${item.prodName}" style="line-height: 100px"></td>
									<td th:text="${item.prodSubject}" style="line-height: 100px"></td>
									<td th:text="${item.prodPrice} + 'ì'"
										style="line-height: 100px"></td>
									<td th:text="${item.prodCreated}" style="line-height: 100px"></td>
								</tr>
							</tbody>
						</table>



					</div>

					<div id="menu2" class="container tab-pane fade">
						<br>


						<table class="table" style="width: 850px;">
							<thead class="bg-light">
								<tr>
									<th scope="col" style="width: 50px">íë²</th>
									<th scope="col" style="width: 150px">ì´ë¯¸ì§</th>
									<th scope="col" style="width: 150px">ì´ë¦</th>
									<th scope="col" style="width: 250px">ì ëª©</th>
									<th scope="col" style="width: 100px">ê°ê²©</th>
									<th scope="col" style="width: 150px">ë±ë¡ì¼</th>
								</tr>

							</thead>
							<tbody>
								<tr th:each="item : ${heartLists}">
									<td th:text=" '#'+ ${item.prodNo}" style="line-height: 100px"></td>
									<td
										th:with="baseUrl=(${item.prodNo}? 'sale_article.action' : ${item.prodNo})">
										<a th:href="@{${baseUrl}(prodNo=${item.prodNo})}"> <img
											th:src="@{/upload/} + ${item.tmImg}" width="100px"
											height="100px" alt="" />
									</a>
									</td>
									<td th:text="${item.prodName}" style="line-height: 100px"></td>
									<td th:text="${item.prodSubject}" style="line-height: 100px"></td>
									<td th:text="${item.prodPrice} + 'ì'"
										style="line-height: 100px"></td>
									<td th:text="${item.prodCreated}" style="line-height: 100px"></td>
								</tr>
							</tbody>
						</table>


					</div>
					<div id="menu3" class="container tab-pane fade">
						<br>


						<table class="table" style="width: 850px;">
							<thead class="bg-light">
								<tr style="">
									<th scope="col" rowspan="2"
										style="width: 50px; line-height: 20px;">ë¦¬ë·°<br /> ë²í¸
									</th>
									<th scope="col" style="width: 500px" colspan="2">ìí ì¢ë¥</th>
									<th scope="col"
										style="width: 150px; line-height: 50px; text-align: center;"
										rowspan="2">ìì±ì¼</th>
									<th scope="col"
										style="width: 100px; line-height: 50px; text-align: center;"
										rowspan="2">ìí íì´ì§</th>
								</tr>
								<tr style="height: 10px;">
									<th scope="col" style="width: 300px" colspan="2">ëì ëê¸</th>
								</tr>
							</thead>

							<tbody th:each="item : ${reviewLists}">
								<tr>
									<td rowspan="2" th:text=" '#'+ ${item.reviewNo}"
										style="line-height: 50px"></td>
									<td colspan="2"
										th:text="'#'+${item.prodNo} + ' ) ' +${item.prodName} + ' : ' + ${item.prodSubject}"></td>
									<td rowspan="2" th:text="${item.reviewCreated}"
										style="line-height: 50px; text-align: center;"></td>
									<td rowspan="2" style="line-height: 50px; text-align: center;"
										th:with="baseUrl=(${item.prodNo}? 'sale_article.action' : ${item.prodNo})">
										<a th:href="@{${baseUrl}(prodNo=${item.prodNo})}">More</a>
									</td>
								</tr>
								<tr>
									<td>ã´</td>
									<td th:text="${item.reviewContent}"></td>
								</tr>
							</tbody>
						</table>

					</div>

					<div id="menu4" class="container tab-pane fade">
						<br>

						<table class="table" style="width: 850px;">
							<thead class="bg-light">
								<tr>
									<th scope="col" style="width: 50px; line-height: 15px;">ì»¤ë®¤<br />
										ë²í¸
									</th>
									<th scope="col" style="width: 500px; line-height: 30px;">ì ëª©</th>
									<th scope="col" style="width: 150px; line-height: 30px;">ë±ë¡ì¼</th>
									<th scope="col"
										style="width: 100px; text-align: center; line-height: 30px;">ì»¤ë®¤ëí°</th>
								</tr>

							</thead>
							<tbody>
								<tr th:each="item : ${commuLists}">
									<td th:text=" '#'+ ${item.commuNo}" style="line-height: 50px"></td>
									<td th:text="${item.commuSubject}" style="line-height: 50px"></td>
									<td th:text="${item.commuCreated}" style="line-height: 50px"></td>
									<td style="line-height: 50px; text-align: center;"
										th:with="baseUrl=(${item.commuNo}? 'list.action' : ${item.commuNo})">
										<a th:href="@{${baseUrl}(commuNo=${item.commuNo})}">More</a>
									</td>
								</tr>
							</tbody>
						</table>


					</div>
				</div>
			</div>
			<!-- Tab panes -->

			<br /> <br />
		</div>

	</div>

	<!-- ë´ë¹ë° ë-->

	<br />
	<br />
	</div>

	
	<!-- í¸í° : footer -->
	<div th:replace="~{common/footer :: footer}"></div>

	<script src=" js/jquery.js"></script>
	<script src=" js/bootstrap.min.js"></script>
	<script src=" js/jquery.scrollUp.min.js"></script>
	<script src=" js/price-range.js"></script>
	<script src=" js/jquery.prettyPhoto.js"></script>
	<script src=" js/main.js"></script>

</body>

</html>