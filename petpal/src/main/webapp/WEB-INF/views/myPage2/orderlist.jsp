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
	color: inherit;
}

.review-item {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.review-item img {
	width: 100px;
	height: 100px;
	object-fit: cover;
	margin-right: 20px;
}

.button-column button {
	display: block;
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
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
					<li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage2/orderlist">주문 내역/배송 조회</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/cancel-return-change">취소/반품/교환/환불 내역</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/mycoupon">쿠폰함</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/mypoint">적립금</a></li>
					<li class="category-header">my 정보</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/mypet">나의 펫</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/mymodify">내 정보</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/myaddress">나의 배송지</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/likelist">찜 리스트</a></li>
					<li class="category-header">my 활동</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage2/myreview">리뷰관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
				</ul>
			</div>

			<div class="col-md-9 ms-5">
				<h2>주문 내역</h2>
				<c:set var="prevOrderNum" value="" />
				<c:forEach var="dto" items="${list}">
					<c:if test="${prevOrderNum != dto.orderNum}">
						<c:set var="prevOrderNum" value="${dto.orderNum}" />
						<div class="card mb-3">
							<div class="card-header d-flex justify-content-between">
								<span class="align-middle">주문 번호: ${dto.orderNum}</span>
								<a class="btn btn-link" href="${pageContext.request.contextPath}/myPage2/orderDetail?orderNum=${dto.orderNum}">주문 상세</a>
							</div>
							<div class="card-body">
								<c:forEach var="item" items="${list}">
									<c:if test="${item.orderNum == dto.orderNum}">
										<div class="row mb-2">
											<div class="col-md-9">
												<p class="card-text"><strong>주문 날짜:</strong> ${item.orderDate}</p>
												<p class="card-text"><strong>배송 상태:</strong> ${item.orderStateMemo}</p>
												<h5 class="card-title">${item.productName}</h5>
												<div class="review-item">
													<img src="${pageContext.request.contextPath}/uploads/${item.thumbnail}" alt="주문한 사진">
												</div>
												<p class="card-text"><strong>가격:</strong> ${item.priceDiscount}원</p>
												<p class="card-text"><strong>구매한 갯수:</strong> ${item.amount}</p>
												<p class="card-text"><strong>옵션:</strong> ${item.optionValue}</p>
											</div>
											<div class="col-md-3 button-column">
												<button class="btn btn-primary mt-3">배송 조회</button>
												<button class="btn btn-secondary">교환/반품 신청</button>
												<c:choose>
													<c:when test="${item.detailState == 0 || item.detailState == 2}">
														<form action="${pageContext.request.contextPath}/myPage2/updateDetailState" method="post">
															<input type="hidden" name="orderDetailNum" value="${item.orderDetailNum}">
															<input type="hidden" name="savePoint" value="${item.savePoint}">
															<button type="submit" class="btn btn-success" onclick="return realBuy();">구매확정</button>
														</form>
													</c:when>
													<c:when test="${item.detailState == 1}">
														<button class="btn btn-success" onclick="checkReview('${item.orderDetailNum}', '${item.productNum}')">리뷰 작성</button>
													</c:when>
												</c:choose>
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
	        <form action="${pageContext.request.contextPath}/myPage2/writeReview" method="post" enctype="multipart/form-data">
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

	<script type="text/javascript">
	function realBuy() {
		if(!confirm('주문 확정 하시겠습니까')){
	        return false;
	    }
		return true;
	}

	function checkReview(orderDetailNum, productNum) {
		$.ajax({
			url: '${pageContext.request.contextPath}/myPage2/findByReview',
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
	</script>
</body>
</html>
