<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page - 리뷰 관리</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
body {
	background-color: #f8f9fa;
}

h2, h3 {
	margin-bottom: 20px;
}

.list-group-item.active {
	background-color: #E4B075;
	border-color: #E4B075;
}

.accordion-button:not(.collapsed) {
	color: #007bff;
	background-color: #e9ecef;
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
	width: 100px;
	height: 100px;
	object-fit: cover;
	margin-right: 20px;
}

.review-item .item-details {
	flex-grow: 1;
}

.star-rating {
	color: gold;
}

.category-header {
	list-style-type: none;
	text-align: center;
	padding: 10px 0;
	font-weight: bold;
	font-size: 1.2em;
}

.mypage {
	text-align: center;
}

.category-header {
	list-style-type: none;
	text-align: center;
	padding: 10px 0;
	font-weight: bold;
	font-size: 1.2em;
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
					<li class="list-group-item active"><a
						href="${pageContext.request.contextPath}/myPage2/orderlist">주문
							내역/배송 조회</a></li>
					<li class="list-group-item "><a
						href="${pageContext.request.contextPath}/myPage2/cancel-return-change">취소/반품/교환/환불
							내역</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/mycoupon">쿠폰함</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/mypoint">적립금</a></li>
					<li class="category-header">my 정보</li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/mypet">나의 펫</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/mymodify">내
							정보</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/likelist">찜
							리스트</a></li>
					<li class="category-header">my 활동</li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}/myPage2/myreview">리뷰관리</a></li>
					<li class="list-group-item"><a
						href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
				</ul>
			</div>

			<div class="col-md-9 ms-5">
				<h2>주문 내역</h2>
				<div class="card mb-3">
					<div class="card-header">주문 번호: 123456789</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-9">
								<p class="card-text">
									<strong>주문날짜:</strong> 2024.07.09
								</p>
								<p class="card-text">
									<strong>배송 상태:</strong> 배송중
								</p>
								<h5 class="card-title">상품 이름</h5>
								<p class="card-text">
									<strong>가격:</strong> 20,000원
								</p>
								<p class="card-text">
									<strong>구매한 갯수:</strong> 2
								</p>
							</div>
							<div class="col-md-3 button-column">
								<button class="btn btn-primary mt-3">배송 조회</button>
								<button class="btn btn-secondary">교환/반품 신청</button>
								<button class="btn btn-success">리뷰 작성</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 추가적인 주문 내역 카드 -->
			</div>
		</div>
	</div>


</body>
</html>