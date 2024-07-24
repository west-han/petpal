<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
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

.card-body {
	padding: 1rem;
}

.card {
	margin-bottom: 1rem;
}

.card img {
	width: 100px;
	height: 100px;
	object-fit: cover;
	margin-right: 1rem;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<h2>주문 상세</h2>
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">주문 정보</h5>
				<p class="card-text"><strong>주문 번호:</strong> ${orderDetails[0].orderNum}</p>
				<p class="card-text"><strong>주문 날짜:</strong> ${orderDetails[0].orderDate}</p>
			</div>
		</div>

		<c:forEach var="dto" items="${orderDetails}">
		    <div class="card mb-3">
		        <div class="card-body d-flex">
		            <img src="${pageContext.request.contextPath}/uploads/${dto.thumbnail}" alt="상품 이미지" class="img-fluid rounded">
		            <div>
		                <h5 class="card-title">${dto.productName}</h5>
		                <p class="card-text"><strong>옵션:</strong> ${dto.optionValue}</p>
		                <p class="card-text"><strong>가격:</strong> ${dto.priceDiscount}원</p>
		                <p class="card-text"><strong>수량:</strong> ${dto.amount}</p>
		                
		            </div>
		        </div>
		    </div>
		</c:forEach>

		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">결제 정보</h5>
				<p class="card-text"><strong>총 상품 가격:</strong> 
					<c:set var="totalProductPrice" value="0" />
					<c:forEach var="dto" items="${orderDetails}">
						<c:set var="itemTotal" value="${dto.amount * dto.priceDiscount}" />
						<c:set var="totalProductPrice" value="${totalProductPrice + itemTotal}" />
					</c:forEach>
					${totalProductPrice}원
				</p>
				<p class="card-text"><strong>배송비:</strong> ${orderDetails[0].deliveryCharge}원</p>
				<p class="card-text"><strong>사용한 포인트:</strong> ${orderDetails[0].usedPoint}원</p>
				<p class="card-text"><strong>총 결제 금액:</strong> 
					${totalProductPrice - orderDetails[0].usedPoint + orderDetails[0].deliveryCharge}원
				</p>
				<p class="card-text"><strong>결제 구분:</strong>
					<c:choose>
						<c:when test="${orderDetails[0].payClassify == 0}">카드결제</c:when>
						<c:when test="${orderDetails[0].payClassify == 1}">간편결제</c:when>
						<c:otherwise>알 수 없음</c:otherwise>
					</c:choose>
				</p>
				<p class="card-text"><strong>결제사명:</strong> ${orderDetails[0].cardName}</p>
			</div>
		</div>

		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">배송 정보</h5>
				<p class="card-text"><strong>받는 사람:</strong> ${orderDetails[0].recipientName}</p>
				<p class="card-text"><strong>전화번호:</strong> ${orderDetails[0].tel}</p>
				<p class="card-text"><strong>우편번호:</strong> ${orderDetails[0].postalCode}</p>
				<p class="card-text"><strong>주소:</strong> ${orderDetails[0].address1} ${orderDetails[0].address2}</p>
				<p class="card-text"><strong>배송 메모:</strong> ${orderDetails[0].destMemo}</p>
			</div>
		</div>

		<button type="button" class="btn btn-secondary mt-3" onclick="window.history.back()">뒤로 가기</button>
	</div>
</body>
</html>
