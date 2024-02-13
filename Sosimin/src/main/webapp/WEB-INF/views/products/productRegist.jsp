<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Sosimin</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />

<meta charset="UTF-8">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
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
    display: inline-block;
}

#divPadding{
	position: relative;
	display: inline-block;
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
#priceProposal{
	display: inline-block;
	margin-left: 10px;
	color:red;
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
    color: white;
    font-size: 20px;
    font-weight: 700;
    border-radius: 2px;
    background: #39d274;
    display: inline-block;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    margin-top: 15px;
    margin-bottom: 50px;
    border:none;
}

#temporarySaveButton{
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
  #sosimPay{ 
 	display: inline-block; 
 	position: relative; 
 	left:119px; 
  } 
/*  #sosimPay{ */
/*  	display: inline-block; */
/*  	position: relative; */
/*  	bottom:12px; */
/*  } */
#paySelect{
	position:relative;
	top:2px; 
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
	          
	          
// 	          var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          
	          if (address.split(' ')[0] == "부산") {
	              var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	            } else {
	              alert("부산광역시에서만 가능합니다.");
	              return;
	            }
	          
	          if(address.split(' ')[0] == "부산" || address.split(' ')[0] == "대구" || address.split(' ')[0] == "인천" || address.split(' ')[0] == "광주" || address.split(' ')[0] == "대전" || address.split(' ')[0] == "울산"  ) {
	        	  var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          } else if(address.split(' ')[0] == "서울" ) {
	        	  var modifiedAddress = address.split(' ')[0] + "특별시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          } else {
	        	  var modifiedAddress = address.split(' ')[0]  + " " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          }
		      
	          
	          $("#myMap").val(modifiedAddress);
	          localStorage.setItem(sId + "_tradePlace", modifiedAddress);
	          
		    } else {
		      alert("주소를 가져오지 못했습니다.");
		    }
		  });
		});
	
		
		var sId = "${sId}";
		
		function askForTemporarySave() {
			
			
			Swal.fire({
			    title: '임시저장 하시겠습니까??',
			    icon: 'question',
			    showCancelButton: true,
			    confirmButtonColor: '#39d274',
			    cancelButtonColor: '#d33',
			    confirmButtonText: '저장',
			    cancelButtonText: '취소',
			    reverseButtons: true,
			    allowOutsideClick: false
			}).then((result) => {
			    if (result.isConfirmed) {
			        // '저장'를 선택하면, 입력한 값을 로컬 스토리지에 저장합니다.
			        localStorage.setItem(sId + "_productName", $("#productName").val());
			        var categoryName = $("#categoryName").val();
			        if (categoryName !== 'default') {
			            localStorage.setItem(sId + "_categoryName", categoryName);
			        }
			        localStorage.setItem(sId + "_tradePlace", $("#myMap").val());
			        localStorage.setItem(sId + "_productStatus", $("input[name=product_status]:checked").val());
			        localStorage.setItem(sId + "_trade_method", $("input[name=trade_method]:checked").val());
			        localStorage.setItem(sId + "_product_price", $("#priceInput").val());
			        localStorage.setItem(sId + "_ProductDescription", $("#ProductDescription").val());
			        saveTagsToLocalStorage();
			        localStorage.setItem(sId + "_isTempSaved", "1");

			        // 비즈니스 로직 실행 후 성공 메시지를 표시
			        Swal.fire({
			            icon: 'success',
			            title: '임시저장 되었습니다.',
			            allowOutsideClick: false
			        });
			    }
			});
		}
			  // 페이지가 로드될 때마다 '최근 작성한 글을 불러오시겠습니까?'라는 메시지를 표시합니다.
			// 임시저장 버튼이 클릭되었을 때 askForTemporarySave 함수를 호출합니다.
		
// 	$(document).ready(() => {
function loadImage() {
  var imageCount = 0;
  
  for(let i = 1; i <= 5; i++) {
    var base64Image = localStorage.getItem("image" + i);
    if(base64Image) {
      var img = document.createElement("img");
      img.setAttribute("src", base64Image);
      img.setAttribute("class", "imageSize");

      var closeButton = document.createElement("button");
      closeButton.setAttribute("type", "button");
      closeButton.setAttribute("class", "imageClose");
      closeButton.setAttribute("onclick", "removeImage(this)");
      
      var imageItem = document.createElement("span");
      imageItem.classList.add("imageItem");

      imageItem.appendChild(img);
      imageItem.appendChild(closeButton);

      if(i == 1) {
        var mainImageText = document.createElement("span");
        mainImageText.classList.add("mainImage");
        mainImageText.textContent = "대표이미지";
        imageItem.appendChild(mainImageText);
      }

      document.getElementById("image_container").appendChild(imageItem);

      imageCount++;
    }
  }
  document.getElementById("imageLength").textContent = imageCount.toString();
  localStorage.setItem("imageCount", imageCount.toString());
}


			
$(document).ready(() => {
	  function showConfirmMessage() {
	    if (localStorage.getItem(sId + "_isTempSaved") === "1") {
	      Swal.fire({
	        title: '작성한 글을 불러오시겠습니까?',
// 	        text: '최근 작성한 글을 불러오시겠습니까?',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '예',
	        cancelButtonText: '아니오',
	        reverseButtons: true,
	        allowOutsideClick: false
	      }).then((result) => {
	        if (result.isConfirmed) {
	          loadImage();
	          $("#productName").val(localStorage.getItem(sId + "_productName"));
	          var categoryName = localStorage.getItem(sId + "_categoryName");
	          if (categoryName) {
	            $("#categoryName").val(categoryName);
	            $('#selectCategory').text(categoryName); 

	            var selectElement = document.getElementById("categoryName");
	            var defaultOption = selectElement.querySelector("option[value='default']");
	            if (defaultOption) {
	              selectElement.removeChild(defaultOption);
	            }
	          }
	          $("#myMap").val(localStorage.getItem(sId + "_tradePlace"));
	          $("#priceInput").val(localStorage.getItem(sId + "_product_price"));
	          $("#ProductDescription").val(localStorage.getItem(sId + "_ProductDescription"));
	          $("input[name=product_status][value=" + localStorage.getItem(sId + "_productStatus") + "]").prop('checked', true);
	          $("input[name=trade_method][value=" + localStorage.getItem(sId + "_trade_method") + "]").prop('checked', true);
	          loadTagsFromLocalStorage();
	        } else {
	          localStorage.removeItem(sId + "_isTempSaved"); 
	          localStorage.clear();
	          var imageContainer = document.getElementById("image_container");
	          while (imageContainer.firstChild) {
	            imageContainer.removeChild(imageContainer.firstChild);
	          }
	          document.getElementById("imageLength").textContent = "0";
	          localStorage.setItem(sId + "_imageCount", "0");
	          
	          var mainImageText = document.querySelector(".mainImage");
	          mainImageText.style.display = "none";
	        }
	      });
	    }
	  }

	  $('#temporarySaveButton').click(askForTemporarySave);
	  showConfirmMessage();

	  $("#productName").keyup(() => {
	    localStorage.setItem(sId + "productName", $("#productName").val());
	  });

	  $("#categoryName").change(() => {
	    var categoryName = $("#categoryName").val();
	    localStorage.setItem(sId + "categoryName", categoryName);
	    $('#selectCategory').text(categoryName); 

	    var selectElement = document.getElementById("categoryName");
	    var defaultOption = selectElement.querySelector("option[value='default']");
	    if (defaultOption) {
	      selectElement.removeChild(defaultOption);
	    }
	  });

	  $("#myMap").change(() => {
	    localStorage.setItem(sId + "_tradePlace", $("#myMap").val());
	  });

	  $("input[name=product_status]").change(() => {
	    localStorage.setItem(sId + "_productStatus", $("input[name=product_status]:checked").val());
	  });

	  $("input[name=trade_method]").change(() => {
	    localStorage.setItem(sId + "_trade_method", $("input[name=trade_method]:checked").val());
	  });

	  $("#priceInput").change(() => {
	    localStorage.setItem(sId + "_product_price", $("#priceInput").val());
	  });

	  $("#ProductDescription").change(() => {
	    localStorage.setItem(sId + "_ProductDescription", $("#ProductDescription").val());
	  });

	  $("#tagName").keypress(function(e) {
	    if (e.which == 13) {
	      $("#tagName2").click();
	      e.preventDefault();
	    }
	  });

	  $("#tagName2").click(() => {
	    var tagName = $("#tagName").val();
	    if (tagName) {
	      addTag(tagName);
	      $("#tagName").val("");
	      saveTagsToLocalStorage();
	    }
	  });

	  $(document).on("click", ".close-button", function() {
	    $(this).closest(".tag").remove();
	    $("#tagName").prop("disabled", false);
	    saveTagsToLocalStorage();
	  });
	});

function saveTagsToLocalStorage() {
	  var tags = [];
	  $("#tagContainer .tag").each(function() {
	    tags.push($(this).text().substring(1)); // '#' 제거
	  });
	  localStorage.setItem(sId + "_tag_names", JSON.stringify(tags));
	}

	function loadTagsFromLocalStorage() {
	  var tags = JSON.parse(localStorage.getItem(sId + "_tag_names"));
	  if (tags) {
	    var tagContainer = document.getElementById("tagContainer");
	    while (tagContainer.firstChild) {
	      tagContainer.removeChild(tagContainer.firstChild);
	    }
	    for (var i = 0; i < tags.length; i++) {
	      addTag(tags[i], i + 1);
	    }
	  }
	}

	function addTag(tagName, tagNumber) {
	  var tagElement = document.createElement("span");
	  tagElement.innerText = "#" + tagName;
	  tagElement.classList.add("tag");

	  var tagNameInput = document.createElement("input");
	  tagNameInput.type = "hidden";
	  tagNameInput.name = "tag_name" + (tagNumber || document.querySelectorAll(".tag").length + 1); // 컨트롤러로 전달할 name 속성 (tagNumber 또는 현재 태그 갯수 + 1)
	  tagNameInput.value = tagName; // 컨트롤러로 전달할 값 설정
	  tagElement.appendChild(tagNameInput);

	  var closeButton = document.createElement("button");
	  closeButton.innerText = "";
	  closeButton.classList.add("close-button");
	  tagElement.appendChild(closeButton);

	  var tagContainer = document.getElementById("tagContainer");
	  tagContainer.appendChild(tagElement);

	  if (tagContainer.querySelectorAll(".tag").length >= 4) {
	    document.getElementById("tagName").disabled = true;
	  }
	}
		
//이미지 파일 선택 시 실행되는 함수
function handleImageUpload(event) {
  var files = event.target.files;

  for(let i = 0; i < files.length; i++){
    // FileReader 객체 생성
    var reader = new FileReader();
    
    // FileReader 로드 완료 후 실행되는 함수
    reader.onload = function(event) {
      var imageData = event.target.result;

      // 이미지 데이터를 로컬 스토리지에 저장
      for(let i = 1; i <= 5; i++){
          if(!localStorage.getItem("image" + i)){
              localStorage.setItem("image" + i, imageData);
              break;
          }
      }
    };
  
    // 이미지 파일을 읽기
    reader.readAsDataURL(files[i]);
  }
}
// 	    window.onload = () => {
// 	        if (localStorage.getItem("productName")) {
// 	          if (confirm("최근 작성한 글을 불러오시겠습니까?")) {
// 	            console.log(localStorage.getItem("productName"));

// 	            document.querySelector(".area").innerText =
// 	              localStorage.getItem("productName");
// 	          } else {
// 	            localStorage.removeItem("productName");
// 	          }
// 	        }
// 	      };
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
	  
var priceInput = $("#priceInput");

	
priceInput.on("blur", function() {
    var inputValue = $(this).val();
    
    if(inputValue < 1000) {
        $("#priceProposal").html('최소 판매금액은 1,000원 입니다.');
    } else {
        $("#priceProposal").empty();
    }
});	
	  var value = input.value.replace(/[^0-9]/g, '');
	  
		if (value.length > 9) {
		    value = value.substring(0, 9);
		}
	  
	  
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

var tagCounter = 1; // 태그의 순차적인 카운터 변수

function handleTagRegistration() {
  var tagName = document.getElementById("tagName").value;

  if (tagName !== "") {
    var tagElement = document.createElement("span");
    tagElement.innerText = "#" + tagName;
    tagElement.classList.add("tag");
    var tagNameInput = document.createElement("input");
    tagNameInput.type = "hidden";
    tagNameInput.name = "tag_name" + (document.querySelectorAll(".tag").length + 1); // 컨트롤러로 전달할 name 속성 (현재 태그 갯수 + 1)
    tagNameInput.value = tagName; // 컨트롤러로 전달할 값 설정
    tagElement.appendChild(tagNameInput);

    var closeButton = document.createElement("button");
    closeButton.innerText = "";
    closeButton.classList.add("close-button");
    tagElement.appendChild(closeButton);

    var tagContainer = document.getElementById("tagContainer");
    tagContainer.appendChild(tagElement);

    if (tagContainer.querySelectorAll(".tag").length >= 4) {
      document.getElementById("tagName").disabled = true;
    }

//     tagCounter++; // 카운터 변수 증가
    document.getElementById("tagName").value = "";
  }
}

$(document).on("click", ".close-button", function() {
	  $(this).closest(".tag").remove();
	  $("#tagName").prop("disabled", false);
	  
	  // 모든 태그의 name 속성을 재정의
	  $(".tag").each(function(index) {
	    $(this).find("input").attr("name", "tag_name" + (index + 1));
	  });
	});

// 썸네일 작업
// var formData = new FormData(); // 전역 변수로 FormData 객체 생성
// var files = []; // 사용자가 선택한 모든 파일을 저장할 배열
// var imageCounter = 1;

var selectedFiles = [];  // 사용자가 선택한 파일을 저장할 배열

function setThumbnail(event) {
	  var newFiles = event.target.files;
	  var imageCounter = document.querySelectorAll(".imageItem").length + 1;
	  
	  for (var i = 0; i < newFiles.length; i++) {
	    var file = newFiles[i];
	    var ext = file.name.split('.').pop().toLowerCase();
	    var allowedExtensions = ['jpg', 'jpeg', 'gif', 'png'];

	    if (!allowedExtensions.includes(ext)) {
	      alert("jpg, gif, jpeg, png 파일만 업로드 할 수 있습니다.");
	      event.target.value = "";
	      return false;
	    }

	    var imageLength = parseInt(document.getElementById("imageLength").textContent);
	    imageLength++;

	    if (imageLength <= 5) {
	      selectedFiles.push(file); 
	      document.getElementById("imageLength").textContent = imageLength;
	      localStorage.setItem("imageCount", imageLength.toString()); // 임시 저장된 이미지의 갯수를 로컬 스토리지에 저장

	      var reader = new FileReader();
	      reader.onload = (function(file) {
	        return function(e) {
	          var img = document.createElement("img");
	          img.setAttribute("src", e.target.result);
	          img.setAttribute("class", "imageSize");

	          localStorage.setItem("image" + imageCounter, e.target.result); // 이미지를 Base64 형식의 문자열로 변환하여 로컬스토리지에 저장

	          var closeButton = document.createElement("button");
	          closeButton.setAttribute("type", "button");
	          closeButton.setAttribute("class", "imageClose");
	          closeButton.setAttribute("onclick", "removeImage(this)");

	          var imageItem = document.createElement("span");
	          imageItem.classList.add("imageItem");
	          imageItem.file = file;
	          
	          imageItem.appendChild(img);
	          imageItem.appendChild(closeButton);
	          document.getElementById("image_container").appendChild(imageItem);

	          // 첫 번째 이미지에 "대표이미지" 텍스트를 추가합니다.
	          if(imageCounter == 1) {
	            var mainImageText = document.createElement("span");
	            mainImageText.classList.add("mainImage");
	            mainImageText.textContent = "대표이미지";
	            imageItem.appendChild(mainImageText);
	          }
	          imageCounter++;
	        };
	      })(file);
	      reader.readAsDataURL(file);
	    } else if (imageLength > 5) {
	      alert("사진 첨부는 최대 5장까지 가능합니다.");
	      imageLength = 5;
	      document.getElementById("imageLength").textContent = imageLength;
	    }
	  }
	}
//파일 선택 버튼 클릭 시 input[type=file] 클릭 이벤트 발생
function addFileInput() {
document.getElementById("product_image").click();
}

	  
function submitFiles(event) {
	  // 폼의 모든 필드가 채워졌는지 확인
		 if (checkInput() === false) {
		    return;  // 함수 실행 종료
		  }
	
	  var form = document.querySelector('form');
	  
// 	  // 폼의 모든 필드가 채워졌는지 확인
// 	  var formElements = form.elements;
// 	  for (var i = 0; i < formElements.length; i++) {
// 	    var element = formElements[i];
// 	    if (element.name && element.value.trim() == '') {  // 필드가 비어있는 경우
// 	      alert('모든 필드를 채워주세요.');
// 	      return;  // 함수 실행 종료
// 	    }
// 	  }
	  
	  var formData = new FormData();
	  var productStatus = document.querySelector('input[name="product_status"]:checked').value;
	  var tradeMethod = document.querySelector('input[name="trade_method"]:checked').value;
	  formData.append('product_status', productStatus);
	  formData.append('trade_method', tradeMethod);
	  // Form의 각 필드를 개별적으로 FormData에 추가
	  var formElements = form.elements;
	  for (var i = 0; i < formElements.length; i++) {
	    var element = formElements[i];
	    if (element.name && element.name != 'product_image') {  // 'product_image' 필드 제외
	      formData.append(element.name, element.value);
	    }
	  }
		
	  
	  for (var i = 0; i < selectedFiles.length; i++) {
	    formData.append('product_image', selectedFiles[i]);
	  }

	  $.ajax({
		    url: 'ProductRegistSuccess',
		    type: 'POST',
		    data: formData,
		    processData: false,
		    contentType: false,
		    success: function(data) {
				Swal.fire({
		 	        title: '상품을 등록하시겠습니까?',
		 	        icon: 'question',
		 	        showCancelButton: true,
		 	        confirmButtonColor: '#39d274',
		 	        cancelButtonColor: '#d33',
		 	        confirmButtonText: '등록',
		 	        cancelButtonText: '취소',
		 	        reverseButtons: true,
		 	        allowOutsideClick: false
		 	    }).then((result) => {
		 	        if (result.isConfirmed) {
		 	        	location.href =  "ProductDetail?product_id=" + data;
// 		 	        	location.href =  "ProductDetail?product_id=";
		 	        }
		 	    });
		        // 서버로부터 응답을 받았을 때 실행되는 코드
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        // 파일 업로드에 실패했을 때 실행되는 코드
		        alert('실패');
		        console.log(jqXHR, textStatus, errorThrown);
		    }
		});
	}

// // 제출 버튼 클릭 시 서버로 모든 파일 전송
// document.getElementById("submit").addEventListener("click", function() {
//   var xhr = new XMLHttpRequest();
//   xhr.open("POST", "/upload", true);
  
//   var data = new FormData();
//   for (var i = 0; i < files.length; i++) {
//     data.append(files[i].name, files[i].file);
//   }
//   xhr.send(data);
// });



// 이미지 삭제
function removeImage(button) {
  var imageItem = button.parentNode; // 이미지 항목
  var imageContainer = imageItem.parentNode; // 이미지 컨테이너

  // 이미지 항목에서 input 요소(이미지 이름 값) 찾기
  var imageNameInput = imageItem.querySelector('input[name^="image_name"]');
  if (imageNameInput) {
    // 이미지 이름 값 삭제
    imageNameInput.parentNode.removeChild(imageNameInput);
  }
  
  // 이미지 항목 삭제
    for(let i = 1; i <= 5; i++) {
    if(localStorage.getItem("image" + i) === imageItem.querySelector('img').src) {
      localStorage.removeItem("image" + i);
      break;
    }
  }
  imageContainer.removeChild(imageItem);
  
//   var index = imageItem.dataset.index;  // 파일의 인덱스를 가져옵니다.
//   selectedFiles.splice(index, 1);
  
  var file = imageItem.file;  // 파일 객체를 가져옵니다.
  var index = selectedFiles.indexOf(file);  // selectedFiles 배열에서 해당 파일의 인덱스를 찾습니다.
  if (index > -1) {
    selectedFiles.splice(index, 1);  // selectedFiles 배열에서 해당 파일을 제거합니다.
  }
  
  if (selectedFiles.length === 0) {
	    var fileInput = document.getElementById('product_image');
	    fileInput.value = '';
	  }
//   selectedFiles = Array.from(imageContainer.children)
//   .slice(1)  // 첫 번째 요소는 이미지 추가 버튼이므로 제외합니다.
//   .map(function(imageItem) {
//     var index = imageItem.dataset.index;  // 이미지의 인덱스를 가져옵니다.
//     return selectedFiles[index];  // selectedFiles 배열에서 해당 이미지를 가져옵니다.
//   });
  
  if (imageItem.querySelector(".mainImage")) {
	    var nextImageItem = imageContainer.children[1]; 
	    if (nextImageItem && !nextImageItem.querySelector(".mainImage")) {
	        var mainImageText = document.createElement("span");
	        mainImageText.classList.add("mainImage");
	        mainImageText.textContent = "대표이미지";
	        nextImageItem.appendChild(mainImageText);
	      }
	    }
  
  var imageLength = parseInt(document.getElementById("imageLength").textContent); // 현재 카운트 가져오기
  imageLength--;
  document.getElementById("imageLength").textContent = imageLength;

  // 대표 이미지가 없는 경우 숨김 처리
  var imageText = document.querySelector(".mainImage");
  if (imageContainer.children.length === 1) {
    imageText.style.display = "none";
  }
  
  // imageCounter 감소
  if (imageCounter > 0) {
    imageCounter--;
  }
}

// 지도로 찾기 팝업
function AddressMap() {
  var width = 563; // 팝업 창의 가로 크기
  var height = 535; // 팝업 창의 세로 크기
  var left = window.screenX + (window.outerWidth - width) / 2; // 화면 가로 중앙에 위치
  var top = window.screenY + (window.outerHeight - height) / 2; // 화면 세로 중앙에 위치

  var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",resizable=no";

  window.open("AddressMap", "지도로 찾기", options);
}

// 팝업창에서 가져온 값을 뿌려준다.
function setAddress(address) {
	  document.getElementById('myMap').value = address;
	}

function clearTempData(sId) {
	  localStorage.removeItem(sId + "_productName");
	  localStorage.removeItem(sId + "_categoryName");
	  localStorage.removeItem(sId + "_tradePlace");
	  localStorage.removeItem(sId + "_productStatus");
	  localStorage.removeItem(sId + "_trade_method");
	  localStorage.removeItem(sId + "_product_price");
	  localStorage.removeItem(sId + "_ProductDescription");
	  localStorage.removeItem(sId + "_isTempSaved");

	  for(let i = 1; i <= 5; i++) {
		    localStorage.removeItem(sId + "_image" + i);
		  }
		}
function checkInput() {
	var fileInput = document.getElementById('product_image');
    var imageCount = parseInt(localStorage.getItem("imageCount") || "0");
	var sId = "${sId}";
    var fileInput = document.getElementById('product_image');
    if (fileInput.files.length === 0) {
//     if (fileInput.files.length === 0 && imageCount === 0) {
      alert('이미지파일 1개 이상 등록하셔야 됩니다.');
      	$("#product_image").focus();
      	$("html, body").animate({ // 페이지를 이동시켜준다.
      	  scrollTop: $("#required").offset().top
      	}, 500); // 스크롤 애니메이션의 속도를 나타낸다.
      return false; // 제출 중단
    }else if($("#productName").val() === "") {
    	alert("상품명 등록 필수입니다.");
    	$("#productName").focus();
    	$("html, body").animate({
   		  scrollTop: $("#productName").offset().top
   		}, 500);
    	return false;
    }else if($("#categoryName").val() === "default") {
    	alert("카테고리 선택 필수입니다.");
    	$("#categoryName").focus();
    	$("html, body").animate({
   		  scrollTop: $("#divPadding").offset().top
   		}, 500);
    	return false;
    }else if($("#myMap").val() === "") {
    	alert("거래지역 등록 필수입니다.");
    	$("#myMap").focus();
    	$("html, body").animate({
   		  scrollTop: $("#hr1").offset().top
   		}, 500);
    	return false;
    }else if(!$("input[name='product_status']:checked").val()) {
    	alert("상품상태 선택 필수입니다.");
    	$("#productStatus1").focus();
    	$("html, body").animate({
   		  scrollTop: $("#hr2").offset().top
   		}, 500);
    	return false;
    }else if(!$("input[name='trade_method']:checked").val()) {
    	alert("거래방법 선택 필수입니다.");
    	$("#productStatus1").focus();
    	return false;
    }else if($("#priceInput").val() === "") {
    	alert("가격 입력 필수입니다.");
    	$("#priceInput").focus();
    	return false;
    }else if($("#priceInput").val() < 1000) {
    	alert("최소 판매금액은 1,000원 입니다.");
    	$("#priceInput").focus();
    	return false;
    }else if($("#ProductDescription").val() === "") {
    	alert("설명 입력 필수입니다.");
    	$("#ProductDescription").focus();
    	return false;
    }
    clearTempData(sId);
    return true;
  }
  
  
  // 상품등록이 성공적으로 됐을 시 로컬스토리지 초기화
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
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="SearchProduct">상품</a></li>
                        <li>상품등록</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<section class="item-details section" id="sectionWidth">
<div id="background">
	<div class="container content-wrapper">
		<div class="addBox">
			<form id="addForm" name="addForm" class="add-form" action="ProductRegistSuccess" method="post" enctype="multipart/form-data" onsubmit="return checkInput();">
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
						<input class="form-control form-control-user" type="file" style="display: none;" multiple
  						name="product_image" id="product_image" onchange="setThumbnail(event);" accept=".gif, .jpg, .png, .jpeg" >
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
						</ul>
					</div>
						<input type="text" id="productName" name="product_name" onkeyup="productKey()" maxlength="40" oninput="limitInputLength(this, 40)"
						placeholder="상품명을 입력해 주세요." class="text-box">
						<a href="ProhibitionOnsale" target="_blank" id="tradeX">
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
							<select id="categoryName" name="product_category" class="dataTable-selector selector" onchange="addACategory();">
								<option value="default">카테고리를 선택하세요.</option>
								<option>상의</option>
								<option>하의</option>
								<option>아우터</option>
								<option>아동복</option>
								<option>셋업/세트</option>
								<option>패션/잡화</option>
								<option>신발</option>
								<option>기타</option>
							</select>
							<div id="Category">
							선택한 카테고리 : 
							<b id="selectCategory"></b>
							</div>
						</li>
					</ul>
				</div>
				<hr id="hr1">
				
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
									<div id="divPadding" class="myMapButtonPadding"><input type="button" id="myMapButton" value="지도로 찾기" onclick="AddressMap()"></div>
								<input type="text" id="myMap" name="trade_place"  size="64" required placeholder="지역을 설정해 주세요">
							</li>
						</ul>
				</div>
				
					<hr id="hr2">
				<div>
					<div id="divLine" class="productStatus">
						<p>상품 상태<span>*</span></p>
					</div>
					<ul id="ulLine">
						<li class="productsStatusRadio">
							<label id="radioChoise">
								<input type="radio" id="productStatus1" name="product_status" value="0"> 보통
							</label><br>
							<label id="radioChoise">
								<input type="radio" id="productStatus2" name="product_status" value="1"> 좋은상태
							</label><br>
							<label id="radioChoise">
								<input type="radio" id="productStatus3" name="product_status" value="2"> 새상품<br>
							</label>
						</li>
					</ul>
				</div>
				<hr id="hr3">
				<div>
					<div id="divLine" class="trade_methodDiv">
						<p>거래방법<span>*</span></p>
					</div>
					<ul id="ulLine">
						<li class="trade_methodRadio">
						  <label id="radioChoise1">
						    <input type="radio" id="trade_method1" name="trade_method" value="0"> 대면거래
						  </label><br>
						  <label id="radioChoise2">
						    <input type="radio" id="trade_method2" name="trade_method" value="1" <c:if test="${payStatus eq 0 }">disabled</c:if>> 소심거래<c:if test="${payStatus eq 0 }">(선택불가)</c:if>
						  </label><br>
						</li>
					</ul>
<!-- 					<div id="sosimPay"> -->
<!-- 						<a href="AccountVerification"> -->
<%-- 							<img src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png"> --%>
<!-- 						</a> -->
<!-- 						<span>가입자만 선택 가능합니다.</span> -->
<!-- 					</div> -->
				</div>
				<c:if test="${payStatus eq 0 }">
					<div id="sosimPay">
						<a href="AccountVerification">
							<img src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png" width=100px;" height="30px;" >
						</a>
						<span id="paySelect">가입자만 선택 가능합니다.</span>
					</div>
				</c:if>
				<hr>
				<div>
					<div id="divLine" class="price">
						<ul>
							<li id="priceText"><p>가격<span>*</span></p></li>
						</ul>
					</div>
						<ul id="ulLine">
							<li>
								<input type="text" id="priceInput" name="product_price" placeholder="가격을 입력해 주세요." oninput="price(this)" maxlength="11">원
								<div id="priceProposal">
								</div>
							</li>
							<li>
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
					    <textarea rows="6" cols="100" style="resize: none; white-space: pre-line;" id="ProductDescription" name="product_txt" maxlength="2000" onkeyup="ProductDescriptionKey()" 
					        oninput="limitInputLength2(this, 2000)" placeholder="구매시기,브랜드/모델명,제품의 상태(사용감,하자 유무) 등을 입력해 주세요" >${productModify.product_txt}</textarea>
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
					<button type="button" id="temporarySaveButton">임시저장</button>
<!-- 					<input type="submit" id="buttonBox" value="상품등록"> -->
					<input type="button" id="buttonBox" value="상품등록" onclick="submitFiles();">
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
<!--     	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script> -->
	</th:block>
</body>
</html>

















