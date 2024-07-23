<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}


function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method,
			data: formData,
			dataType: dataType,
			success: function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function() {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리를 실패했습니다.');
					return false;
				}
				
				console.log(jqXHR.responseText);
				
			}
	};
	
	if(file) {
		settings.processData = false;
		settings.contentType = false;
	}
	
	$.ajax(url, settings);
}

</script>

<script type="text/javascript">
$(function() {
	const productNum = '${dto.productNum}';
	const optionCount = ${dto.optionCount};
	
	if(optionCount === 0) {
		let stockNum = '${dto.stockNum}';
		let totalStock = '${dto.totalStock}';
		let totalPrice = '${dto.totalPrice}';
		$('.order-area').attr('data-totalStock', totalStock);
		
		buyQuant(stockNum, totalPrice, 0, 0);
	}
	
	$(".requiredOption").change(function() {
		let detailNum = $(this).val();
		if(! detailNum) {
			return false;
		}
		
		let optionNum = $(".requiredOption").attr("data-optionNum");
		
		if(optionCount === 1) {
			let b = true;
			$(".order-area input[name=detailNums]").each(function() {
				let deNum = $(this).val();
				if(detailNum === deNum) {
					b = false;
					return false;
				}
			});
			
			if(! b) {
				return false;
			}
			
			let stockNum = $(".requiredOption :selected").attr("data-stockNum");
			let totalPrice = ${dto.totalPrice};
			
			buyQuant(stockNum, totalPrice, detailNum, 0);
			
			return false;
		}
		
		$(".requiredOption2 option").each(function() {
			if($(this).is(":first-child")) {
				return true;
			}
			
			$(this).remove();
		});
		
		let optionNum2 = $(".requiredOption2").attr("data-optionNum2");
		
		let url = "${pageContext.request.contextPath}/product/listOptionDetailStock";
		$.get(url, {productNum:productNum, detailNum:detailNum}, function(data) {
			$(data).each(function(index, item) {
				let detailNum = item.detailNum2;
				let optionValue = item.optionValue2;
				let stockNum = item.stockNum;
				let totalStock = parseInt(item.totalStock);
			});
		});
	});
	
	$(".requiredOption2").change(function() {
		if(! $(this).val()) {
			return false;
		}
		
		let detailNum = $(".requiredOption").val();
		let detailNum2 = $(this).val();
		
		let b = true;
		$(".order-area input[name=detailNums2]").each(function() {
			let deNum = $(this).closest(".input-group").find("input[name=detailNums]").val();
			let deNum2 = $(this).val();
			if(detailNum === deNum && detailNum2 === deNum2) {
				alert("이미 추가된 옵션입니다");
				$(".requiredOption").val("");
				$(".requiredOption").trigger("change");
				b = false;
				return false;
			}
		});
		if(! b) {
			return false;
		}
		
		let stockNum = $(".requiredOption2 :selected").attr("data-stockNum");
		let totalPrice = ${dto.totalPrice};
		
		buyQuant(stockNum, totalPrice, detailNum, detailNum2);
	});
	
	function buyQuant(stockNum, totalPrice, detailNum, detailNum2) {
		let paymentAmount = totalPrice.toLocaleString();
		
		let optionValue = '', optionValue2 = '';
		let selectOption = '';
		
		if(optionCount === 1) {
			optionValue = $('.requiredOption :selected').attr('data-optionValue');
			selectOption = optionValue;
		} else if(optionCount === 2) {
			optionValue = $('.requiredOption :selected').attr('data-optionValue');
			optionValue2 = $('.requiredOption2 :selected').attr('data-optionValue');
			selectOption = optionValue + ' / ' + optionValue2;
		}
		
		let out = '';
		out += '<div class="order-qty mt-4 d-flex justify-content-between w-100">';
		if(optionCount > 0) {
			out += '  <div class="mt-2 w-25">';
			out += '	<label class="fs-6">' + selectOption + '</label>';
			out += '  </div>';
			out += '  <div class="row mt-1 pb-2 w-75">';
		} else {
			out += '  <div class="row mt-1 pb-2 w-100">';
		}
		
		out += '    <div class="col">';
		out += '      <div class="input-group">';
		out += '        <i class="bi bi-dash input-group-text bg-white qty-minus rounded-circle"></i>';
		out += '        <input type="text" name="buyAmounts" class="form-control border border-0" value="1" style="flex:none; width: 60px; text-align: center;" readonly>';
		out += '        <input type="hidden" name="productNums" value="' + productNum + '">';
		out += '        <input type="hidden" name="stockNums" value="' + stockNum + '">';
		out += '        <input type="hidden" name="detailNums" value="' + detailNum + '" disabled>';
		out += '        <input type="hidden" name="detailNums2" value="' + detailNum2 + '" disabled>';
		out += '        <i class="stockNumsbi bi-plus input-group-text bg-white qty-plus rounded-circle"></i>';
		out += '      </div>';
		out += '    </div>';
		out += '    <div class="col text-end product-totalPrice" data-totalPrice="' + totalPrice + '">';
		out += '      <label class="pt-2 fs-6 fw-semibold item-paymentAmount">' + paymentAmount + '원</label>';
		
		if(optionCount > 0) {
			out += '	  <label class="pt-2 ps-1"><i class="bi bi-x qty-remove"></i></label>';
		}
		out += '    </div>';
		out += '  </div>';
		out += '</div>';
		
		$('.order-area').append(out);
		
		totalOrderPrice();
	}
	
	$(".order-area").on("click", ".qty-plus", function() {
		let totalStock = 0;
		if(optionCount == 0) {
			totalStock = parseInt($(".order-area").attr("data-totalStock"));
		} else if(optionCount === 1) {
			totalStock = parseInt($(".requiredOption :selected").attr("data-totalStock"));
		} else if(optionCount === 2) {
			totalStock = parseInt($(".requiredOption2 :selected").attr("data-totalStock"));
		}
		
		let order = $(this).closest(".order-qty");
		let amount = parseInt(order.find("input[name=buyAmounts]").val());
		
		if(amount >= totalStock) {
			alert("재고가 부족합니다. 다시 선택해주세요");
			return false;
		}
		
		amount++;
		order.find("input[name=buyAmounts]").val(amount);
		let totalPrice = order.find(".product-totalPrice").attr("data-totalPrice");
		let item = amount * totalPrice;
		let paymentAmount = item.toLocaleString();
		order.find(".item-paymentAmount").text(paymentAmount+"원");
		
		totalOrderPrice();
	});
	
	$(".order-area").on("click", ".qty-minus", function() {
		let order = $(this).closest(".order-qty");
		let amount = parseInt(order.find("input[name=buyAmounts]").val()) - 1;
		if(amount <= 0) {
			alert("수량을 한개 이상 선택해주세요");
			if(optionCount === 0) {
				return false;
			}
			
			$(".requiredOption").val("");
			$(".requiredOption").trigger("change");
			order.remove();
			
			totalOrderPrice();
			
			return false;
		}
		
		order.find("input[name=buyAmounts]").val(amount);
		let totalPrice = order.find(".product-totalPrice").attr("data-totalPrice");
		let item = amount * totalPrice;
		let paymentAmount = item.toLocaleString();
		order.find(".item-paymentAmount").text(paymentAmount + "원");
		
		totalOrderPrice();
	});
	
	$(".order-area").on("click", ".qty-remove", function() {
		if(optionCount === 0) {
			return false;			
		}
		
		let order = $(this).closest(".order-qty");
		$(".requiredOption").val("");
		$(".requiredOption").trigger("change");
		
		order.remove();
		
		totalOrderPrice();
	});
	
	function totalOrderPrice() {
		let totalAmount = 0;
		let paymentAmount = 0;
		$(".order-qty").each(function() {
			let amount = parseInt($(this).find("input[name=buyAmounts]").val());
			let totalPrice = parseInt($(this).find(".product-totalPrice").attr("data-totalPrice"));
			
			totalAmount += amount;
			paymentAmount += (totalPrice * amount);
		});
		
		let s = paymentAmount.toLocaleString();
		
		
		$(".product-totalAmount").text(s);
	}
	
});

$(function(){
	$(".sm-img img").click(function(){
		let url = $(this).attr("src");
		$(".lg-img img").attr("src", url);
	});
});

function sendOk(mode) {
	let totalAmount = 0;
	$(".order-qty").each(function(){
		let amount = parseInt($(this).find("input[name=buyAmounts]").val());
		
		totalAmount += amount;
	});
	
	if(totalAmount <= 0) {
		alert("상품 옵션을 선택하세요.");
		return;
	}

	const f = document.buyForm;
	
	if(mode === "buy") {
		f.method = "get";
		f.action = "${pageContext.request.contextPath}/order/payment";
	} else {
		if(! confirm("장바구니에 추가하시겠습니까? ")) {
			return false;
		}
		
		f.method = "post";
		f.action = "${pageContext.request.contextPath}/myPage/insertCart";		
	}
	
	f.submit();
}

</script>

<div class="container">
	<div class="body-container">
		<div class="body-container2">
			<div class="body-main">
				<div class="row mt-4 body-sep">
					<div class="body-left">
						<div>
							<div class="lg-img">
								<img class=""
									src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}"
									class="img-buy">
							</div>
						</div>
						<div class="imgs">
							<c:forEach var="vo" items="${listProductFile}">
								<div class="sm-img imgs-detail">
									<img
										src="${pageContext.request.contextPath}/uploads/product/${vo.fileName}"
										class="img-buy">
								</div>
							</c:forEach>
						</div>
					</div>

					<div class="body-right">
						<form name="buyForm">
							<c:if test="${dto.totalStock < 1}">
								<div class="stock">
									<label class="stock-msg">상품 재고가 없습니다.</label>
								</div>
							</c:if>	

							
							<div class="brand">
								<div>${dto.brand}</div>
							</div>

							<div class="productName">
								<div>${dto.productName}</div>
							</div>

							<div class="price">
								<c:if test="${dto.discountRate != 0}">
									<div class="discountRate me-2">${dto.discountRate}%</div>
								</c:if>

								<div class="ms-0">
									<label class="discounted-price">
										<fmt:formatNumber value="${dto.totalPrice}" />원
									</label> 
									<c:if test="${dto.discountRate != 0}">
										<label class="original-price"> 
											<fmt:formatNumber value="${dto.price}" />원
										</label>
									</c:if>

								</div>
							</div>

							<div class="delivery">
								<div>배송비</div>
								<div>
									<label> 
										<c:choose>
											<c:when test="${dto.totalPrice >= 20000}">
												무료배송											
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${dto.deliveryCharge}" />원
											</c:otherwise>
										</c:choose>
									</label> <label>(20,000원 이상 주문 시 무료배송)</label>
								</div>
							</div>

							<div class="point">
								<div>적립포인트</div>
								
								<c:choose>
									<c:when test="${dto.membershipNum == 1 }">
										<div>1% (${dto.savePoint}P)</div>
									</c:when>
									<c:when test="${dto.membershipNum == 2 }">
										<div>2% (${dto.savePoint}P)</div>
									</c:when>
									<c:when test="${dto.membershipNum == 3 }">
										<div>3% (${dto.savePoint}P)</div>
									</c:when>
									<c:otherwise>
										<div>4% (${dto.savePoint}P)</div>
									</c:otherwise>
								</c:choose>
								
							</div>

							
							<c:if test="${dto.optionCount > 0}">
								<div class="option">옵션 선택</div>
							</c:if>

							<c:if test="${dto.optionCount > 0}">
							    <div class="option-tab">
							        <select class="form-select requiredOption option-tab1" data-optionNum="${listProductOption[0].optionNum}">
							            <option>${listProductOption[0].optionName}</option>
							            <c:forEach var="vo" items="${listOptionDetail}">
							                <c:choose>
							                    <c:when test="${dto.optionCount == 1}">
							                        <option value="${vo.detailNum}" data-stockNum="${vo.stockNum}" data-totalStock="${vo.totalStock}" data-optionValue="${vo.optionValue}" ${vo.totalStock < 1 ? 'disabled' : ''}>
							                            ${vo.optionValue} ${vo.totalStock < 1 ? '(품절)' : ''}
							                        </option>
							                    </c:when>
							                    <c:otherwise>
							                        <option value="${vo.detailNum}">${vo.optionValue}</option>
							                    </c:otherwise>
							                </c:choose>
							            </c:forEach>
							        </select>
							    </div>
							</c:if>
							
							<c:if test="${dto.optionCount > 1}">
							    <div class="option-tab">
							        <select class="form-select requiredOption2 option-tab1" data-optionNum2="${listProductOption[1].optionNum}">
							            <option>${listProductOption[1].optionName} ${vo.totalStock < 1 ? '(품절)' : ''}</option>
							            
							        </select>
							    </div>
							</c:if>

							<div class="order-area"></div>

							<hr>
							<div class="total-price">
								<div class="total-text">총금액</div>
								<div class="total-detail">
									<label><span class="product-totalAmount">0</span> 원</label>
								</div>
							</div>



							<div class="buttons">
								<div class="button-wish">
									<button type="button" class="wish btn-productBlind">
										<i class="bi bi-heart"></i>
									</button>
								</div>
								<div class="button-buy">
									<div>
										<button type="button" class="btnbtn-productCart btn"
											onclick="sendOk('cart');">장바구니</button>
									</div>
									<div>
										<input type="hidden" name="mode" value="buy">
										<c:choose>
											<c:when test="${dto.totalStock < 1}">
												<button type="button" class="btn btn-buySend"
													onclick="sendOk('buy');" disabled>구매하기</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-buySend"
													onclick="sendOk('buy');">구매하기</button>
											</c:otherwise>
										</c:choose>
										
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>



				<nav id="navbar-example2">
					<ul class="nav nav-tabs mt-3 pt-5" id="myTab">
						<li class="nav-item"><a class="nav-link tab-active"
							href="#scrolld">상세정보</a></li>
						<li class="nav-item"><a class="nav-link" href="#scrollr">구매후기
								<span class="title-reviewCount">(2)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#scrollq">문의하기
								<span class="title-qnaCount">(3)</span>
						</a></li>
					</ul>
				</nav>


				<div class="tab-content pt-3" id="myTabContent"
					data-bs-target="#navbar-example2"
					data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true"
					class="scrollspy-example bg-body-tertiary p-3 rounded-2"
					tabindex="0">
					<div class="tab-pane fade show active" id="tab-pane-1"
						role="tabpanel" aria-labelledby="tab-1" tabindex="0">
						<div class="img-more" id="scrolld">
							<div class="mt-4 product-content hidden" id="detail">
								${dto.content}
							</div>
							<div class="detailMore">
								<a id="btnMore" href="javascript:moreDetail();">상세 정보 더보기</a>
							</div>
						</div>

						<div class="recomm-product">
							<div class="recomm-title">비슷한 상품</div>
							<div class="recomm-imgs">
								<c:forEach var="n" begin="1" end="6">
									<div class="recomm-img">
										<img
											src="${pageContext.request.contextPath}/uploads/product/10.jpg"
											class="img-buy">
										<div>제품이름</div>
										<div class="d-flex recomm-price">
											<span>할인율%</span> <span>가격</span>
										</div>
									</div>

								</c:forEach>
							</div>
						</div>

						<div class="review" id="scrollr">
							<div class="mt-3 fw-bold review-title">
								<p>구매후기(2)</p>
							</div>

							<div class="star-sort ms-3">
								<div class="col pt-3 pb-3 star-box">
									<div class="score-star review-score-star">
										<c:forEach var="n" begin="1" end="5">
											<c:set var="score" value="" />
											<span class="item fs-2 on"> <i class="bi bi-star-fill"></i></span>
										</c:forEach>
									</div>
									<div class="fs-2 ms-4 fw-bold">
										<label class="review-score">4.5</label>
									</div>
								</div>
								<div class="reviewSort-area">
									<div>
										<select class="form-select reviewSortNo">
											<option selected value="1">평점 높은순</option>
											<option value="2">평점 낮은순</option>
											<option value="3">최신순</option>
										</select>
									</div>
								</div>
							</div>

							<div class="review-con">
								<div class="review-content border-top">
									<div class="review-top ms-3">
										<div class="review-top-left">
											<label> <c:forEach var="n" begin="1" end="5">
													<i class="bi bi-star-fill"></i>
												</c:forEach>
											</label> <label> 캔따개 </label>
										</div>
										<div>2024.07.10</div>
									</div>
									<div class="review-option ms-3">옵션: [색상]그레이 [사이즈]S</div>
									<div class="review-img-content ms-3">
										<img
											src="${pageContext.request.contextPath}/uploads/product/10.jpg"
											class="img-buy">
										<div>재질도 좋고 설치도 간편하고 견고한 것 같아요</div>
									</div>
								</div>

								<div class="review-content border-top">
									<div class="review-top ms-3">
										<div class="review-top-left">
											<label> <c:forEach var="n" begin="1" end="5">
													<i class="bi bi-star-fill"></i>
												</c:forEach>
											</label> <label> 캔따개 </label>
										</div>
										<div>2024.07.10</div>
									</div>
									<div class="review-option ms-3">옵션: [색상]그레이 [사이즈]S</div>
									<div class="review-img-content ms-3">
										<img
											src="${pageContext.request.contextPath}/uploads/product/10.jpg"
											class="img-buy">
										<div>재질도 좋고 설치도 간편하고 견고한 것 같아요</div>
									</div>
								</div>
							</div>
						</div>
						<div class="list-review"></div>

						<div class="qna" id="scrollq">
							<div class="qna-title">
								<p>문의</p>
							</div>

							<div class="mt-3 p-2 text-end">
								<button type="button" class="btnQuestion btn">문의 작성하기</button>
							</div>
						</div>

						<div class="mt-1 p-2 list-question"></div>
					</div>
				</div>

				<a href="#" class="btn_gotop"> <img
					src="${pageContext.request.contextPath}/resources/images/toparrow.png"
					class="top_arrow"> <span
					class="glyphicon glyphicon-chevron-up"></span>
				</a>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.btn_gotop').show();
		} else {
			$('.btn_gotop').hide();
		}
	});

	$('.btn_gotop').click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});

	function moreDetail() {
		$('#detail').removeClass('hidden');
		$('.detailMore').remove();
	}

	$(document).ready(function() {
		$('.nav-link').click(function() {
			$('.nav-link').removeClass('tab-active');
			$(this).addClass('tab-active');
		});
	});

	$(window).scroll(function() {
		if($(this).scrollTop() > 300) {
			$('.btn_gotop').show();
		} else {
			$('.btn_gotop').hide();
		}
	});

	$('.btn_gotop').click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});

	function moreDetail() {
		$('#detail').removeClass('hidden');
		$('.detailMore').remove();
	}
	
	
	
</script>






