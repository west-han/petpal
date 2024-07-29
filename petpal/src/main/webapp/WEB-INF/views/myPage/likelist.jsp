<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page - 찜 리스트</title>
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

.wishlist-item {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.wishlist-item img {
    width: 100px;
    height: 100px;
    object-fit: cover;
    margin-right: 20px;
}

.wishlist-item .item-details {
    flex-grow: 1;
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
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mycoupon">쿠폰함</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mypoint">적립금</a></li>
                    <li class="category-header">my 정보</li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mypet">나의 펫</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/mymodify">내 정보</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/myaddress">나의 배송지</a></li>
                    <li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage/likelist">찜 리스트</a></li>
                    <li class="category-header">my 활동</li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/myreview">리뷰관리</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
                </ul>
            </div>

            <div class="col-md-9 ms-5">
                <h2>찜 리스트</h2>
                <c:forEach var="item" items="${wishList}">
                    <div class="wishlist-item">
                        <a href="${pageContext.request.contextPath}/product/${item.species}/${item.productNum}">
					       <img class="review-item" src="${pageContext.request.contextPath}/uploads/product/${item.thumbnail}" alt="주문한 사진">
					    </a>
                        <div class="item-details">
                            <h5 class="item-title">${item.productName}</h5>
                            <p class="item-price">₩<fmt:formatNumber value="${item.price}" pattern="#,###"/></p>
                        </div>
                        <form action="${pageContext.request.contextPath}/myPage/deleteWishList" method="post" style="display:inline;">
                            <input type="hidden" name="productNum" value="${item.productNum}">
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirmDelete('정말 삭제하시겠습니까?');">삭제</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script>
    function confirmDelete(message) {
        return confirm(message);
    }
    </script>
</body>
</html>
