<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<script type="text/javascript">
function sendOk() {
	const f = document.paymentForm;
	
	if(! f.recipientName.value) {
		alert("이름을 입력하세요.");
		return;
	}
	
	if(! f.tel.value) {
		alert("전화번호를 입력하세요.");
		return;
	}
	
	if(! /^\d+$/.test(f.tel.value)) {
		alert("전화번호는 숫자만 입력할 수 있습니다.");
		return;
	}
	
	if(! f.postalCode.value) {
		alert("배송지를 입력하세요.");
		return;
	}
	
	if(! f.address1.value) {
		alert("배송지를 입력하세요.");
		return;
	}
	
	if(! /^\d+$/.test(f.usedPoint.value)) {
		alert("포인트는 숫자만 입력할 수 있습니다.");
		return;
	}

	let balance = Number($('.btn-usedPoint').attr('data-balance')) || 0;
	let usedPoint = Number(f.usedPoint.value);

	if(usedPoint > balance) {
		alert("포인트가 부족합니다");
		return;
	}
	
	let p = Number(f.payment.value) - usedPoint;  
	f.payment.value = p;
	

	
	let payClassify = 0;
	let cardName = "삼성카드";
	let authNumber = "12493645998";
	let authDate = "";
	authDate = new Date().toISOString().replace('T', ' ').slice(0, -5);

	f.payClassify.value = payClassify;
	f.cardName.value = cardName;
	f.authNumber.value = authNumber;
	f.authDate.value = authDate;
	
	f.action = "${pageContext.request.contextPath}/order/paymentOk";
    f.submit();
}


$(function(){
	$('.btn-usedPoint').click(function(){
		const f = document.paymentForm;
		
		let balance = Number($(this).attr('data-balance')) || 0;
		f.usedPoint.value = balance;
		
		let totalPayment = Number(f.payment.value) - balance;
		
		$('.product-totalAmount').text(totalPayment.toLocaleString()+'원');
		$('.point-usedPoint').text(balance.toLocaleString()+'원');
	});
	
	$('form[name=paymentForm] input[name=usedPoint]').on('keyup mouseup', function() {                                                                                                                     
		const f = document.paymentForm;
		let balance = Number($('.btn-usedPoint').attr('data-balance')) || 0;
		let usedPoint = Number(f.usedPoint.value);
		
		if(usedPoint > balance) {
			usedPoint = balance;
			f.usedPoint.value = balance;
		}
		
		let totalPayment = Number(f.payment.value) - usedPoint;
		
		$('.product-totalAmount').text(totalPayment.toLocaleString()+'원');
		$('.point-usedPoint').text(usedPoint.toLocaleString()+'원');
	});
});
</script>

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
							<th width="90">수량</th>
							<th width="120">할인금액</th>
							<th width="120">상품금액</th>
							<th width="120">총금액</th>
						</tr>
						
						<c:forEach var="dto" items="${listProduct}" varStatus="status">
							<tr class="order-content" valign="middle">
								<td width="120">
									<img class="md-img" 
									src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
								</td>
								<td class="product-info" width="200">
									<div class="content-title">${dto.productName}</div>
									<div class="content-option">
										
										<c:if test="${dto.optionCount==1}">
											${dto.optionName} : ${dto.optionValue}
										</c:if>
										
										 <c:if test="${dto.optionCount==2}">
											${dto.optionName} : ${dto.optionValue} / 
											${dto.optionName2} : ${dto.optionValue2}
										</c:if>
										
									</div>
									
									<input type="hidden" name="productNums" value="${dto.productNum}">
									<input type="hidden" name="detailNums" value="${empty dto.detailNum ? 0 : dto.detailNum}">
									<input type="hidden" name="detailNums2" value="${empty dto.detailNum2 ? 0 : dto.detailNum2}">
									<input type="hidden" name="stockNums" value="${dto.stockNum}">
									<input type="hidden" name="buyAmounts" value="${dto.amount}">
									<input type="hidden" name="pricePays" value="${dto.pricePay}">
									<input type="hidden" name="priceOrigs" value="${dto.priceOrig}">
									<input type="hidden" name="priceDiscounts" value="${dto.priceDiscount}">
									<input type="hidden" name="totalPrices" value="${dto.totalPrice}">
									<input type="hidden" name="point" value="${dto.totalSavePoint}">
									
								</td>
								<td class="content-qty" width="90">
									${dto.amount}
								</td>
								<td class="discount-price" width="110">
									<fmt:formatNumber value="${dto.discountAmount}"/>원
								</td>
								<td class="product-price" width="110">
									<div class="discounted-price">
										<label>
											<fmt:formatNumber value="${dto.totalPrice}"/>원
										</label>
									</div>
									<c:if test="${dto.discountAmount > 0}">
										<div class="original-price">
											<label>
												<fmt:formatNumber value="${dto.priceOrig}"/>원
											</label>								
										</div>
									</c:if>
								</td>
								<td class="total-price" width="110">
									<label>
										<fmt:formatNumber value="${dto.pricePay}"/>원
									</label>
								</td>
							</tr>
						</c:forEach>
					</table>
					
					<input type="hidden" name="orderNum" value="${productOrderNumber}">
					<input type="hidden" name="totalMoney" value="${totalMoney}">
					<input type="hidden" name="deliveryCharge" value="${deliveryCharge}">
					<input type="hidden" name="payment" value="${totalPayment}">
					<input type="hidden" name="mode" value="${mode}">
					<input type="hidden" name="payClassify" value="">
					<input type="hidden" name="cardName" value="">
					<input type="hidden" name="authNumber" value="">
					<input type="hidden" name="authDate" value="">
					
					<div class="destination-info">
						<div class="destination-title">배송지 정보</div>
						<button type="button" class="btn " data-bs-toggle="modal" data-bs-target="#addAddressModal"> 배송지 변경 </button>
					</div>
					
					<div class="destinaion">
						<div class="destination-name">
							<div>
								<label class="name-title title-gray">받는사람*</label>
								<input type="text" name="recipientName" class="recipientName">
							</div>
							
						</div>
						<div class="destination-tel">
							<div>
								<label class="tel-title title-gray">전화번호*</label>
								<input type="text" name="tel" class="tel">
							</div>
							
						</div>
						<div class="destination-addr">
							<div class="d-flex mb-3">
								<div class="title-gray addr-title">배송주소*</div>
								<input type="text" name="postalCode" placeholder="지번 또는 도로명주소" class="postalCode" readOnly>
								<button type="button" onclick="daumPostcode()" class="postalCode-btn btn"> 우편번호 검색 </button>
							</div>
							<input type="text" name="address1" placeholder="기본주소" class="addr1 mb-3 w-50" readOnly>
							<input type="text" name="address2" placeholder="상세주소" class="addr2 w-50">
						</div>
						<div class="destination-note">
							<div class="title-gray note-title">요청사항</div>
							<div>
								<input type="text" name="note" class="form-control note-input" placeholder="요청사항을 입력하세요.">
							</div>
						</div>
						
					</div>
					
					<div class="point">
						<div class="point-title">포인트</div>
						<div class="point-content">
							<div class="point-detail title-gray">포인트</div>
							<input type="number" class="form-control point-input" name="usedPoint" min="0" max="${empty userPoint ? 0 : userPoint.balance}">
							<button type="button" class="input-group-text btn-usedPoint point-btn" data-balance="${empty userPoint ? 0 : userPoint.balance}">전액사용</button>
							<div class="point-own">(보유 <fmt:formatNumber value="${empty userPoint ? 0 : userPoint.balance}"/>원)</div>
						</div>
						
					</div>				
					
					<div class="price">
						<div class="price-title">결제금액</div>
						<div class="price-content price-totalMain">
							<label class="price-total title-gray">총 결제금액 </label>
							<label class="product-totalAmount">
								<fmt:formatNumber value="${totalPayment}"/>원
							</label>
						</div>
						<div class="price-content">
							<label class="price-product title-gray">상품금액 </label>
							<label>
								<fmt:formatNumber value="${totalMoney}"/>원
							</label>
						</div>
						<div class="price-content">
							<label class="price-delFee title-gray">배송비 </label>
							<label>
								<fmt:formatNumber value="${deliveryCharge}"/>원
							</label>
						</div>
						<div class="price-content price-usingPoint">
							<label class="price-usePoint title-gray">포인트사용액 </label>
							<label class="point-usedPoint">
								0원
							</label>
						</div>
					</div>
					
					<div class="saving-point">
						<div class="price-content">
							<label class=" price-pointSave title-gray">포인트 적립 </label>
							<label class="">
								<fmt:formatNumber value="${totalSavePoint}"/>원
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

<div class="modal fade" id="addAddressModal" tabindex="-1" aria-labelledby="addAddressModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAddressModalLabel">배송지 변경</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="listAddressForm" name="listAddressForm">
                	<c:choose>
                		<c:when test="${empty memberDest}">
                			<div>등록된 배송지가 없습니다</div>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="dto" items="${memberDest}">
		                    	<div class="modalList-box">
		                    		<c:if test="${dto.defaultDest == 0}">
		                    			<p class="text-center default-title"><i class="bi bi-caret-right-fill"></i>기본배송지<i class="bi bi-caret-left-fill"></i></p>
		                    		</c:if>
			                        <div class="d-flex">
			                        	<div class="w-75 d-flex">
				                            <label class="list-title recip-title d-flex align-items-center">받는사람</label>
				                            <label for="recipientName" class="form-control" id="recipientName">${dto.recipientName}</label>
			                            </div>
			                            <div class="w-25 d-flex justify-content-end">
			                            	<button type="button" class="modal-select-btn" data-recipientName="${dto.recipientName}" data-tel="${dto.tel}" data-postalCode="${dto.postalCode}" data-address1="${dto.address1}" data-address2="${dto.address2}" data-note="${dto.note}">선택</button>
			                        	</div>
			                        </div>
			                        <div class="row">
			                        	<label class="list-title d-flex align-items-center">전화번호</label>
			                            <label for="tel" class="form-control" id="tel">${dto.tel}</label>
			                        </div>
			                        <div class="row">
			                        	<label class="list-title d-flex align-items-center">배송주소</label>
			                            <label class="w-25 form-control" for="postalCode" id="postalCode">${dto.postalCode}</label>
			                        </div>
			                        <div class="row">
			                            <label class="col-sm-2 col-form-label form-control" for="address1" id="address1">${dto.address1}</label>
			                            <label class="col-sm-2 col-form-label form-control" for="address2" id="address2">${dto.address2}</label>
			                        </div>
			                        
			                        <input type="hidden" id="defaultDestHidden" name="defaultDestHidden">
			                        
			                        <div class="row">
			                        	<label class="list-title d-flex align-items-center">배송메모</label>
			                            <label for="note" class="form-control" id="note">${dto.note}</label>
			                        </div>
		                        </div>
		                    </c:forEach>
                		</c:otherwise>
                	</c:choose>
                    
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).on('click', '.modal-select-btn', function() {
    const recipientName = $(this).data('recipientname');
    const tel = $(this).data('tel');
    const postalCode = $(this).data('postalcode');
    const address1 = $(this).data('address1');
    const address2 = $(this).data('address2');
    const note = $(this).data('note');
    
    $('input[name="recipientName"]').val(recipientName);
    $('input[name="tel"]').val(tel);
    $('input[name="postalCode"]').val(postalCode);
    $('input[name="address1"]').val(address1);
    $('input[name="address2"]').val(address2);
    $('input[name="note"]').val(note);
    
    $('#addAddressModal').modal('hide');
});


</script>

<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            let roadAddr = data.roadAddress;
            let jibunAddr = data.jibunAddress;

            document.querySelector('input[name="postalCode"]').value = data.zonecode;
            document.querySelector('input[name="address1"]').value = roadAddr || jibunAddr;
            document.querySelector('input[name="address2"]').focus();
        }
    }).open();
}
</script>
