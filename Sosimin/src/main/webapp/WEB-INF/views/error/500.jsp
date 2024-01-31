<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Sosimin</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">

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
  <div class="preloader">
    <div class="preloader-inner">
      <div class="preloader-icon">
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- /End Preloader -->

  <!-- Start Error Area -->
  <div class="error-area">
    <div class="d-table">
      <div class="d-table-cell">
        <div class="container">
          <div class="error-content">
            <h1>500</h1>
            <h2>Server Error</h2>
            <p>웹 사이트에서 페이지를 표시할 수 없습니다.</p>
            <div class="button">
              <a href="./" class="btn">소시민 홈페이지로 이동</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Error Area -->

  <!-- ========================= JS here ========================= -->
<script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
<script>
  window.onload = function () {
    window.setTimeout(fadeout, 500);
  }

  function fadeout() {
    document.querySelector('.preloader').style.opacity = '0';
    document.querySelector('.preloader').style.display = 'none';
  }
</script>
</body>
</html>