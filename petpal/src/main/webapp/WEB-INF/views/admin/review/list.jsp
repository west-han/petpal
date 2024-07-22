<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">


<style type="text/css">
.body-container {
	max-width: 1300px;
	margin-top: 140px;
	margin-left: 80px;
}
.body-title h3{
	font-size: 26px;
}
.filters {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
}
.filters .form-check {
    margin-right: 20px;
}
.filters select, .filters input[type="text"] {
    padding: 5px 10px;
    margin-right: 10px;
}
.filters button {
    padding: 5px 10px;
}
</style>


<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3><i class="fa-solid fa-ticket"></i> 쿠폰관리 </h3>
		</div>
		
		<div id="couponlistContainer">
			<table class = "table table-border table-list">
				<thead>
					<tr class="border-top border-dark table-light text-center">
						<th>평점</th>
						<th>회원이름</th>
						<th>상품이름</th>
						<th>수량</th>
						<th>리뷰등록일</th>
						<th>답변자번호</th>
						<th>답변등록일</th>
						<th>관리자숨김여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr valign="middle" class="text-center">
							<th>${dto.rating}</th>
							<th>${dto.userName}</th>
							<th>${dto.productName}</th>
							<th>${dto.qty}</th>
							<th>${dto.reviewDate}</th>
							<th>
								<c:choose>
									<c:when test="${dto.answerNum == 0}">
										미답변
									</c:when>
									<c:when test="${dto.answerNum != 0}">
										${dto.answerNum}
									</c:when>
								</c:choose>
							</th>
							<th>${dto.answerDate}</th>
							<th>
								<c:choose>
									<c:when test="${dto.showReview == 1}">
										공개
									</c:when>
									<c:when test="${dto.showReview == 0}">
										비공개
									</c:when>
								</c:choose>
							</th>
						</tr>					
					</c:forEach>
				</tbody>
			
			</table>
		</div>
		
		
		<table class="table table-borderless">
						<tr>
							<td width="150">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/review/list';"> <i class="bi bi-arrow-clockwise"></i> </button>				
							</td>
							<td align="center">
								<form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/review/" method="post">
									<div class="col-auto p-1">
										<select name="schType" class="form-select">
											<option value="all" selected>평점+</option>
											<option value="productNum" >상품이름</option>
											<option value="userName">회원이름</option>
											<option value="showReview" >숨김여부</option>
										</select>
									</div>
									<div class="col-auto p-1">
										<input type="text" name="kwd" value="" class="form-control">
										<input type="hidden" name="size" value="">
										<input type="hidden" name="parentNum" value="">
										<input type="hidden" name="categoryNum" value="">
										<input type="hidden" name="productShow" value="">
									</div>
									<div class="col-auto p-1">
										<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
									</div>
								</form>
			
							</td>		
							
						</tr>
					</table>
		
		
	</div>
</div>
