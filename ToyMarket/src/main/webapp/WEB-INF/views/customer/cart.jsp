<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap 5 Example</title>
 	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
		<link href="../../resources/css/jhw-css.css?after" rel="stylesheet" type="text/css"></link>
</head>
<body>
	<div class="container">
		<div id="header">
			<%@ include file="../common/header.jsp"%>
			<!-- search페이지 내 검색 BOX -->
			<div class="text-center" style="height: 100px">
				<div style="margin: 100px auto 50px">
					<h2>장바구니</h2>
				</div>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-12">
				<h3 class="border p-3 bg-light" style="color:#981098"><small >${user.name }님 장바구니 목록</small></h3>
			</div>
		</div>	
		
		<div class="row mb-4"> 
			<div class="col-12">
				<form method="get" action="/order/list" id="cart">
				<div class="card">
					<div class="card-body pb-0">
						<table class="table">
							<thead>
								<tr style=" color : #981098;">
									<th>선택</th>
									<th>상품</th>
									<th>상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th class="text-right">구매가격</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${cartItems }" varStatus="loop">
									<tr>
										<td><input type="checkbox"  id="check-me-${item.cartNo }" class="form-check-input"  name="itemNo" onclick="getCheckboxValue('${item.cartNo}')" value="${item.cartNo }" checked/></td>
										<td><img width= "100px" height= "75px" src="${item.productImage }" alt="${item.productName }"></td>
										<td>${item.productName }</td>
										 <td><span id="item-price-${item.cartNo }"><fmt:formatNumber value="${item.price}"/></span> 원</td>   
										<td>
										<button styl type="button" class="btn btn-info btn-sm" onclick="changeAmount('${item.cartNo}', -1)">-</button>
 										<input type="text" id="item-amount-${item.cartNo }" value="${item.amount }" readonly>
 										<button  type="button" class="btn btn-info btn-sm" onclick="changeAmount('${item.cartNo}', 1)">+</button>
 										</td>
										 <td><span id="item-payPrice-${item.cartNo }"><fmt:formatNumber value="${item.price*item.amount}"/></span> 원</td>   
										 <td><button type="button" class="btn btn-danger btn-sm"   onclick="removeCheck(${item.cartNo})" >삭제</button></td>
										 <input type="hidden" id="item-discountRate-${item.cartNo }" value ="${item.discountRate }"/>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					
						 <div scope="col">
							<input type="checkbox" id="checkbox-all" name="check-all" onclick="toggleAgreementCheckbox()" checked/>
							<label for="check-all">전체선택</label>
						</div>	  
					</div>
				</div>
	
			<div class="row mb-3" style="margin-top:5%">
				<div class="col-6 border p-3 bg-light">
					<table class="table">
						<thead>
							<tr>
								<th>상품금액</th>
								<input type="hidden" value ="${totalPrice }" id="orderPrice" name="orderPrice"/>
								<th><span id="order-price"><fmt:formatNumber value="${totalPrice}"/></span> 원</th>
								
							</tr>
							<tr>
								<th>상품할인금액</th>
								<input type="hidden" value ="${totalDiscountPrice }" id="totalDiscountRate" name="totalDiscountRate"/>
								<th><span id="discount-price"><fmt:formatNumber value="${totalDiscountPrice}"/></span> 원</th>
							</tr>
						</thead>
						<tbody>
							<tr style=" color : #981098;">
								<td>결제예상금액</td>
								<input type="hidden" value ="${totalPrice-totalDiscountPrice}" id="totalPrice" name="totalPrice"/>
								<th><span id="total-price"><fmt:formatNumber value="${totalPrice-totalDiscountPrice}"/></span> 원</th>
							</tr>
							
						</tbody>
					</table>		
					
				</div>
			</div>
		</form>	

	</div>
</div>
			
			<div class="text-right">
				<input type="button" id="btn" class="btn btn-primary" onclick="checkForm()" value="주문하기">
			</div>
</div>
	
<script type="text/javascript">
	function toggleAgreementCheckbox() {

		//체크박스로 전체 체크하기 
		var checkboxAllChecked = document.getElementById("checkbox-all").checked;

		var checkboxes = document.querySelectorAll('input[name="itemNo"]');
		for (var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = checkboxAllChecked;
		}
		
		var orderPriceEl = document.getElementById("order-price");   // 상품금액 엘리먼트
		var discountPriceEl = document.getElementById("discount-price");// 구매 할인 가격 엘리먼트
		var totalPriceEl = document.getElementById("total-price"); // 최종가격
		
		var checkbox = document.getElementById("checkbox-all");
		
		if(!checkbox.checked){ // 전체선택 체크해제 할경우
			 orderPriceEl.innerText = 0; 
			 discountPriceEl.innerText = 0;
			 totalPriceEl.innerText = 0;
			 return;
		}else{  // 전체선택 체크 할 경우
			// 총상품금액, 총상품할인금액을 저장할 변수를 선언한다.
			var orderPrice = 0; // 상품금액 가격
			var discountPrice = 0; // 구매할인 가격
			// 체크박스중 체크된 엘리먼트들을 가져온다.
			var checkbox = document.querySelectorAll('input[name="itemNo"]:checked');

				// 해당 엘리먼트수만큼 반복문을 실행한다.
			for(var i=0; i<checkbox.length; i++){

				// 가격을 가져와서 , 기호와 '원' 문자열을 제거한다.
				var price = checkbox[i].parentElement.parentElement.children[5].innerText.replace(/,/g, '').replace(' 원','');
				// 그리고 총 상품금액가격 변수에 누적합한다.
				orderPrice += Number(price);
				
				// 할인율을 가져온다.
				var discount = checkbox[i].parentElement.parentElement.children[7].value;
				// 할인율을 계산아여 구매할인가격 변수에 누적합한다.
				discountPrice += ((Math.ceil(Number(price)*Number(discount)))/10)*10;
				
				//var payPriceEl = document.getElementById("item-payPrice-" + cartNo);
				//var discountEl = document.getElementById("item-discountRate-" + cartNo);
				
				//orderPriceAll += (checkbox[i].payPriceEl.value);
				//discountPriceAll += (checkbox[i].discountEl.value);
			}

			// 상품금액, 상품할인금액,결제예상금액 엘리먼트들을 가져온다
			var orderPriceAll = document.getElementById("order-price");   // 상품금액 엘리먼트
			var discountPriceAll = document.getElementById("discount-price");// 구매 할인 가격 엘리먼트
			var totalPriceEl = document.getElementById("total-price"); // 최종가격 
			
			var totalPrice = Number(orderPrice) - Number(discountPrice);
			orderPrice = new Number(orderPrice).toLocaleString();
			discountPrice = new Number(discountPrice).toLocaleString();
			totalPrice = new Number(totalPrice).toLocaleString();
			
			
			// 계산한 변수(총상품금액,총상품할인금액을 위 엘리먼트들의 .innerText안에 넣어준다.
			orderPriceAll.innerText = orderPrice;
			discountPriceAll.innerText = discountPrice;
			totalPriceEl.innerText = totalPrice

		}
		
 	}
	
	
	//체크박스 선택해제하면 총금액에서 제거
	function getCheckboxValue(cartNo){
		var itemPriceEl = document.getElementById("item-payPrice-"+ cartNo);   // 가격 엘리먼트
		var price = itemPriceEl.textContent.replace(/,/g, '')   // 4,500,000 -> 4500000	
		 
		var itemDiscountRate = document.getElementById("item-discountRate-"+ cartNo).value; // 할인률 엘리먼트 
		 
		// 총 상품금액 표 엘리먼트
		var orderPriceEl = document.getElementById("order-price");   // 상품금액 엘리먼트
		var discountPriceEl = document.getElementById("discount-price");// 구매 할인 가격 엘리먼트
		var totalPriceEl = document.getElementById("total-price"); // 최종가격
		var allItemPrice = orderPriceEl.textContent.replace(/,/g, '') ;
		var discountPrice = discountPriceEl.textContent.replace(/,/g, '') ;

		
		var checkBox = document.getElementById("check-me-"+ cartNo);  
		var checked = 1;
		if(!checkBox.checked){
			checked = -1;
		}
		
		var orderPriceA = Number(allItemPrice) + (price * checked);
		var discountPriceA =  ((Math.ceil(Number(discountPrice) + (itemDiscountRate * (price * checked))))/10)*10; // 계산된 할인가
		var totalPriceA =  Number(orderPriceA) - Number(discountPriceA);

		  // 구매가격을 ,가 포함된 통화표기법으로 변경
		orderPriceA = new Number(orderPriceA).toLocaleString();
		discountPriceA = new Number(discountPriceA).toLocaleString();
		totalPriceA = new Number(totalPriceA).toLocaleString();
	
		  
		// 구매가격 엘리먼트의 내용을 변경
		orderPriceEl.innerText = orderPriceA;
		// 할인가격 엘리먼트의 내용을 변경
		discountPriceEl.innerText = discountPriceA;
		// 총구매가격 엘리먼트의 내용을 변경 
		totalPriceEl.innerText = totalPriceA;
		 
	}

	function checkForm() {
	
		// 체크된 체크박스의 길이 가져오기
		var checkMe = document.querySelectorAll('input[name="itemNo"]:checked').length;
		if (checkMe==0) {
			alert("상품을 한 개 이상 선택해 주시기 바랍니다.");
			return;
		}else{
			var totalPriceEl = document.getElementById("orderPrice"); // 상풍금액 hidden input El
			totalPriceEl.value  = document.getElementById("order-price").textContent; // 상품금액 span태그값을 input값에 넣음

			var totalDiscountRatePriceEl = document.getElementById("totalDiscountRate"); // 할인금액 hidden input El
			totalDiscountRatePriceEl.value = document.getElementById("discount-price").textContent;
			
			var totalPriceEl = document.getElementById("totalPrice"); // 총금액 hidden input El
			totalPriceEl.value  = document.getElementById("total-price").textContent; // 총금액 span태그값을 input값에 넣음
			// 모든 폼 입력값이 유효한 입력값임으로 서버로 제출되게한다.
			document.getElementById("cart").submit();	
		}
	}
	
	function changeAmount(cartNo, val) {
			
			
		   // 수량 엘리먼트 조회
		   var amountEl = document.getElementById("item-amount-" + cartNo);      // 수량 엘리먼트
		   amountEl.value = parseInt(amountEl.value) + val;
		   
		   var checkBox = document.getElementById("check-me-"+ cartNo);  
		   if(!checkBox.checked){
			   amountEl.value = parseInt(amountEl.value) - val;
			   return;
		   }
		   else if (amountEl.value == 0) {
		      amountEl.value = 1;
		      return;
		   }

			// 가격, 구매가격 엘리먼트 조회
		   var itemPriceEl = document.getElementById("item-price-"+ cartNo);   // 가격 엘리먼트
		   
			
		   
		   // 총가격계산
		   var orderPriceEl = document.getElementById("order-price");   // 상품금액 엘리먼트
		   var discountPriceEl = document.getElementById("discount-price");// 구매 할인 가격 엘리먼트
		   var itemDiscountRate = document.getElementById("item-discountRate-"+ cartNo).value; // 할인률 엘리먼트 
		   var totalPriceEl = document.getElementById("total-price"); // 최종가격
		   

		   // 가격 조회
		   var price = itemPriceEl.textContent.replace(/,/g, '')   // 4,500,000 -> 4500000
		   var allItemPrice = orderPriceEl.textContent.replace(/,/g, '') 
		   var allDiscountPrice = discountPriceEl.textContent.replace(/,/g, '') 
		   
			// 구매가격 수정
		   var payPriceEl = document.getElementById("item-payPrice-" + cartNo);
		   var payPrice = new Number(amountEl.value * price).toLocaleString(); // , 처리
		   payPriceEl.textContent = payPrice;
		   
		   // 가격 계산
		   var itemPrice = price * amountEl.value;
		   var orderPrice = Number(allItemPrice) + (price * val);
		   var discountPrice = ((Math.ceil(Number(allDiscountPrice) +((price * itemDiscountRate)* val)))/10)*10;
		   var totalPrice = (orderPrice - discountPrice);	//  총 구매가격
		   
		   // 구매가격을 ,가 포함된 통화표기법으로 변경
		   orderPrice = new Number(orderPrice).toLocaleString();
		   discountPrice = new Number(discountPrice).toLocaleString();
		   totalPrice = new Number(totalPrice).toLocaleString();
		   // 가격 엘리멘트의 내용을 변경 
	
		   // 구매가격 엘리먼트의 내용을 변경
		   orderPriceEl.innerText = orderPrice;
		   // 할인가격 엘리먼트의 내용을 변경
		   discountPriceEl.innerText = discountPrice; // <== 엘리먼트의 텍스트필드에 값을 넣어준다는 뜻 
		   // 총구매가격 엘리먼트의 내용을 변경 
		   totalPriceEl.innerText = totalPrice;
		   
		   location.href = 'count?cartNo=' + cartNo + '&amount=' + amountEl.value
		}

	
	function removeCheck(no) {
		// 상품삭제시 경고창 
		var result = confirm("정말 삭제하시겠습니까??");
		if (result) {
			location.href = 'delete?cartNo=' + no
		}

	}
	
	
	
</script>
 <style>
   #btn{
  		 background-color:darkviolet;
        border: slateblue;
        font-style: normal;
        color: white;
   }

</style>
</body>
</html> 