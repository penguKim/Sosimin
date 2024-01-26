<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Sosimin</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />

<meta charset="UTF-8">
<title>소시민 상품등록</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
    
    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
<style type="text/css">
	article {
		text-align: center;
	}
	li{
	list-style-type: none;
	}
	.tag {
    display: inline-block;
    margin-right: 5px;
    padding: 5px;
    background-color: #eaeaea;
    border-radius: 2px;
    flex-shrink: 0;
    border-radius: 1rem;
    background: rgb(246, 246, 246);
    height: 2rem;
    -webkit-box-align: center;
    align-items: center;
    padding: 0.25rem 0.375rem;
}
    
    #ulLine{
    	display: inline-block;
    	position: relative;
    }
    
    #divLine{
   		display: inline-block;
   		width: 120px;
    }
    
    #divImageLine{
   		display: inline-block;
   		width: 120px;
   		position: relative;
   		top:3em;
    }
/* 태그에 닫기 버튼 */
.close-button {
    background-position: center center;
    background-repeat: no-repeat;
    background-size: cover;
    width: 20px;
    height: 20px;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIiBmaWxsPSJub25lIj4KICAgIDxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIgogICAgICAgIGQ9Ik0xMy40OTkzIDEyLjIxMzVDMTMuODU0OSAxMi41NjkxIDEzLjg1NDkgMTMuMTQ0OCAxMy40OTkzIDEzLjQ5OTNDMTMuMzIxNSAxMy42NzcxIDEzLjA4OTIgMTMuNzY2IDEyLjg1NTkgMTMuNzY2QzEyLjYyMzYgMTMuNzY2IDEyLjM5MDMgMTMuNjc3MSAxMi4yMTM1IDEzLjQ5OTNMOS45OTg0OSAxMS4yODYzTDcuNzg1NDcgMTMuNDk5M0M3LjYwNzcgMTMuNjc3MSA3LjM3NTM5IDEzLjc2NiA3LjE0MjA2IDEzLjc2NkM2LjkwOTc1IDEzLjc2NiA2LjY3NjQzIDEzLjY3NzEgNi40OTg2NiAxMy40OTkzQzYuMTQ0MTMgMTMuMTQ0OCA2LjE0NDEzIDEyLjU2OTEgNi40OTg2NiAxMi4yMTM1TDguNzEyNjkgMTAuMDAwNUw2LjQ5ODY2IDcuNzg2NDhDNi4xNDQxMyA3LjQzMTk1IDYuMTQ0MTMgNi44NTUyMSA2LjQ5ODY2IDYuNTAwNjhDNi44NTQyIDYuMTQ1MTQgNy40Mjk5MyA2LjE0NTE0IDcuNzg1NDcgNi41MDA2OEw5Ljk5ODQ5IDguNzEzN0wxMi4yMTM1IDYuNTAwNjhDMTIuNTY4MSA2LjE0NTE0IDEzLjE0MzggNi4xNDUxNCAxMy40OTkzIDYuNTAwNjhDMTMuODU0OSA2Ljg1NTIxIDEzLjg1NDkgNy40MzE5NSAxMy40OTkzIDcuNzg2NDhMMTEuMjg1MyAxMC4wMDA1TDEzLjQ5OTMgMTIuMjEzNVpNOS45OTk0OSAwQzQuNDg1NjMgMCAwIDQuNDg2NjQgMCAxMC4wMDA1QzAgMTUuNTE0NCA0LjQ4NTYzIDIwIDkuOTk5NDkgMjBDMTUuNTEzNCAyMCAyMCAxNS41MTQ0IDIwIDEwLjAwMDVDMjAgNC40ODY2NCAxNS41MTM0IDAgOS45OTk0OSAwWiIKICAgICAgICBmaWxsPSIjQ0NDQ0NDIiAvPgo8L3N2Zz4=);
    margin-left: 0.5rem;
    vertical-align: middle;
    border: none;
	}
/* 0/40 텍스트 박스 위치 이동*/
#textLength{
	display: inline-block;
	position: relative;
	left : 1115px;
	bottom: 30px;
}
/* 업로드한 이미지 크기 조정 */
.imageSize {
	width: 180px;
	height: 201px;
	margin-left: 1em;
}	

/* form 전체 사이즈 줘서 사이즈 줄였을때 페이지 안뭉개지게 하기 */
.add-form{
	width: 1400px;
	max-width: 1400px;
}

/* .jyaWFk { */
/*    display: flex; */
/*    width: 856px; */
/*    flex-wrap: wrap; */
/*    overflow-x: hidden; */
/* } */
#imageTd {
	display: inline-block;
}

.form-group {
	display: inline-block;
}

 .mainImage { 
     position: absolute; 
     height: 1.5rem; 
     padding: 0px 0.5rem; 
     display: flex; 
     -webkit-box-align: center; 
     align-items: center; 
     top: 0.5rem; 
     left: 17px; 
     background: rgba(25, 25, 25, 0.3);
     color: rgb(255, 255, 255); 
     border-radius: 12px; 
     font-size: 12px; 
     vertical-align: middle;
     z-index: 1;
      }
      
.imageClose {
    width: 1.5rem;
    height: 1.5rem;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: 12px 12px;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIKICAgICAgICBkPSJNNi44NDggNmwzLjc3Ni0zLjc3NmEuNi42IDAgMSAwLS44NDgtLjg0OEw2IDUuMTUgMi4yMjQgMS4zNzZhLjYuNiAwIDAgMC0uODQ4Ljg0OEw1LjE1MiA2IDEuMzc2IDkuNzc1YS42LjYgMCAxIDAgLjg0OC44NDlMNiA2Ljg0OGwzLjc3NiAzLjc3NmEuNTk4LjU5OCAwIDAgMCAxLjAyNC0uNDI1LjYuNiAwIDAgMC0uMTc2LS40MjRMNi44NDggNnoiIC8+Cjwvc3ZnPg==);
    background-color: rgb(25, 25, 25);
    opacity: 0.3;
    border-radius: 50%;
    position: absolute;
    right: 8px;
    top: 3px;
/*     top: 0.5rem; */
}      

#tradeXText{
display:inline-block;
text-decoration : underline;
position: relative;
left: 78em;
bottom: 30px;
}

#image_container{
	position: relative;
}
  p span {
    color: red;
  }
  
  #required{
  	color:red;
  	font-size: 17px;
  	margin-left: 120px;
  	position: relative;
  	bottom: 29px;
  }
  
  p {
  	font-size: 20px;
  	color: black;
  }

/* 거래금지품목 위치 */
#tradeX{
	position:relative;
    right: 10em;
    font-size: 1rem;
    color: rgb(153, 153, 153);
    font-weight: 400;
    line-height: 125%;
    text-decoration: underline;
    
}

#productName{
	display: inline-block;
	position: relative;
}

.imageItem {
	display: inline-block;
	position: relative;
}

h1 {
	text-align: center;
}

#Category{
	color:red;
    position: relative;
    top: 10px;
}

#categoryName{
	border: 1px solid #ebebeb;
    border-radius: 10px;
    cursor: pointer;
    width: 500px;
    position: relative;
    top: 10px;
}

#myMapButton {
    height: 3rem;
    width: 6.5rem;
    text-align: center;
    font-size: 16px;
    font-weight: 400;
    line-height: 125%;
    color: rgb(25, 25, 25);
    border: 1px solid rgb(204, 204, 204);
    margin-right: 1rem;
    border-radius: 2px;
    background-color: white;
}

#divPadding{
	position: relative;
}

.categoryPadding{
	position: relative;
	bottom: 5px;
}
.myMapButtonPadding{
	padding-bottom: 10px;
}

#imageCount{
	position: relative;
	left: 40px;
	bottom: 20px;	
}

#product_name {
padding-top: 21px;
}

.tradeAddress{
	position: absolute;
	bottom:28px;
}
#categoryDiv{
	padding-bottom: 10px;
}
.productStatus, .price{
	position: relative;
	bottom:20px;
}

.explanation{
	position: relative;
	bottom:70px;
}
#radioChoise , #productStatus1,#productStatus2,#productStatus3 {
	cursor: pointer;
	font-size: 15px;
}

.thumbnail{
	cursor: pointer;
}

#priceInput{
 position: relative;
 width: 180px;
}

#explanationLength{
	display:inline-block;
	position: relative;
	bottom:4px;
	right:120px;
}
#explanationLine{
	display: inline-block;
	position: relative;
	padding-top: 30px;
}

#priceProposal , #Category{
	margin-top: 5px;
}

#tagLine{
	display:inline-block;
	position:relative; 
}

#tagLine2{
	display:inline-block;
	position:relative;
	top:20px;
}


.tagNameLine{
	position: relative;
	top: 30px;
}

#tagName{
	position: relative;
	top:10px;
	width: 300px;
}

#tagContainer{
	margin-left: 120px;
	position: relative;
	top:13px;
}

#tagCs{
	margin-left: 120px;
	position: relative;
}
#buttonBox{
	position:relative;
    height: 3.5rem;
    width: 10rem;
    color: rgb(255, 255, 255);
    font-size: 20px;
    font-weight: 700;
    border-radius: 2px;
    background: rgb(216, 12, 24);
    display: inline-block;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    margin-top: 15px;
    margin-bottom: 50px;
}

#save2{
	position:relative;
    height: 3.5rem;
    width: 10rem;
  	color:rgb(102, 102, 102);
    font-size: 20px;
    font-weight: 700;
    border-radius: 2px;
    background: white;
    display: inline-block;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    margin-top: 15px;
    margin-bottom: 50px;
    border: 1px solid rgb(229, 229, 229);
    margin-right: 10px;
}

#save{
	margin-left: 450px;
}

#background{ 
	background-color: #f9f9f9;
 } 

#addForm{ 
 	background-color: white; 
 	padding-left: 30px;
 	padding-right: 30px;
 	width:1360px;
 } 
 #priceText{
 	position: relative;
 	top: 20px;
 }
 .trade_methodDiv{
 	position: relative;
 	bottom:11px;
 }
</style>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script>
$(function() {
	navigator.geolocation.getCurrentPosition(function(position) {
		  var latitude = position.coords.latitude; // 현재 위치의 위도
		  var longitude = position.coords.longitude; // 현재 위치의 경도

		  var container = document.getElementById('map'); // 지도를 표시할 위치
		  var options = {
		    center: new kakao.maps.LatLng(latitude, longitude), // 지도 위치 설정(내위치)
		    level: 3 // 지도 확대 레벨(휠로 돌리기전 기본 레벨 설정)
		  };

		  map = new kakao.maps.Map(container, options); // 지도 생성 및 표시

		  var markerPosition = new kakao.maps.LatLng(latitude, longitude); // 마커의 위치 좌표 내위치기준으로 좌표줬음
		  marker = new kakao.maps.Marker({
		    position: markerPosition		// 마커 생성 시 위치 설정
		  });
		  marker.setMap(map); // 마커를 지도에 표시해준다.
		});
		
		// 내위치정보 클릭 시 해당 위치의 주소 가져오기(위도 / 경도를 도로명주소,지번주소로 변경)
		$("#myMapButton").on("click", function() {
		  var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체 생성(카카오api사용)
		  var markerPosition = marker.getPosition(); // 마커의 위치 좌표(위에서 찍힌 마커 위치 좌표를 가져옴)
		  var latitude = markerPosition.getLat(); // 마커의 위도(내가 가져온 현재 위치의 위도)
		  var longitude = markerPosition.getLng(); // 마커의 경도(내가 가져온 현재 위치의 경도)

		  geocoder.coord2Address(longitude, latitude, function(result, status) {
		   if (status === kakao.maps.services.Status.OK) { // 주소-좌표 변환 성공 시
			// 도로명 주소가 있을 경우 도로명 주소를, 없을 경우 지번 주소를 표시
	          var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	          detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	          
	          var address = result[0].address.address_name; // 지번 주소
	          
	          var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          
	          $("#myMap").val(modifiedAddress);
	          
	          
		    } else {
		      alert("주소를 가져오지 못했습니다.");
		    }
		  });
		});
		
	});

// XX 자릿수 이상을 입력 못하게 하기위한 코드

function productKey() {
	
	var productNameLength = $("#productName").val().length;
	
		$("#productNameLength").text(productNameLength) ;
		
};

function ProductDescriptionKey() {
	var ProductDescriptionLength = $("#ProductDescription").val().length;
	
		$("#ProductDescriptionLength").text(ProductDescriptionLength) ;
}

// XX자리 이상 입력후 한글자 더 입력 시 올라가는걸 막기위한 코드 
function limitInputLength(input, maxLength) {
    if (input.value.length > maxLength) {
      input.value = input.value.slice(0, maxLength);
    }
    document.getElementById("productNameLength").textContent = input.value.length;
  }
  
function limitInputLength2(input, maxLength) {
    if (input.value.length > maxLength) {
      input.value = input.value.slice(0, maxLength);
    }
    document.getElementById("ProductDescriptionLength").textContent = input.value.length;
  }


function addACategory() {
    var selectedCategory = $("#categoryName").val();
    var selectElement = document.getElementById("categoryName");
    
    // 카테고리 선택시 카테고리를 선택하세요 부분을 삭제해준다.
    var defaultOption = selectElement.querySelector("option[value='default']");
    if (defaultOption) {
      selectElement.removeChild(defaultOption);
    }
    
    document.getElementById("selectCategory").innerHTML = selectedCategory;
  }
  
  
function price(input) {
	  // 숫자 이외의 값을 입력 못하게한다.
// 	  input.value = input.value.replace(/[^0-9]/g, '');
	  
	  var value = input.value.replace(/[^0-9]/g, '');
	  
	  var formattedValue = Number(value).toLocaleString();
	  
	  input.value = formattedValue;
	}
	
	// 천 단위로 , 를 표시 
function addCommas(value) {
	  var parts = value.split(".");
	  parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  return parts.join(".");
	}
	
function handleKeyPress(e) {
	  if (e.keyCode === 13) { // 엔터키 키코드는 13번이라고 한다.
	    e.preventDefault(); // 엔터 키의 기본 동작인 줄 바꿈을 방지
	    handleTagRegistration(); // onclick 함수 호출
	  }
	}

	function handleTagRegistration() {
	  var tagName = document.getElementById("tagName").value;

	  if (tagName !== "") { // 입력폼에 널스트링이 아닐 시 
		// <span> 요소를 생성하고 생성한 <span> 요소 텍스트 내용을 #태그이름 으로 설정한다.
	    var tagElement = document.createElement("span");
	    tagElement.innerText = "#" + tagName;
	    tagElement.classList.add("tag"); // 생성한 <span> 요소에 "tag" 클래스를 추가
		// X 버튼 클릭 시 삭제 기능 추가한다.
	    var closeButton = document.createElement("button"); // 버튼 생성
	    closeButton.innerText = ""; // X 모양으로 표시했다.
	    closeButton.classList.add("close-button"); // 클래스 추가
	    tagElement.appendChild(closeButton); //  클릭시 삭제한다

	    var tagContainer = document.getElementById("tagContainer");
	    tagContainer.appendChild(tagElement);
		 // 최대 5개까지 태그를 허용하고, 5개 이상이면 입력 필드를 비활성화 시킴
	    if (tagContainer.querySelectorAll(".tag").length >= 4) {
	      document.getElementById("tagName").disabled = true;
	    }

	    document.getElementById("tagName").value = "";
	  }
	}

$(document).on("click", ".close-button", function() {
    $(this).closest(".tag").remove();
    $("#tagName").prop("disabled", false);
});

// 썸네일 이미지 작업을 위한 코드
function setThumbnail(event) {
  var fileVal = event.target.value;
  if (fileVal != "") {
    var ext = fileVal.split('.').pop().toLowerCase(); // 확장자 분리

    // 허용되는 확장자 리스트
    var allowedExtensions = ['jpg', 'jpeg', 'gif', 'png'];

    // 허용되지 않는 확장자일 경우 경고 메시지 출력 후 등록 취소
    if (!allowedExtensions.includes(ext)) {
      alert("jpg, gif, jpeg, png 파일만 업로드 할 수 있습니다.");
      event.target.value = ""; // 파일 입력 필드 초기화
      return false;
    }
  } else {
    return false;
  }

  var imageLength = parseInt(document.getElementById("imageLength").textContent); // 현재 카운트 가져오기
  imageLength++;
  document.getElementById("imageLength").textContent = imageLength;

  if (imageLength <= 5) {
    var reader = new FileReader();
    var imageContainer = document.getElementById("image_container");
    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("class", "imageSize");

      var imageText = document.querySelector(".mainImage");
      imageText.style.display = "inline";

      var closeButton = document.createElement("button");
      closeButton.setAttribute("type", "button");
      closeButton.setAttribute("class", "imageClose");
      closeButton.setAttribute("onclick", "removeImage(this)");

      var imageItem = document.createElement("span");
      imageItem.classList.add("imageItem");
      imageItem.appendChild(img);
      imageItem.appendChild(closeButton);

      imageContainer.appendChild(imageItem);
    };

    reader.readAsDataURL(event.target.files[0]);
  } else if (imageLength > 5) {
	  alert("사진 첨부는 최대 5장까지 가능합니다.");
	  imageLength = 5;
	  document.getElementById("imageLength").textContent = imageLength;
  } 
  
}


function removeImage(button) {
  var imageItem = button.parentNode;
  var imageContainer = imageItem.parentNode;
  imageContainer.removeChild(imageItem);
  
  var imageLength = parseInt(document.getElementById("imageLength").textContent); // 현재 카운트 가져오기
  imageLength--;
  document.getElementById("imageLength").textContent = imageLength;

  // 대표 이미지가 없는 경우 숨김 처리
  var imageText = document.querySelector(".mainImage");
  if (imageContainer.children.length === 1) {
    imageText.style.display = "none";
  }
}

function addFileInput() {
	  // 파일 선택 input 요소를 선택합니다.
	  var fileInput = document.getElementById('product_image');

	  // 파일 선택 input 요소를 클릭합니다.
	  fileInput.click();
	}



</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a75e8ce5f3bdcb17d52cf91eac1f473&libraries=services"></script>
<body>
	
	
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center" id="maxWidth">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title" style="text-align: left;">상품등록</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="index.html">Shop</a></li>
                        <li>Single Product</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<section class="item-details section" id="sectionWidth">
<div id="background">
	<div class="container content-wrapper">
		<div class="addBox">
			<form id="addForm" name="addForm" class="add-form" th:action="@{/admin/product/add}" method="post" enctype="multipart/form-data">
				<br><br>
				<h4>기본정보</h4><span id="required">*필수항목</span><br>
				<hr style="border:0; height:3px; color:black;">
				<div>
					<div id="divImageLine">
						<ul id="ulLine">
							<li class="th"><p>상품이미지<span>*</span></p></li>
							<li class="td" id="imageTd"></li>
						</ul>
						<span id="imageCount">
							<span id="imageLength">0</span>
							<span>/5</span>
						</span>
					</div>
					<img src="${pageContext.request.contextPath}/resources/images/이미지버튼.png" class="thumbnail" onclick="addFileInput()">
	
					<input class="form-control form-control-user" type="file" style="display: none;"
					  name="product_image" id="product_image" onchange="setThumbnail(event);" accept=".gif, .jpg, .png, .jepg" >
					
					<div class="form-group">
					  <div id="image_container">
					    <span class="mainImage" style="display: none; padding-top: 5px;">대표이미지</span>
					  </div>
					</div>
				</div>						
				<hr>
				<!-- 현재 등록돼 있는 카테고리 목록 호출, 사용자가 추가 가능 -->
				
				<div id="product_name">
					<div id="divLine">
						<ul>
							<li><p id="divPadding">상품명<span>*</span></p></li>
							<li class="td">
						</ul>
					</div>
						<input type="text" id="productName" onkeyup="productKey()" maxlength="40" oninput="limitInputLength(this, 40)"
						placeholder="상품명을 입력해 주세요." class="text-box">
						<a href="https://help.bunjang.co.kr/faq/2/220" target="_blank" id="tradeX">
						 <span id="tradeXText">거래금지 품목 보기</span></a>
						 <div id="textLength">
						 <span id="productNameLength">0</span><span>/40</span>
						 </div>
				</div>
				
				<hr>
				<div id="categoryDiv">
					<div id="divLine">
						<ul>
							<li class="th"><p id="divPadding" class="categoryPadding">카테고리<span>*</span></p></li>
						</ul>
					</div>
					<ul id="ulLine">
						<li class="td">
							<select id="categoryName" name="categoryName" class="dataTable-selector selector" onchange="addACategory();">
								<option value="default">카테고리를 선택하세요.</option>
								<option>패션잡화(모자/가방/지갑)</option>
								<option>아우터</option>
								<option>상의</option>
								<option>하의(치마)</option>
								<option>아동복</option>
								<option>셋업 세트(원피스)</option>
								<option>신발</option>
							</select>
							<div id="Category">
							선택한 카테고리 : 
							<b id="selectCategory"></b>
							</div>
						</li>
					</ul>
				</div>
				<hr>
				
				<div>
					<div id="divLine">
						<ul>
							<li class="td"><p id="divPadding" class="tradeAddress">거래지역<span>*</span></p></li>
						</ul>
					</div>
						<ul id="ulLine">
							<li class="td">
								<input type="hidden" id="map">
									<div id="divPadding" class="myMapButtonPadding"><input type="button" id="myMapButton" value="내 위치"></div>
								<input type="text" name="myMap" id="myMap" size="64" required disabled placeholder="지역을 설정해 주세요">
							</li>
						</ul>
				</div>
				
					<hr>
				<div>
					<div id="divLine" class="productStatus">
						<p>상품 상태<span>*</span></p>
					</div>
					<ul id="ulLine">
						<li class="productsStatusRadio">
							<label id="radioChoise">
								<input type="radio" id="productStatus1" name="productStatus"> 보통
							</label><br>
							<label id="radioChoise">
								<input type="radio" id="productStatus2" name="productStatus"> 좋은상태
							</label><br>
							<label id="radioChoise">
								<input type="radio" id="productStatus3" name="productStatus"> 새상품<br>
							</label>
						</li>
					</ul>
				</div>
				<hr>
				<div>
					<div id="divLine" class="trade_methodDiv">
						<p>거래방법<span>*</span></p>
					</div>
					<ul id="ulLine">
						<li class="trade_methodRadio">
							<label id="radioChoise">
								<input type="radio" id="trade_method" name="trade_method"> 대면거래
							</label><br>
							<label id="radioChoise">
								<input type="radio" id="trade_method" name="trade_method"> 소심거래
							</label><br>
						</li>
					</ul>
				</div>
				
				<hr>
				<div>
					<div id="divLine" class="price">
						<ul>
							<li id="priceText"><p>가격<span>*</span></p></li>
						</ul>
					</div>
						<ul id="ulLine">
							<li>
								<input type="text" id="priceInput" placeholder="가격을 입력해 주세요." oninput="price(this)" maxlength="11">원
								<div id="priceProposal">
								</div>
							</li>
						</ul>
				</div>
				
						<hr>
				<div id="explanationLine">
					<div id="divLine">
						<ul>
							<li class="explanation"><p>설명<span>*</span></p></li>
						</ul>
					</div>
					<div id="ulLine">
						<textarea rows="6" cols="100" style="resize: none;" id="ProductDescription" maxlength="2000" onkeyup="ProductDescriptionKey()" 
							oninput="limitInputLength2(this, 2000)" placeholder="구매시기,브랜드/모델명,제품의 상태(사용감,하자 유무) 등을 입력해 주세요"></textarea>
					</div>
					<div id="explanationLength">
						<span id="ProductDescriptionLength">0</span><span>/2000</span>
					</div>
				</div>
				<hr>
				<div>
					<div id="divLine" class="tagNameLine">
						<p>태그</p>
					</div>
					<div id="tagLine2">
						<input type="text" id="tagName" placeholder="태그를 입력해 주세요. (최대 4개 까지)" size="34" maxlength="9" onkeypress="handleKeyPress(event)">
						<input type="button" value="등록" onclick="handleTagRegistration()" id="tagName2"><br><br>
					</div>
						<div id="tagContainer"></div><br>
						<div id="tagCs">
						- 태그는 띄어쓰기로 구분되며 최대 9자까지 입력할 수 있어요.<br>
						- 내 상품을 다양한 태그로 표현해 보세요.<br>
						- 사람들이 내 상품을 더 잘 찾을 수 있어요.<br>
						- 상품과 관련 없는 태그를 입력할 경우, 판매에 제재를 받을 수 있어요.<br>
						</div>
				</div>
				<hr>
   				<div id="save">
					<button type="button" id="save2">임시저장</button>
					<input type="submit" id="buttonBox" value="상품등록">
				</div>
			</form>
		</div>
	</div>
</div>	
</section>
	<!-- JS -->
    <th:block layout:fragment="script">
    	<script th:src="@{/js/selector.js}" type="text/javascript"></script>
    	<script th:src="@{/js/product.js}" type="text/javascript"></script>
    	
    	<!-- CKEditor4 -->
	  	<script src="https://cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>
	  	<script type="text/javascript">
	  	$(function() {
			let ckeditor_config = {
					filebrowserUploadMethod : 'form',
					filebrowserUploadUrl : '/admin/product/add/contentImageUpload',
					language : 'ko'
			};
			CKEDITOR.replace('prodDetailContent', ckeditor_config);
	  	});
		</script>
		
	<footer class="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
	
    	<!-- Select2 -->
    	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	</th:block>
</body>
</html>
















