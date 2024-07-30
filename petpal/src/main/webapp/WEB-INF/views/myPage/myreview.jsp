<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page - 리뷰 관리</title>

<style type="text/css">

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

ul.inline-list {
    padding: 0;
    margin: 0;
    list-style: none;
}

ul.inline-list li {
    display: inline-block;
    margin-right: 10px;
}
</style>

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm2;
		f.submit();
	}
</script>
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
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/likelist">찜 리스트</a></li>
                    <li class="category-header">my 활동</li>
                    <li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage/myreview">리뷰관리</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}">1대1 문의 내역</a></li>
                </ul>
            </div>
            
            <div class="col-md-9 ms-5">
                <h2>리뷰 관리</h2>
                <form action="${pageContext.request.contextPath}/myPage/myreview" method="get" name="searchForm2">
					<div class="input-group mb-3">
  						<input type="date" class="form-control" name="startDate" value="${startDate}"  placeholder="start">
  						<button type="button" class="input-group-text" onclick="searchList();">검색</button>
 						<input type="date" class="form-control" name="endDate" value="${endDate}" placeholder="end">
					</div>
				</form>
                
                <c:forEach var="review" items="${reviews}">
                    <div class="review-item">
                        <c:if test="${not empty review.thumbnail}">
                            <img src="${pageContext.request.contextPath}/uploads/${review.thumbnail}" alt="상품 이미지">
                        </c:if>
                        <div class="item-details">
                            <div class="star-rating">
                                <c:forEach var="i" begin="1" end="5">
                                    <c:choose>
                                        <c:when test="${i <= review.rating}">★</c:when>
                                        <c:otherwise>☆</c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                            <p class="review-content">${review.content}</p>
                            <p class="review-date">${review.reviewDate}</p>
                            <p class="product-name">상품 이름: ${review.productName}</p>
                            <c:if test="${not empty review.reviewFileNameList}">
                                <p>첨부 파일:</p>
                                <ul class="inline-list">
                                    <c:forEach var="fileName" items="${review.reviewFileNameList}">
                                        <li>
                                            <img src="${pageContext.request.contextPath}/uploads/reviewPhoto/${fileName}" alt="첨부 파일 이미지">
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                            <c:if test="${not empty review.answer}">
                                <div class="accordion mt-5" id="accordionExample-${review.orderDetailNum}">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="heading-${review.orderDetailNum}">
                                            <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${review.orderDetailNum}" aria-expanded="true" aria-controls="collapse-${review.orderDetailNum}">
                                                답변 보기
                                            </button>
                                        </h2>
                                        <div id="collapse-${review.orderDetailNum}" class="accordion-collapse collapse" aria-labelledby="heading-${review.orderDetailNum}" data-bs-parent="#accordionExample-${review.orderDetailNum}">
                                            <div class="accordion-body">
                                                <p class="answer-date">답변 시간: ${review.answerDate}</p>
                                                <p>${review.answer}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
                <div class="page-navigation">${dataCount == 0 ? "내가 쓴 리뷰가 없습니다." : paging}
						</div>
            </div>
        </div>
    </div>


</body>
</html>
