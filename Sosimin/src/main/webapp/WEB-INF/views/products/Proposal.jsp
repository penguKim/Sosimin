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
</style>
<script>
function test() {
	
	var money = $("#priceInput").val();
	var moneyReplace = money.replace(",","");
	var price2000 = $("#price2000").val();
	alert(moneyReplace);
};

function price(input) {
	 
	var value = input.value.replace(/[^0-9]/g, '');
	
	var formattedValue = Number(value).toLocaleString();
	
	input.value = formattedValue;
}

function salePrice(money) {
	var normalMoney = $("#priceInput").val(); // 가격창에 있는 기본 가격
	var moneyReplace = parseInt(normalMoney.replace(",","")); // 가격창에 있는 기본 가격 , 때고 int로 변환
	var money = parseInt(money); // -2,000원 int 타입으로 변환
	var moneySale = moneyReplace - money; // 원래있던 가격과 -2,000원 가격 뺀가격
	
    var int1 = document.getElementById("priceInput").value;
	
	alert(int1);
};

</script>
<body>
	<form action="">
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
        <div class="col-lg-4 col-md-4 col-12">
	        <div class="wish-button" id="priceProposal">
	        	<div id="priceContainer">
	            	<button class="btn" style="width:174px; height: 60px; font-size: 20px;" value="2000" id="price2000" onclick="salePrice(this.value)">- 2,000원</button><span></span>
	            </div>
	        	<div id="priceContainer">
	            	<button class="btn" style="width:174px; height: 60px; font-size: 20px;" value="3000" id="price3000">- 3,000원</button>
	            </div>
	        	<div id="priceContainer">
	            	<button class="btn" style="width:174px; height: 60px; font-size: 20px;" value="5000" id="price5000">- 5,000원</button>
	            </div>
	        </div>
        </div>
		<input type="submit" onclick="test()" value="제안하기">
	</form>
</body>
</html>