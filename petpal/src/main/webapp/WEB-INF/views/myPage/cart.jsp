<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">

$(function(){
	let cartSize = "${list.size()}";
	if(cartSize!=="" && cartSize!=="0") {
		$(".cart-chkAll").prop("checked", true);
		$("form input[name=nums]").prop("checked", true);
	}
	
    $(".cart-chkAll").click(function() {
    	$("form input[name=nums]").prop("checked", $(this).is(":checked"));
    });
});

function sendOk() {
	const f = document.cartForm;
	
	let count = $("form input[name=nums]:checked").length;
	if(count === 0) {
		alert("상품을 선택하세요");
		return;
	}
	
	let b = true;
	$("form input[name=nums]").each(function(index, item) {
		if($(this).is(":checked")) {
			let totalStock = Number($(this).attr("data-totalStock"));
			let $tr = $(this).closest("tr");
			let amount = Number($tr.find("input[name=buyAmounts]").val());
			if(amount > totalStock) {
				b = false;
				return false;
			}
		}
	});
	
	if(! b) {
		alert('재고가 부족합니다');
		return false;
	}
	
	$("form input[name=nums]").each(function(index, item) {
		if(!$(this).is(":checked")) {
			$(this).closest("tr").remove();
		}
	});
	
	f.action = "${pageContext.request.contextPath}/order/${sessionScope.species}/payment";
	f.submit();
}

function deleteSelect() {
	let count = $("form input[name=nums]:checked").length;
	if(count === 0) {
		alert("카트에서 삭제할 상품을 선택하세요");
		return;
	}
	
	if(! confirm('선택한 상품을 카트에서 삭제하겠습니까?')) {
		return;
	}
	
	const f = document.cartForm;
	f.action = "${pageContext.request.contextPath}/myPage/${sessionScope.species}/deleteSelectCart";
	f.submit();
}

function deleteOne(stockNum) {
	location.href = '${pageContext.request.contextPath}/myPage/${sessionScope.species}/deleteOne?stockNum=' + stockNum;	
}


$(function() {
	$(".btnMinus").click(function(){
		const $tr = $(this).closest("tr");
		let amount = Number($tr.find("input[name=buyAmounts]").val()) || 1;
		let priceOrig = Number($tr.find("input[name=priceOrig]").val()) || 0;
		let discountAmount = Number($tr.find("input[name=discountAmount]").val()) || 0;
		let priceDiscount = Number($tr.find("input[name=priceDiscounts]").val()) || 0;
		
		if(amount <= 1) {
			return false;
		}
		
		amount--;
		$tr.find("input[name=buyAmounts]").val(amount);
		let total = (priceOrig-discountAmount) * amount;
		
		$tr.find(".priceDiscounts").text(total.toLocaleString());
		$tr.find("input[name=priceDiscounts]").val(total);
		
        const stockNum = $tr.find("input[name=nums]").val();
        updateCart(stockNum, amount);
	});

	$(".btnPlus").click(function(){
		const $tr = $(this).closest("tr");
		let totalStock = Number($tr.find("input[name=nums]").attr("data-totalStock"));
		
		let amount = Number($tr.find("input[name=buyAmounts]").val()) || 1;
		let priceOrig = Number($tr.find("input[name=priceOrig]").val()) || 0;
		let discountAmount = Number($tr.find("input[name=discountAmount]").val()) || 0;
		let priceDiscount = Number($tr.find("input[name=priceDiscounts]").val()) || 0;
		
		if(totalStock <= amount) {
			alert("상품 재고가 부족 합니다.");
			return false;
		}
		
		if(amount >= 99) {
			return false;
		}
		
		amount++;
		$tr.find("input[name=buyAmounts]").val(amount);
		let total = (priceOrig-discountAmount) * amount;
		
		$tr.find(".priceDiscounts").text(total.toLocaleString());
		$tr.find("input[name=priceDiscounts]").val(total);
		
        const stockNum = $tr.find("input[name=nums]").val();
        updateCart(stockNum, amount);
	});	
	
	
});

function updateCart(stockNum, amount) {
    $.ajax({
        url: '${pageContext.request.contextPath}/myPage/${sessionScope.species}/updateCart',
        type: 'POST',
        data: {
            stockNum: stockNum,
            amount: amount
        },
        success: function(response) {
        },
        error: function(xhr, status, error) {
        }
    });
}

</script>

<div class="container">
	<div class="body-container">	
		<div class="body-container2">
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
									<button type="button" class="btn cart-deleteCheck" onclick="deleteSelect();">선택삭제</button>	
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
							<c:choose>
								<c:when test="${list.size() == 0}">
									<tr valign="middle">
										<td colspan="7">
											장바구니가 비어있습니다.
										</td>
									</tr>
								</c:when>
								<c:otherwise>							
									<c:forEach var="dto" items="${list}">
										<tr valign="middle">
											<td width="30">&nbsp;</td>
											<td class="content-check" width="35">
												<input type="checkbox" class="form-check-input" name="nums" value="${dto.stockNum}" 
														data-totalStock="${dto.totalStock}" ${dto.totalStock == 0 ? "disabled":""} >
											</td>
											<td class="content-img" width="120">
												<img width="65" height="65" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
											</td>
											<td class="content-info" width="400">
												<p class="product-title">${dto.productName}</p>
												<p class="product-options">
													<c:if test="${dto.optionCount == 1}">
														선택사항 : ${dto.optionValue}
													</c:if>
													<c:if test="${dto.optionCount == 2}">
														선택사항 : ${dto.optionValue}, ${dto.optionValue2}
													</c:if>
												</p>
												
												<input type="hidden" name="productNums" value="${dto.productNum}">
												<input type="hidden" name="stockNums" value="${dto.stockNum}">
												
											</td>
											<td class="content-qty" width="240">
												<div class="d-flex">
													<button type="button" class="btn btnMinus"><i class="bi bi-dash"></i></button>
													<input type="text" name="buyAmounts" value="${dto.amount}" readonly class="form-control" style="width: 40px; text-align: center;">
													<button type="button" class="btn btnPlus"><i class="bi bi-plus"></i></button>
												</div>
											</td>
											
											<td class="content-disounted" width="110">
												<label class="priceDiscounts"><fmt:formatNumber value="${dto.pricePay}"/></label><label>원</label>
												<input type="hidden" name="priceDiscounts" value="${dto.priceDiscount}">
												<input type="hidden" name="priceOrig" value="${dto.priceOrig}">
												<input type="hidden" name="discountAmount" value="${dto.discountAmount}">
											</td>
											
											<td class="content-delete" width="140">
												<button type="button" class="btn cart-delete" onclick="deleteOne('${dto.stockNum}')"><i class="bi bi-x"></i></button>
											</td>
										</tr>
									</c:forEach>	
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					
					 
					<div class="buttons">
						<input type="hidden" name="mode" value="cart">
						<button type="button" class="btn go-main" style="width: 200px;" onclick="location.href='${pageContext.request.contextPath}/';"> 쇼핑 계속하기 </button>
						<button type="button" class="btn select-buy-btn" style="width: 200px;" onclick="sendOk();"> 선택상품 구매하기 </button>
					</div>
					
				</form>
				
				
			</div>
		</div>
	</div>
</div>
