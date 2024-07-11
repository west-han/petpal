<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

.body-container2 {
	max-width: 1300px;
	margin: 0 auto;
	font-size: 15px;
	color: #434347;
}

.destination-info, .point, .price, .saving-point .buttons {
	margin-top: 30px;
}

.md-img {
	width: 70px; height: 70px;
}

.order-product {
	margin-top: 20px;
	padding-bottom: 15px;
	font-size: 18px;
	font-weight: bold;
	border-bottom: 3px solid #BDBDBD;

}

.order-product-bottom {
	margin: 15px 0;
	height: 1px;
	background-color: #434347;
	border: none;
}

.destination .destination-name {
	font-weight: bold;
}

.destination-title {
	margin-top: 50px;
	font-size: 18px;
	font-weight: bold;
}

.destination-info {
	display: flex;
	align-items: baseline;
}


.destination-info .btn {
	padding: 0 15px;
	height: 30px;
	margin-left: 80px;
	background: white;
	border: 1px solid #A6A6A6;
	border-radius: 5px;
	font-size: 13px;
}

table {
    width: 100%;
    border-collapse: collapse;

}

.order-title th {
	color: #BDBDBD;
	font-size: 16px;
	padding-bottom: 15px;
	padding-top: 15px;
	text-align: center;
}

.order-content {
	margin-bottom: none;
}

.order-content td {
	text-align: center;
}



.content-title {
	text-align: center;
}

.content-option {
	font-size: 13px;
	text-align: center;
	margin-top: 5px;
	color: #A6A6A6;
}

.content-point {
	padding-left: 30px;
}

.content-qty {
	padding-left: 48px;
}

.discount-price, .product-price,  .total-price {
	padding-left: 38px;
}

.product-price .original-price {
	text-decoration: line-through;
	color: #A6A6A6;
	margin-top: 3px;
}

.point-title, .price-title {
	border-bottom: 3px solid #BDBDBD;
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 10px;
	margin-top: 50px;
}

.destinaion {
	margin-top: 15px !important;
	border-top: 3px solid #BDBDBD;
}

.destinaion .destination-name {
	margin-left: 30px;
}

.destination-name .mem-name, .destination-name .mem-tel {
	font-weight: bold;
}

.destinaion .destination-name, .destinaion .destination-addr, .destination-memo {
	display: flex;
}

.destinaion .mem-name, .destination-addr div:first-child  {
	margin-right: 100px;
}

.destinaion .mem-name, .destination-addr, .destination-memo  {
	padding-top: 18px;

}

.destination-memo div:first-child {
	margin-right: 85px;
}

.destinaion .btn {
	padding: 5px 10px;
	background-color: white;
}

.point-content {
	display: flex;
	margin-top: 18px;
}

.point-content div {
	display: flex;
	align-items: center;
}

.point-detail {
	margin-right: 100px;
}

.point-input {
	margin-right: 20px;
}

.point-btn {
	margin-right: 20px;
	background: white;
	padding: 5px 10px;
	border-radius: 5px;
	border: 1px solid #A6A6A6;	
}

.price-content {
	margin-top: 18px;
	margin-right: 30px; 
	display: flex;
	justify-content: space-between;	
}

.price-totalMain {
	margin-bottom: 25px;
}

.product-totalAmount {
	padding-top: 7px;
	color: #E4B075;
	font-weight: bold;
	font-size: 18px;
}

.price .price-usingPoint {
	margin-bottom: 15px;
}

.price-total {
	margin-top: 5px; 
	margin-right: 65px;
	color: #E4B075 !important;
	font-size: 18px;
}

.saving-point {
	margin-bottom: 60px;
}

.title-gray {
	margin-left: 30px;
	color: #A6A6A6;
	font-weight: bold;
}

.memo-input {
	width: 450px;
    border: none; 
    border-bottom: 1px solid #BDBDBD !important;
    padding-bottom: 5px;

    outline: none;
    border-radius: 0;
}

.point-input {
	width: 150px;
    border: none; 
    border-bottom: 1px solid #BDBDBD;
    outline: none;
    border-radius: 0;
}

input::placeholder {
  color: #A6A6A6;

}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.buttons {
	margin-bottom: 60px;
	display: flex;
	justify-content: center;
}

.buttons .complete-btn {
	width: 1250px;
	height: 50px;
	border-radius: 8px;
	font-weight: bold;
	background: #E4B075;
	border: none;
	color: white;
	margin-left: 5px;
}

button:hover {
	cursor: pointer;
}

</style>

<div>
	<div class="body-container">	
		<div class="body-container2">
			
			<div>
				<div class="order-product">주문 상품</div>
			</div>
			
			<div class="body-main">
				<form name="paymentForm" method="post">
					<table class="table">
						<tr class="order-title">
							<th width="120">&nbsp;</th>
							<th width="200">상품정보</th>
							<th width="90">구매적립</th>
							<th width="90">수량</th>
							<th width="120">할인금액</th>
							<th width="120">상품금액</th>
							<th width="120">총금액</th>
						</tr>
						
						
							<tr class="order-content" valign="middle">
								<td width="120">
									<img class="md-img" src="${pageContext.request.contextPath}/uploads/product/product_detail.jpg">
								</td>
								<td class="product-info" width="200">
									<div class="content-title">이츠독 올 뉴 투웨이 카시트</div>
									<div class="content-option">
										<!-- 
										<c:if test="${dto.optionCount==1}">
											${dto.optionName} : ${dto.optionValue}
										</c:if>
										 -->
										 
										 <!-- 
										 <c:if test="${dto.optionCount==2}">
											${dto.optionName} : ${dto.optionValue} / 
											${dto.optionName2} : ${dto.optionValue2}
										</c:if>
										  -->
										
											색상 : 그레이 / 
											사이즈 : M
										
									</div>
									
									<!-- 
									<input type="hidden" name="productNums" value="${dto.productNum}">
									<input type="hidden" name="detailNums" value="${empty dto.detailNum ? 0 : dto.detailNum}">
									<input type="hidden" name="detailNums2" value="${empty dto.detailNum2 ? 0 : dto.detailNum2}">
									<input type="hidden" name="stockNums" value="${dto.stockNum}">
									<input type="hidden" name="buyQtys" value="${dto.qty}">
									<input type="hidden" name="productMoneys" value="${dto.productMoney}">
									<input type="hidden" name="prices" value="${dto.price}">
									<input type="hidden" name="salePrices" value="${dto.salePrice}">
									<input type="hidden" name="savedMoneys" value="${dto.savedMoney}">
									 -->
								</td>
								<td class="content-point " width="90" >
									<fmt:formatNumber value=""/>2,000원
								</td>
								<td class="content-qty" width="90">
									1
								</td>
								<td class="discount-price" width="110">
									<fmt:formatNumber value=""/>20,000원
								</td>
								<td class="product-price" width="110">
									<div class="discounted-price">
										<label>
											<fmt:formatNumber value=""/>39,900원
										</label>
									</div>
									<div class="original-price">
										<label>
											<fmt:formatNumber value=""/>59,900원
										</label>								
									</div>
								</td>
								<td class="total-price" width="110">
									<label>
										<fmt:formatNumber value=""/>39,900원
									</label>
								</td>
							</tr>
						
					</table>
					
					
					<!-- 
					<input type="hidden" name="orderNum" value="${productOrderNumber}">
					<input type="hidden" name="totalMoney" value="${totalMoney}">
					<input type="hidden" name="deliveryCharge" value="${deliveryCharge}">
					<input type="hidden" name="payment" value="${totalPayment}">
	
					<input type="hidden" name="mode" value="${mode}">
	
					<input type="hidden" name="payMethod" value="">
					<input type="hidden" name="cardName" value="">
					<input type="hidden" name="authNumber" value="">
					<input type="hidden" name="authDate" value="">
					 -->
					 
					
					<div class="destination-info">
						<div class="destination-title">배송지 정보</div>
						<button type="button" class="btn"> 배송지변경 </button>
					</div>
					
					<div class="destinaion">
						<div class="destination-name">
							<div>
								<label class="mem-name">김자바</label>
								<label class="mem-tel">010-1111-1111</label>
							</div>
							
						</div>
						<div class="destination-addr">
							<div class="title-gray">배송지</div>
							<div>서울특별시 마포구 월드컵북로 21 풍성빌딩 2층</div>
						</div>
						<div class="destination-memo">
							<div class="title-gray">요청사항</div>
							<div>
								<input type="hidden" name="recipientName" value="김자바">
								<input type="hidden" name="tel" value="010-1111-2222">
								<input type="hidden" name="zip" value="111-111">
								<input type="hidden" name="addr1" value="서울특별시 마포구 월드컵북로">
								<input type="hidden" name="addr2" value="21 풍성빌딩 2층">
								<input type="text" name="destMeno" class="form-control memo-input" placeholder="요청사항을 입력하세요.">
							</div>
						</div>
						
					</div>
					
					<div class="point">
						<div class="point-title">포인트</div>
						<div class="point-content">
							<div class="point-detail title-gray">포인트</div>
							<input type="number" class="form-control point-input" name="usedSaved" min="0" max="0" placeholder="0">
							<button type="button" class="input-group-text btn-usedSaved point-btn" data-balance="0">전액사용</button>
							<div class="point-own">(보유 <fmt:formatNumber value=""/>0원)</div>
						</div>
						
					</div>				
					
					<div class="price">
						<div class="price-title">결제금액</div>
						<div class="price-content price-totalMain">
							<label class="price-total title-gray">총 결제금액 </label>
							<label class="product-totalAmount">
								<fmt:formatNumber value=""/>42,900원
							</label>
						</div>
						<div class="price-content">
							<label class="price-product title-gray">상품금액 </label>
							<label>
								<fmt:formatNumber value=""/>39,900원
							</label>
						</div>
						<div class="price-content">
							<label class="price-delFee title-gray">배송비 </label>
							<label>
								<fmt:formatNumber value=""/>3,000원
							</label>
						</div>
						<div class="price-content price-usingPoint">
							<label class="price-usePoint title-gray">포인트사용액 </label>
							<label class="point-usedSaved">
								0원
							</label>
						</div>
					</div>
					
					<div class="saving-point">
						<div class="price-content">
							<label class=" price-pointSave title-gray">포인트 적립 </label>
							<label class="">
								<fmt:formatNumber value=""/>2,000원
							</label>
						</div>
					</div>
					
					<div class="buttons">
						
						<div>
							
							<button type="button" class="buttons-btn complete-btn" onclick="sendOk()">결제하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>