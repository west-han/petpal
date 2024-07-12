<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<style>
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
	display: block;
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
.mypage{
	text-align: center;
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
					<li class="list-group-item"><a href="#">주문 내역/배송 조회</a></li>
					<li class="list-group-item"><a href="#">취소/반품/교환/환불 내역</a></li>
					<li class="list-group-item"><a href="#">쿠폰함</a></li>
					<li class="list-group-item"><a href="#">적립금</a></li>
					<li class="category-header">my 정보</li>
					<li class="list-group-item"><a href="#">나의 펫</a></li>
					<li class="list-group-item"><a href="#">내 정보</a></li>
					<li class="list-group-item"><a href="#">찜 리스트</a></li>
					<li class="category-header">my 활동</li>
					<li class="list-group-item active"><a href="#">리뷰관리</a></li>
					<li class="list-group-item"><a href="#">1대1 문의 내역</a></li>
				</ul>
			</div>

			<div class="col-md-9 ms-5">
				<h2>리뷰 관리</h2>
				<div class="review-item">
					<img src="https://via.placeholder.com/100" alt="상품 이미지">
					<div class="item-details">
						<div class="star-rating">★★★★☆</div>
						<p class="review-content">이 상품은 정말 좋았습니다. 품질이 뛰어나고 배송도 빠릅니다.</p>
						<p class="review-date">2024-07-10</p>
					</div>
				</div>
				<div class="review-item">
					<img src="https://via.placeholder.com/100" alt="상품 이미지">
					<div class="item-details">
						<div class="star-rating">★★★☆☆</div>
						<p class="review-content">상품이 괜찮았지만, 포장이 조금 아쉬웠습니다.</p>
						<p class="review-date">2024-06-15</p>
					</div>
				</div>
				<!-- 추가적인 리뷰 항목 -->
			</div>
		</div>
	</div>

</body>
</html>
