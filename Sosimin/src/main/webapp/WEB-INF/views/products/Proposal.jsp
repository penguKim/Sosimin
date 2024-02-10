<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
	#proposalBackground{
		background-color: #f9f9f9;
	}
	#proposalProductImage{
		display: inline-block;
	}
	#proposalThree , #proposalPriceDiv{
	display:inline-block;
	padding: 30px;
	position:relative;
	width:2400px;
	max-width: 700px;	
	}
	#proposalPriceDiv{
		width: 550px;
		position: relative;
	}
	#proposalProductSubject{
		position:relative;
		top:140px;
		right:150px;
		font-size: 30px;
	}
	#proposalProductPrice{
		font-size: 40px;
		font-weight: bold;
		position: relative;
		top:140px;
		right:150px;
	}
	#priceInput{
		font-size: 40px;
		border: none;
		width: 230px;
		text-align: right;
	}
	#priceContainer{
		display: inline-block;
	}
	#priceProposal{
		position:relative;
		left:30px;
		bottom:30px; 
	}
	#product_name{
	display:inline-block;
	position:relative;
	left:155px;
	bottom:155px;
	}
	#productPrice{
		position: relative;
		left:50em;
	}
	.btn{
    display: inline-block;
    margin-right: 7px;
    border: 1px solid #39d274;
    border-radius: 4px; 
    color: #39d274;
    padding: 10px 18px;
    font-size: 13px;
    font-weight: 600;
    -webkit-transition: all 0.4s ease;
    transition: all 0.4s ease;
    height: 46px;
    width: 100%;
    background-color: white;
    
	}
	.btn:hover {
    color: #fff;
    background-color: #39d274;
    border-color: transparent;
	}
	#proposal{
    display: inline-flex;
    position:relative;
    left:30px;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    box-sizing: border-box;
    padding: 16px 45px;
    border-radius: 2px;
    border: 1px solid rgb(229, 229, 229);
    background: #39d274;
    color: white;
    font-size: 20px;
    font-weight: 500;
    width:550px;
	}
	
	#proposal:hover{
    color: #fff;
    background-color: #39d274;
    border-color: transparent;
	} 
	
	#priceX{
		display:inline-block;
		position: relative;
		left:30px;
		bottom:36px;
		color:red;
		font-weight: bold;
		height: 10px;
	}

</style>
<script>

$(function() {
	    $("#priceInput").on('input', function() {
	        var normalMoney = $(this).val(); // 입력된 값 가져오기
	        var moneyReplace = parseInt(normalMoney.replace(/,/g, "")); // 쉼표 제거 후 정수 변환

	        if (moneyReplace < 1000) { // 1000 이하인지 비교한다
	            $("#priceX").html("최소 가격인 1,000원보다 작을 수 없습니다.");
	            $("#priceX").css("color", "red"); // 텍스트 색상을 빨간색으로 설정
	        } else {
	            $("#priceX").html("최소 가격인 1,000원보다 작을 수 없습니다.");
	            $("#priceX").css("color", "transparent"); // 텍스트 색상을 투명으로 설정
	        }
	    });
	});
function submit() {
    var priceInput = $("#priceInput"); // 입력된 가격 가져오기
    var moneyReplace = parseInt(priceInput.val().replace(/,/g, "")); // 쉼표 제거 후 정수 변환
    
    if (moneyReplace < 1000) { // 1000원보다 작은지 비교한다
    	   alert("최소 가격보다 작습니다.");
           priceInput.focus(); // 가격창에 focus 주기
        return false; // submit 버튼 동작 중지
    }
    return true; // submit 버튼 동작 허용
}

$(document).ready(function() {
    $("#proposal").click(function() {
        return submit();
    });
});

function price(input) {
	 
	var value = input.value.replace(/[^0-9]/g, '');
	
	var formattedValue = Number(value).toLocaleString();
	
	input.value = formattedValue;
}

var isProcessing = false; // 처리 중인지 여부를 저장하는 변수

function salePrice(discount) {
    if (isProcessing) {
        return false; // 이미 처리 중인 경우 함수를 종료
    }
    
    
    var normalMoney = $("#priceInput").val(); // 가격창에 있는 기본 가격
    var moneyReplace = parseInt(normalMoney.replace(/,/g, "")); // 가격창에 있는 기본 가격의 쉼표를 제거하고 숫자로 변환
    var discountInt = parseInt(discount); // 할인 금액을 숫자로 변환
    var moneySale = moneyReplace - discountInt; // 원래 가격에서 할인 금액을 뺀 새로운 가격
    
    if(moneySale < 1000) {
    	alert("최소 가격인 1,000원보다 작을수 없습니다.");
    }else {
    // 결과를 표시하는 부분
    $("#priceInput").val(moneySale.toLocaleString()); // 가격창에 새로운 가격을 표시
    }
}


// 버튼 클릭 이벤트를 jQuery로 바인딩
$(document).ready(function(){
    $("#price3000").click(function() {
        salePrice(this.value);
    });
    $("#price5000").click(function() {
        salePrice(this.value);
    });
});

function price(input, maxLength) {
    if (input.value.length > maxLength) {
      input.value = input.value.slice(0, maxLength);
    }
    document.getElementById("priceInput").textContent = input.value.length;
  }
  
function proposalOk() {
    var sId = "${sId}";
    var product_id = ${Product.product_id};
    Swal.fire({
        title: '가격제안 하시겠습니까?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#39d274',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        reverseButtons: true,
        allowOutsideClick: false
    }).then((result) => {
        if (result.isConfirmed) { // 확인 버튼을 클릭했을 경우
            // 비즈니스 로직 실행 후 성공 메시지를 표시
            Swal.fire({
                icon: 'success',
                title: '가격제안이 완료되었습니다.',
                allowOutsideClick: false
            }).then(() => {
                // 팝업이 완전히 닫힌 후에 window.close()가 실행되도록 setTimeout을 사용
                setTimeout(function() {
                    window.close();
                }, 0); // 1000ms = 1초 후에 실행
            });
        }
    });
};

</script>
<body>
		<div id="proposalBackground">
			<div id="proposalThree">
				<div id="proposalProductImage">
					<img src="${pageContext.request.contextPath}/resources/upload/${Product.product_image1}" class="img" alt="#" height="100px" width="100px">
				</div>
				<div id="product_name">
					<div id="proposalProductSubject">
					${Product.product_name }
					</div>
					<div id="proposalProductPrice">
					<fmt:formatNumber value='${Product.product_price}' pattern='#,###' />원
					</div>
				</div>
			</div>
		</div>
		<div id="proposalPriceDiv">
			<input type="text" id="priceInput" placeholder="가격을 입력해 주세요." oninput="price(this)" maxlength="11"
			value="<fmt:formatNumber value='${Product.product_price}' pattern='#,###' />"><span id="priceInput2" style="font-size: 40px">원</span>
			<hr>
		</div>
		<div id="priceX" ></div>
		<br><br><br>
        <div class="col-lg-4 col-md-4 col-12">
	        <div class="wish-button" id="priceProposal">
	        	<div id="priceContainer">
	            	<button class="btn" style="width:174px; height: 60px; font-size: 20px;" value="2000" id="price2000" onclick="salePrice(this.value)">- 2,000원</button>
	            </div>
	        	<div id="priceContainer">
	            	<button class="btn" style="width:174px; height: 60px; font-size: 20px;" value="3000" id="price3000">- 3,000원</button>
	            </div>
	        	<div id="priceContainer">
	            	<button class="btn" style="width:174px; height: 60px; font-size: 20px;" value="5000" id="price5000">- 5,000원</button>
	            </div>
	        </div>
        </div>
		<form action="가라 1대1 채팅으로">
		    <input type="button" value="제안하기" id="proposal" onclick="proposalOk()">
		</form>
</body>
</html>