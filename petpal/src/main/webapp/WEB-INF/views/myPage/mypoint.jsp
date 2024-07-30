<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page - 적립금</title>
<style type="text/css">

h3 {
	margin-bottom: 20px;
}

h2, .total-points {
	margin-bottom: 55px;
}

.card-header {
	background-color: #17a2b8;
	color: white;
}

.list-group-item.active {
	background-color: #E4B075;
	border-color: #E4B075;
}

a {
	text-decoration: none;
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

.text-center {
	text-align: center;
}
</style>

<script type="text/javascript">
	function searchList2() {
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
					<li class="list-group-item "><a href="${pageContext.request.contextPath}/myPage/${species}/orderlist">주문 내역/배송 조회</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/cancel-return-change">취소/반품/교환/환불 내역</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/myPage/${species}/mycoupon">쿠폰함</a></li>
					<li class="list-group-item active"><a href="${pageContext.request.contextPath}/myPage/${species}/mypoint">적립금</a></li>
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
				<h2>적립금</h2>
				<div class="total-points">
					<h3>적립금 총액: ${totalPoint}</h3>					
				</div>
				<form action="${pageContext.request.contextPath}/myPage/${sessionScope.species}/mypoint" method="get" name="searchForm2">
					<div class="input-group mb-3">
  						<input type="date" class="form-control" name="startDate" value="${startDate}"  placeholder="start">
  						<button type="button" class="input-group-text" onclick="searchList2();">검색</button>
 						<input type="date" class="form-control" name="endDate" value="${endDate}" placeholder="end">
					</div>
				</form>
				<div class="card mb-3">
					<div class="card-header">적립금 내역</div>
					<div class="card-body">
						<table class="table table-striped">
							<thead class="thead text-center">
								<tr>
									<th>적립일</th>
									<th>구분</th>
									<th>적립금</th>
									
								</tr>
							</thead>
							<tbody class="tbody text-center">
								<c:forEach var="dto" items="${list}">
									<tr>
										<td>${dto.regDate }</td>
										<td>
										<c:choose>
											<c:when test="${dto.classify == 0}">
                    							구매적립
                							</c:when>
											<c:when test="${dto.classify == 1}">
                    							이벤트적립
                							</c:when>
											<c:when test="${dto.classify == 2}">
                    							사용
                							</c:when>
											<c:when test="${dto.classify == 3}">
                    							소멸
                							</c:when>
											<c:otherwise>
                    							어떻게 얻었니?
                							</c:otherwise>
										</c:choose>
										</td>
										<td>
											<c:choose>
											<c:when test="${dto.classify == 0}">
                    							+ ${dto.point }
                							</c:when>
											<c:when test="${dto.classify == 1}">
                    							+ ${dto.point }
                							</c:when>
											<c:when test="${dto.classify == 2}">
                    							${dto.point }
                							</c:when>
											<c:when test="${dto.classify == 3}">
                    							${dto.point }
                							</c:when>
											<c:otherwise>
                    							오류
                							</c:otherwise>
                							</c:choose>
										</td>
										
									</tr>
								</c:forEach>

							</tbody>
						</table>

						<div class="page-navigation">${dataCount == 0 ? "포인트내역이 없습니다." : paging}
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>