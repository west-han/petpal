<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

.body-container {
	max-width: 1000px;
	margin: 0 auto;
	font-size: 15px;
}

.body-title {
	margin-top: 60px;
	margin-bottom: 50px;
	font-size: 25px;
}

.destinaion, .point, .price, .saving-point .buttons {
	margin-top: 20px;
}

.md-img {
	width: 75px; height: 75px;
}

.order-product {
	margin-top: 20px;
	font-size: 18px;
	font-weight: bold;

}

.order-product-top {
	margin-top: 10px;
	margin-bottom: 15px;
	height: 3px;
	background-color: #A6A6A6;
	border: none;
}

.order-product-bottom {
	margin: 15px 0;
	height: 1px;
	background-color: #BDBDBD;
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

.destination-info-top {
	margin: 10px 0;
	height: 3px;
	background-color: #A6A6A6;
	border: none;
}

.destination-info .btn {
	padding: 0 15px;
	height: 40px;
	margin-left: 30px;
	background: white;
	border: 1px solid #A6A6A6;
	border-radius: 5px;
	font-size: 14px;
}

table {
    width: 100%;
    border-collapse: collapse;

}

.order-title th {
	color: #BDBDBD;
	font-size: 18px;
}

.order-content img {
	margin-left: 20px;
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
	padding-left: 20px;
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
}

.point-title, .price-title {
	border-bottom: 3px solid #A6A6A6;
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 10px;
	margin-top: 50px;
}

.destinaion .destination-name {
	margin-bottom: 10px;
}

.destination-name .mem-name, .destination-name .mem-tel {
	font-weight: bold;
}

.destinaion .destination-name, .destinaion .destination-addr, .destination-memo {
	display: flex;
}

.destinaion .mem-name, .destination-addr div:first-child  {
	margin-right: 50px;
}

.destinaion .mem-name, .destination-addr, .destination-memo  {
	padding-top: 10px;

}

.destination-memo div:first-child {
	margin-right: 35px;
}

.memo-input {
	border: none;
	border-bottom: 1px solid #BDBDBD;
}

.destinaion .btn {
	padding: 5px 10px;
	background-color: white;
}

.point-content {
	display: flex;
	margin-top: 10px;
}

.point-content div {
	display: flex;
	align-items: center;
}

.point-detail {
	margin-right: 50px;
}

.point-input {
	margin-right: 20px;
	border: none;
}

.point-btn {
	margin-right: 30px;
	background: white;
	padding: 5px 10px;
	border-radius: 5px;
}

.price .price-content {
	margin-top: 10px; 
}

.price .price-usingPoint {
	margin-bottom: 10px;
}

.price .price-total {
	margin-top: 10px; 
	margin-right: 32px;
}

.price .price-product {
	margin-right: 50px;
}

.price .price-delFee {
	margin-right: 68px;
}

.price .price-usePoint {
	margin-right: 25px;
}

.price .price-pointSave {
	margin-right: 30px;
}

.price-pointSave {
	margin-bottom: 10px;
}


</style>

<div>
	<div class="body-container">	
		<div class="body-title">
			<h3> 주문하기 </h3>
		</div>
		
		<div>
			<div class="order-product">주문 상품</div>
			<hr class="order-product-top">
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
										사이즈 : S
									
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
							<td class="content-point" width="90" >
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
				<hr class="order-product-bottom">
				
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
				<hr class="destination-info-top">
				<div class="destinaion">
					<div class="destination-name">
						<div>
							<label class="mem-name">김자바</label>
							<label class="pt-2 mem-tel">010-1111-1111</label>
						</div>
						
					</div>
					<div class="ps-2 pt-2 mt-2 destination-addr">
						<div>배송지</div>
						<div class="pt-2">서울특별시 마포구 월드컵북로 21 풍성빌딩 2층</div>
					</div>
					<div class="destination-memo">
						<div>요청사항</div>
						<div class="pt-2">
							<input type="hidden" name="recipientName" value="김자바">
							<input type="hidden" name="tel" value="010-1111-2222">
							<input type="hidden" name="zip" value="111-111">
							<input type="hidden" name="addr1" value="서울특별시 마포구 월드컵북로">
							<input type="hidden" name="addr2" value="21 풍성빌딩 2층">
							<input type="text" name="destMeno" class="form-control memo-input" style="border:none" placeholder="요청사항을 입력합니다.">
						</div>
					</div>
					
				</div>
				
				<div class="point">
					<div class="fs-6 fw-semibold border-bottom pb-1 point-title">포인트</div>
					<div class="ps-2 pt-2 point-content">
						<div class="point-detail">포인트</div>
						<input type="number" class="form-control point-input" name="usedSaved" value="0" min="0" max="0">
						<button type="button" class="input-group-text btn-usedSaved point-btn" data-balance="0">전액사용</button>
						<div class="point-own">( 보유 <fmt:formatNumber value=""/>0원 )</div>
					</div>
					
				</div>				
				
				<div class="price">
					<div class="price-title">결제금액</div>
					<div>
						<label class="price-content price-total">총 결제금액 </label>
						<label class="product-totalAmount">
							<fmt:formatNumber value=""/>42,900원
						</label>
					</div>
					<div class="price-content">
						<label class="price-product">상품금액 </label>
						<label>
							<fmt:formatNumber value=""/>39,900원
						</label>
					</div>
					<div class="price-content">
						<label class="price-delFee">배송비 </label>
						<label>
							<fmt:formatNumber value=""/>3,000원
						</label>
					</div>
					<div class="price-content price-usingPoint">
						<label class="price-usePoint">포인트사용액 </label>
						<label class="point-usedSaved">
							0원
						</label>
					</div>
				</div>
				
				<div class="saving-point">
					<div>
						<label class="price-content price-pointSave">포인트 적립 </label>
						<label class="price-content">
							<fmt:formatNumber value=""/>2,000원
						</label>
					</div>
				</div>
				
				<div class="buttons">
					<button type="button" class="btn btn-primary btn-lg" style="width: 250px;" onclick="sendOk()">결제하기</button>
					<button type="button" class="btn btn-light btn-lg" style="width: 250px;" onclick="location.href='${pageContext.request.contextPath}/';">결제취소</button>
				</div>
			</form>
		</div>
	</div>
</div>