<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

.body-container {
	max-width: 1000px;
	margin: 40px auto;
}

.body-title {
	margin-bottom: 15px;
	border: none;
}

.body-title h3 {
	border: none;
}

.body-main {
	border-top: 3px solid #BDBDBD;
	padding-top: 8px;
}

.select-cart {
	display: flex;
}

.cart-deleteCheck {
	background-color: white;
	padding: 5px 10px;
	border: 1px solid #A6A6A6;
	border-radius: 5px;
	margin-left: 5px;
}

tbody{
	border-bottom: px solid #BDBDBD;
	margin-bottom: 10px;
}

.table th {
	text-align: center;
	font-size: 15px;
	color: #A6A6A6;
	font-weight: normal;
}

input[type=checkbox] {
	cursor: pointer;
}

.cart-deleteCheck {
	font-size: 13px;
	margin-bottom: 3px;
}

.table td {
	text-align: center;
	padding-top: 13px;
}

.content-info {
	padding-left: 10px;
	margin-top: 5px;
}

.content-info .product-title {
	margin-top: 15px;
}

.content-info .product-options {
	margin-bottom: 15px;
	font-size: 11px;
	color: #BDBDBD;
}

.product-title, .product-options {
	margin-bottom: 2px;
}

.btnMinus {
	margin-left: 60px;
}

.btnPlus, .btnMinus {
	border: none;
	background: rgba(0, 0, 0, 0);
	font-size: 25px;
}

.content-delete .cart-delete {
	border: none;
	background: rgba(0,0,0,0);
	font-size: 20px;
}

.buttons {
	text-align: center;
	padding-top: 35px;
}

.go-main {
	border: 1px solid #BDBDBD;
}

.select-buy-btn {
	background-color: #E4B075;
	padding: 8px 10px;
	border: none;
	border-radius: 5px;
	margin-left: 5px;
	font-size: 15px;
	color: white;

}
.order-price {
	margin-top: 80px;
	font-size: 18px;
	font-weight: bold;
}

.cal-title {
	padding: 20px 100px;
	font-size: 15px;
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
	border-top: 3px solid #BDBDBD;
	border-bottom: 1px solid #BDBDBD;
	color: #A6A6A6;
}

.cal-content {
	padding: 20px 100px;
	font-size: 18px;
	font-weight: bold;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.form-control {
	border: none;
}

.oper {
	font-size: 24px;
	font-weight: normal;
}

.total-price {
	color: #E4B075;
}

</style>


<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3>장바구니 </h3>
		</div>
		
		
		<div class="body-main">
			
			<form name="cartForm" method="post">
				<table class="table cart-list">
					<thead>
						<tr valign="middle">
							<th width="30">&nbsp;</th>
							<th width="35">
								<input type="checkbox" class="form-check-input cart-chkAll" name="chkAll">
							</th>
							<th width="120">
								<button type="button" class="btn cart-deleteCheck" onclick="deleteCartSelect();">선택삭제</button>	
							</th>
							<th width="400">
								상품정보
							</th>
							<th width="240">수량</th>
							<th width="110">상품가격</th>
							<th width="140">삭제</th>
						</tr>
					</thead>
					<tbody>
						
							<tr valign="middle">
								<td width="30">&nbsp;</td>
								<td class="content-check" width="35">
									<input type="checkbox" class="form-check-input" name="nums" value="" 
											data-totalStock="" >
								</td>
								<td class="content-img" width="120">
									<img width="65" height="65" src="${pageContext.request.contextPath}/uploads/product/product_detail.jpg">
								</td>
								<td class="content-info" width="400">
									<p class="product-title">쁘리엘르 몰리 카시트 그레이</p>
									<p class="product-options">
										<!-- 
										<c:if test="${dto.optionCount == 1}">
											선택사항 : ${dto.optionValue}
										</c:if>
										<c:if test="${dto.optionCount == 2}">
											선택사항 : ${dto.optionValue}, ${dto.optionValue2}
										</c:if>
										<c:if test="${dto.totalStock <= 5}">
											&nbsp;&nbsp;&nbsp;재고 : ${dto.totalStock}
										</c:if>
										 -->
										 색상 : 그레이 / 사이즈 : S
									</p>
									<!-- 
									<input type="hidden" name="productNums" value="${dto.productNum}">
									<input type="hidden" name="stockNums" value="${dto.stockNum}">
									 -->
								</td>
								<td class="content-qty" width="240">
									<div class="d-flex">
										<button type="button" class="btn btnMinus">-</button>
										<input type="text" name="buyQtys" value="1" readonly class="form-control" style="width: 40px; text-align: center;">
										<button type="button" class="btn btnPlus">+</button>
									</div>
								</td>
								
								<td class="content-disounted" width="110">
									<label><fmt:formatNumber value=""/></label><label>39,900원</label>
									<input type="hidden" name="salePrices" value="">
								</td>
								
								<td class="content-delete" width="140">
									<button type="button" class="btn cart-delete" onclick="deleteCartItem()">x</button>
								</td>
							</tr>
					</tbody>
				</table>
				
				
				<!-- 
				<c:choose>
					<c:when test="${list.size() == 0}">
						<div class="">
							등록된 상품이 없습니다.
						</div>
					</c:when>
					<c:otherwise>
						<div class="">
							<input type="hidden" name="mode" value="cart">
							<button type="button" class="btn select-buy-btn" style="width: 200px;" onclick="sendOk();"> 선택상품 구매하기 </button>
						</div>
					</c:otherwise>
				</c:choose>
				 -->
				 
				 
				 <div>
				 	<div class="order-price">주문예정금액</div>
				 	<div class="cal-title">
				 		<div>&nbsp;상품금액</div>
				 		<div>&nbsp;&nbsp;&nbsp;할인금액</div>
				 		<div>&nbsp;&nbsp;배송비</div>
				 		<div>&nbsp;총 주문 금액</div>
				 	</div>
				 	<div class="cal-content">
				 		<div>59,900원</div>
				 		<div class="oper">-</div>
				 		<div>20,000원</div>
				 		<div class="oper">+</div>
				 		<div>0원</div>
				 		<div class="oper">=</div>
				 		<div class="total-price">39,900원</div>
				 	</div>
				 </div>
				 
				<div class="buttons">
					<button type="button" class="btn go-main" style="width: 200px;" onclick="location.href='${pageContext.request.contextPath}/';"> 쇼핑 계속하기 </button>
					<button type="button" class="btn select-buy-btn" style="width: 200px;" onclick="sendOk();"> 선택상품 구매하기 </button>
				</div>
			</form>
			
			
		</div>
	</div>
</div>
