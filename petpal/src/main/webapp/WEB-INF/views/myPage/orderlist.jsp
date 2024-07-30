<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style>
body {
	background-color: #f8f9fa;
}

h2 {
	margin-bottom: 20px;
}

.list-group-item.active {
	background-color: #E4B075;
	border-color: #E4B075;
}

a {
    text-decoration: none;
}

.review-item {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.review-item img {
	width: 150px; /* 이미지 크기를 키움 */
	height: 150px; /* 이미지 크기를 키움 */
	object-fit: cover;
	margin-right: 20px;
}

.button-column button {
	display: block;
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
}
.category-header {
    list-style-type: none;
    text-align: center;
    padding: 10px 0;
    font-weight: bold;
    font-size: 1.2em;
}
.mypage{
	text-align: center;
}

.button-column {
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    gap: 10px;
    height: 100%;
}

.button-column button, .button-column form {
    width: 100%;
}

</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-2">
				<h3 class="mypage">마이페이지</h3>
				<ul class="list-group">
					<li class="category-header">my 쇼핑</li>
					<li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage/${species}/orderlist">주문 내역/배송 조회</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/cancel-return-change">취소/반품/교환/환불 내역</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/mycoupon">쿠폰함</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/mypoint">적립금</a></li>
					<li class="category-header">my 정보</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/mypet">나의 펫</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/mymodify">내 정보</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/myaddress">나의 배송지</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/likelist">찜 리스트</a></li>
					<li class="category-header">my 활동</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/myreview">리뷰관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
				</ul>
			</div>

			<div class="col-md-9 ms-5">
				<h2>주문 내역</h2>
				<c:set var="prevOrderNum" value="" />
				<c:forEach var="dto" items="${list}">
					<c:set var="skipOrder" value="false" />
						<c:forEach var="checkItem" items="${list}">
						    <c:if test="${checkItem.orderNum == dto.orderNum && (checkItem.detailState == 3 || checkItem.detailState == 4 || checkItem.detailState == 5 || 
						    checkItem.detailState == 6 || checkItem.detailState == 7 || checkItem.detailState == 8 || checkItem.detailState == 10 || 
						    checkItem.detailState == 11 || checkItem.detailState == 12 || checkItem.detailState == 14)}">
						        <c:set var="skipOrder" value="true" />
						    </c:if>
						</c:forEach>
					<c:if test="${prevOrderNum != dto.orderNum && !skipOrder}">
						<c:set var="prevOrderNum" value="${dto.orderNum}" />
						<div class="card mb-3">
							<div class="card-header d-flex justify-content-between align-items-center">
								<span class="align-middle order-number">주문 번호: ${dto.orderNum}</span>
								<a class="btn btn-link" href="${pageContext.request.contextPath}/myPage/${sessionScope.species}/orderDetail?orderNum=${dto.orderNum}">주문 상세</a>
							</div>
							<div class="card-body">
								<c:forEach var="item" items="${list}">
									<c:if test="${item.orderNum == dto.orderNum && !(item.detailState == 3 || item.detailState == 4 || item.detailState == 5 ||
									 item.detailState == 6 || item.detailState == 7 || item.detailState == 8 || item.detailState == 10 || item.detailState == 11 || 
									 item.detailState == 12 || item.detailState == 14)}">
									<!-- 같은 주문번호로 묶여진 1개의 div 박스 -->
									<div class="bg-light mb-2 p-3">
										<div class="row mb-2">
											<div class="col-md-12">
												<p class="card-text"><strong>주문 날짜:</strong> ${item.orderDate}</p>
												<p class="card-text"><strong>배송 상태:</strong> ${item.orderStateMemo}</p>
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-md-3 review-item">
												<a href="${pageContext.request.contextPath}/product/${item.species}/${item.productNum}">
					                                    <img src="${pageContext.request.contextPath}/uploads/product/${item.thumbnail}" alt="주문한 사진">
					                                </a>
											</div>
											<div class="col-md-6 p-3">
												<a class="fs-5" href="${pageContext.request.contextPath}/product/${item.species}/${item.productNum}">
					                                ${item.productName}	
					                            </a>
												<p class="card-text"><strong>가격:</strong> ${item.price - item.discountAmount}원</p>
												<p class="card-text"><strong>구매한 갯수:</strong> ${item.amount}</p>
												<c:if test="${not empty item.optionValue}">
											        <p class="card-text"><strong>옵션:</strong> ${item.optionValue}</p>
											    </c:if>
											</div>
											<div class="col-md-3 button-column align-bottom">
												<button class="btn btn-secondary mt-3">배송 조회</button>
												<c:choose>
													<c:when test="${item.orderState == 0 || item.orderState == 1}">
														<form action="${pageContext.request.contextPath}/myPage/updateCancel" method="post">
															<input type="hidden" name="orderDetailNum" value="${item.orderDetailNum}">
															<input type="hidden" name="orderNum" value="${item.orderNum}">
															<button type="submit" class="btn btn-secondary" onclick="return realCancel();">주문취소</button>
														</form>
													</c:when>
													<c:when test="${item.orderState == 2 || item.orderState == 3 || item.orderState == 4 || item.orderState == 5}">
														<button class="btn btn-secondary" onclick="openExchangeReturnModal('${item.orderDetailNum}', '${item.orderNum}', '${item.price - item.discountAmount}')">교환/반품 신청</button>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${item.detailState == 0 || item.detailState == 2}">
														<form action="${pageContext.request.contextPath}/myPage/updateDetailState" method="post">
															<input type="hidden" name="orderDetailNum" value="${item.orderDetailNum}">
															<input type="hidden" name="savePoint" value="${item.savePoint}">
															<button type="submit" class="btn btn-secondary" onclick="return realBuy();">구매확정</button>
														</form>
													</c:when>
													<c:when test="${item.detailState == 1}">
														<button class="btn btn-secondary" onclick="checkReview('${item.orderDetailNum}', '${item.productNum}')">리뷰 작성</button>
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
									
									</c:if>
								</c:forEach>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- 리뷰 작성 모달 -->
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="reviewModalLabel">리뷰 작성</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="${pageContext.request.contextPath}/myPage/writeReview" method="post" enctype="multipart/form-data">
	          <input type="hidden" name="orderDetailNum" id="reviewOrderDetailNum">
	          <input type="hidden" name="productNum" id="reviewProductNum">
	          <div class="mb-3">
	            <label for="rating" class="form-label">평점</label>
	            <select class="form-select" id="rating" name="rating" required>
	              <option value="1">1</option>
	              <option value="2">2</option>
	              <option value="3">3</option>
	              <option value="4">4</option>
	              <option value="5">5</option>
	            </select>
	          </div>
	          <div class="mb-3">
	            <label for="content" class="form-label">내용</label>
	            <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
	          </div>
	          <div class="mb-3">
	            <label for="selectFiles" class="form-label">파일 업로드</label>
	            <input class="form-control" type="file" id="selectFiles" name="selectFiles" multiple>
	          </div>
	          <button type="submit" class="btn btn-primary">리뷰 저장</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 교환/반품 신청 모달 -->
	<div class="modal fade" id="exchangeReturnModal" tabindex="-1" aria-labelledby="exchangeReturnModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exchangeReturnModalLabel">교환/반품 신청</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form id="exchangeReturnForm" method="post">
	          <input type="hidden" name="orderDetailNum" id="exchangeReturnOrderDetailNum">
	          <input type="hidden" name="orderNum" id="exchangeReturnOrderNum">
	          <div class="mb-3">
	            <label for="exchangeReturnType" class="form-label">교환/반품 선택</label>
	            <div>
	              <input type="radio" id="exchange" name="exchangeReturnType" value="exchange" onclick="toggleExchangeReturn('exchange')" required>
	              <label for="exchange">교환</label>
	              <input type="radio" id="return" name="exchangeReturnType" value="return" onclick="toggleExchangeReturn('return')">
	              <label for="return">반품</label>
	            </div>
	          </div>
	          <div id="returnSection" style="display: none;">
	            <p class="card-text"><strong>환불 예상 금액:</strong> <span id="refundAmount"></span>원</p>
	          </div>
	          <div id="exchangeSection" style="display: none;">
	            <div class="mb-3">
	              <label for="exchangeReason" class="form-label">교환 사유</label>
	              <textarea class="form-control" id="exchangeReason" name="exchangeReason" rows="3"></textarea>
	            </div>
	          </div>
	          <button type="submit" class="btn btn-primary" id="exchangeReturnSubmit">신청</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>

	<script type="text/javascript">
	function realBuy() {
		if(!confirm('주문 확정 하시겠습니까')){
	        return false;
	    }
		return true;
	}

	function realCancel() {
		if(!confirm('주문 취소 하시겠습니까')){
	        return false;
	    }
		return true;
	}

	function checkReview(orderDetailNum, productNum) {
		$.ajax({
			url: '${pageContext.request.contextPath}/myPage/findByReview',
			type: 'GET',
			data: {
				orderDetailNum: orderDetailNum,
				productNum: productNum
			},
			success: function(response) {
				if(response.hasReview) {
					alert('작성한 리뷰가 있습니다.');
				} else {
					openReviewModal(orderDetailNum, productNum);
				}
			},
			error: function() {
				alert('리뷰 확인 중 오류가 발생했습니다.');
			}
		});
	}

	function openReviewModal(orderDetailNum, productNum) {
		document.getElementById('reviewOrderDetailNum').value = orderDetailNum;
		document.getElementById('reviewProductNum').value = productNum;
		var reviewModal = new bootstrap.Modal(document.getElementById('reviewModal'));
		reviewModal.show();
	}

	function openExchangeReturnModal(orderDetailNum, orderNum, refundAmount) {
		document.getElementById('exchangeReturnOrderDetailNum').value = orderDetailNum;
		document.getElementById('exchangeReturnOrderNum').value = orderNum;
		document.getElementById('refundAmount').textContent = refundAmount;
		var exchangeReturnModal = new bootstrap.Modal(document.getElementById('exchangeReturnModal'));
		exchangeReturnModal.show();
	}

	function toggleExchangeReturn(type) {
		if (type === 'exchange') {
			document.getElementById('exchangeReturnForm').action = "${pageContext.request.contextPath}/myPage/updateChange";
			document.getElementById('returnSection').style.display = 'none';
			document.getElementById('exchangeSection').style.display = 'block';
		} else {
			document.getElementById('exchangeReturnForm').action = "${pageContext.request.contextPath}/myPage/updateReturn";
			document.getElementById('returnSection').style.display = 'block';
			document.getElementById('exchangeSection').style.display = 'none';
		}
	}
	</script>
</body>
</html>
