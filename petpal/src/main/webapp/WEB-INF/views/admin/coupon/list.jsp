<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.body-container {
	max-width: 1300px;
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
					<tr class="border-top border-dark table-light">
						<th>쿠폰번호</th>
						<th>쿠폰이름</th>
						<th>할인율</th>
						<th>최소결제금액</th>
						<th>유효기간</th>
						<th>카테고리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr valign="middle">
							<th>${dto.couponNum}</th>
							<th>${dto.couponName}</th>
							<th>${dto.discountRate}%</th>
							<th>${dto.minPayment}</th>
							<th>${dto.validity}</th>
							<th>${dto.categoryName}</th>
						</tr>					
					</c:forEach>
				</tbody>
			
			</table>
		</div>
		
		
		<table class="table table-borderless">
						<tr>
							<td width="150">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/product/list';"> <i class="bi bi-arrow-clockwise"></i> </button>				
							</td>
							<td align="center">
								<form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/product/" method="post">
									<div class="col-auto p-1">
										<select name="schType" class="form-select">
											<option value="all" selected>쿠폰번호+이름</option>
											<option value="couponNum" >쿠폰번호</option>
											<option value="couponName">쿠폰이름</option>
											<option value="discountRate" >할인율</option>
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
							<td width="150" align="right">
								<c:url var="url" value="/admin/product"/>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/coupon/grant';">쿠폰지급</button>
							</td>			
							<td width="150" align="right">
								<c:url var="url" value="/admin/product"/>
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/coupon/write';">쿠폰생성</button>
							</td>
						</tr>
					</table>
		
		
	</div>
</div>

