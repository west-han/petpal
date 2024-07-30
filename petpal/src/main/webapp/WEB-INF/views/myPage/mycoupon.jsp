<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page - 쿠폰함</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style type="text/css">


h3 {
	margin-bottom: 20px;
}

h2 {
	margin-bottom: 55px;
}

.card-header {
	background-color: #28a745;
	color: white;
}

.list-group-item.active {
	background-color: #E4B075;
	border-color: #E4B075;
}

a {
	text-decoration: none;
}

tbody {
	text-align: center;
}

thead {
	text-align: center;
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

.coupon {
    border: 2px dashed #d4d4d4;
    border-radius: 10px;
    padding: 10px 20px;
    margin: 10px 0;
    max-width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
}

.coupon-header {
    background-color: #f8f9fa;
    padding: 10px;
    border-radius: 10px 10px 0 0;
    text-align: center;
    width: 100%;
}

.coupon-body {
    padding: 10px;
    text-align: center;
    width: 100%;
}

.coupon-footer {
    background-color: #f8f9fa;
    padding: 10px;
    border-radius: 0 0 10px 10px;
    text-align: center;
    width: 100%;
}

.coupon-body i {
    margin-right: 5px;
    color: #007bff;
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
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/cancel-return-change">취소/반품/교환/환불 내역</a></li>
					<li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage/mycoupon">쿠폰함</a></li>
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
                <h2>쿠폰함</h2>
                <ul class="nav nav-tabs" id="couponTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="active-coupons-tab" data-bs-toggle="tab" data-bs-target="#active-coupons" type="button" role="tab" aria-controls="active-coupons" aria-selected="true">사용가능 쿠폰</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="expired-coupons-tab" data-bs-toggle="tab" data-bs-target="#expired-coupons" type="button" role="tab" aria-controls="expired-coupons" aria-selected="false">사용완료/기한만료 쿠폰</button>
                    </li>
                </ul>
                <div class="tab-content" id="couponTabsContent">
                    <div class="tab-pane fade show active" id="active-coupons" role="tabpanel" aria-labelledby="active-coupons-tab">
                        <div class="card mt-3">
                            <div class="card-header">
                                사용가능 쿠폰 목록
                            </div>
                            <div class="card-body">
                                <c:forEach var="dto" items="${list}">
                                    <c:choose>
										<c:when test="${dto.state == 0}">
		                                    <div class="coupon">
		                                        <div class="coupon-header">
		                                            <h4><i class="fas fa-ticket-alt"></i> ${dto.couponName}</h4>
		                                        </div>
		                                        <div class="coupon-body">
		                                            <p><i class="fas fa-percent"></i><strong>할인율:</strong> ${dto.discountRate} %</p>
		                                            <p><i class="fas fa-calendar-alt"></i><strong>발급일:</strong> ${dto.regDate}</p>
		                                            <p><i class="fas fa-calendar-check"></i><strong>유효 기간:</strong> ${dto.validity}</p>
		                                            <p><i class="fas fa-money-bill-wave"></i><strong>최소 결제금액:</strong> ${dto.minPayment}원</p>
		                                        </div>
		                                        <div class="coupon-footer d-flex align-items-center justify-content-center">
		                                            <p><i class="fas fa-smile"></i> 이용해주셔서 감사합니다!</p>
		                                        </div>
		                                    </div>
                                       	</c:when>
                                	</c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="expired-coupons" role="tabpanel" aria-labelledby="expired-coupons-tab">
                        <div class="card mt-3">
                            <div class="card-header">
                                사용완료/기한만료 쿠폰 목록
                            </div>
                           <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>쿠폰 이름</th>
                                    <th>할인율</th>
                                    <th>발급일</th>
                                    <th>유효 기간</th>
                                    <th>최소결제금액</th>
                                    <th>사용여부</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="dto" items="${list}">
                            	<c:choose>
									<c:when test="${dto.state == 1 || dto.state == 2}">
		                                <tr>
		                                    <td>${dto.couponName}</td>
		                                    <td>${dto.discountRate} %</td>
		                                    <td>${dto.regDate}</td>
		                                    <td>${dto.validity}</td>
		                                    <td>${dto.minPayment}원</td>
		                                    <td>
		                                    <c:choose>
		                                    <c:when test="${dto.state == 1}">
		                                    	사용완료
		                                    </c:when>
		                                    <c:when test="${dto.state == 2}">
		                                    	유효기간만료
		                                    </c:when>
		                                    </c:choose>
		                                    </td>
		                                </tr>
                                	</c:when>
                               </c:choose>
                            </c:forEach>                              
                            </tbody>
                        </table>
                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
