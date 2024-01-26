<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style>
	#proposalBackground{
		background-color: #f9f9f9;
	}
	#proposalProductImage , #proposalProductSubject , #proposalProductPrice{
		display: inline-block;
	}
	#proposalThree , #proposalPriceDiv{
	padding: 30px;
	}
	#proposalProductSubject{
		font-size: 30px;
		position:relative;
		bottom:60px;
	}
	#proposalProductPrice{
		font-size: 40px;
		font-weight: bold;
		position: relative;
		right:180px;
		bottom:10px;
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
	.btn{
    display: inline-block;
    margin-right: 7px;
    border: 1px solid #eee;
    border-radius: 4px; 
    color: #555;
    padding: 10px 18px;
    font-size: 13px;
    font-weight: 600;
    -webkit-transition: all 0.4s ease;
    transition: all 0.4s ease;
    height: 46px;
    width: 100%;
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
    background: rgb(255, 255, 255);
    color: rgb(102, 102, 102);
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
	}
</style>
<script>

$(function() {
    $("#priceInput").on('input', function() {
        var normalMoney = $(this).val(); // 입력된 값 가져오기
        var moneyReplace = parseInt(normalMoney.replace(/,/g, "")); // 쉼표 제거 후 정수 변환

        if (moneyReplace < 1000) { // 1000 이하인지 비교
            $("#priceX").html("최소 가격인 1,000원보다 작을수 없습니다.");
        
        } else {
            $("#priceX").empty(); // 조건이 만족하지 않으면 메시지 제거
        }
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

</script>
<body>
		<div id="proposalBackground">
			<div id="proposalThree">
				<div id="proposalProductImage">
					<img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" class="img" alt="#" height="100px">
				</div>
				<div id="proposalProductSubject">
					아이유사진첩
				</div>
				<div id="proposalProductPrice">
					20,000원
				</div>
			</div>
		</div>
		<div id="proposalPriceDiv">
			<input type="text" id="priceInput" placeholder="가격을 입력해 주세요." oninput="price(this)" maxlength="11" value="20,000"><span id="priceInput2" style="font-size: 40px">원</span>
			<hr>
		</div>
		<div id="priceX"></div>
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
		<input type="submit" onclick="test()" value="제안하기" id="proposal">
	</form>
</body>
</html>