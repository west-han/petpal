<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
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
					<c:set var="currentOrderNum" value="" />
					<c:forEach var="dto" items="${list}">
					    <c:if test="${currentOrderNum != dto.orderNum}">
					        <c:set var="currentOrderNum" value="${dto.orderNum}" />
					        <div class="card mb-3">
					            <div class="card-header d-flex justify-content-between">
					                <span class="align-middle">주문 번호: ${dto.orderNum}</span>
					                <a class="btn btn-link" href="${pageContext.request.contextPath}/myPage2/orderDetail?orderNum=${dto.orderNum}">
					                    주문 상세
					                </a>
					            </div>
					            <div class="card-body">
					                <c:forEach var="item" items="${list}">
					                    <c:if test="${item.orderNum == currentOrderNum}">
					                        <div class="row">
					                            <div class="col-md-9">
					                                <p class="card-text">
					                                    <strong>주문 날짜:</strong> ${item.orderDate}
					                                </p>
					                                <p class="card-text">
					                                    <strong>배송 상태:</strong> ${item.orderState}
					                                </p>
					                                <h5 class="card-title">${item.productName}</h5>
					                                <div class="review-item">
					                                    <img src="${pageContext.request.contextPath}/uploads/${item.thumbnail}" alt="주문한 사진">
					                                </div>
					                                <p class="card-text">
					                                    <strong>가격:</strong> ${item.priceDiscount}원
					                                </p>
					                                <p class="card-text">
					                                    <strong>구매한 갯수:</strong> ${item.amount}
					                                </p>
					                            </div>
					                            <div class="col-md-3 button-column">
					                                <button class="btn btn-primary mt-3">배송 조회</button>
					                                <button class="btn btn-secondary">교환/반품 신청</button>
					                                <button class="btn btn-success">리뷰 작성</button>
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
</body>
</html>
