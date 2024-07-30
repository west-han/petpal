<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page - 취소/반품/교환/환불 내역</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">


a {
	text-decoration: none;
}

h3 {
	margin-bottom: 20px;
}

h2 {
	margin-bottom: 55px;
}

.card-header {
	background-color: #dc3545;
	color: white;
}

.list-group-item.active {
	background-color: #E4B075;
	border-color: #E4B075;
}

.button-column a {
	display: block;
	width: 100%;
	margin-bottom: 10px;
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
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-2">
				<h3 class="mypage">마이페이지</h3>
				<ul class="list-group">
					<li class="category-header">my 쇼핑</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/orderlist">주문 내역/배송 조회</a></li>
					<li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage/cancel-return-change">취소/반품/교환/환불 내역</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mycoupon">쿠폰함</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mypoint">적립금</a></li>
					<li class="category-header">my 정보</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mypet">나의 펫</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mymodify">내 정보</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/myaddress">나의 배송지</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/likelist">찜 리스트</a></li>
					<li class="category-header">my 활동</li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/myreview">리뷰관리</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
				</ul>
			</div>

			<div class="col-md-9 ms-5">
				<h2>취소/반품/교환/환불 내역</h2>
				<c:forEach var="dto" items="${list}">
					<div class="card mb-3">
						<div class="card-header">주문번호 : ${dto.orderNum}</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-9">
									
									<h5 class="card-title">${dto.productName}</h5>
									<p class="card-text">
										<strong>가격:</strong> ${dto.price - dto.discountAmount}원
									</p>
									<p class="card-text">
										<strong>구매한 갯수:</strong> ${dto.amount}
									</p>
								</div>
								<div class="col-md-3 mt-3 button-column" style="text-align: center;">
									<a href="#" class="btn btn-success" onclick="inquiry();">상세 조회</a>
									<p class="card-text">
										<strong>상태:</strong> 
										${dto.detailStateMemo}
									</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function inquiry() {
			alert("만들어져있는 기능이 아닙니다.")
		}
	
	</script>
</body>
</html>
