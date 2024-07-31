<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
	<table class="table table-border table-list">
    <thead>
        <tr class="border-top border-dark table-light">
            <th width="130">상품코드</th>
            <th>카테고리명</th>
            <th>상품명</th>
            <th width="100">가격</th>
            <th width="60">할인율</th>
            <th width="60">재고</th>
            <th width="60">상태</th>
            <th width="80">수정일</th>
            <th width="120">변경</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="dto" items="${list}" varStatus="status">
            <tr valign="middle">
                <td>${dto.productNum}</td>
                <td>${dto.categoryName}</td>
                <td class="product-subject left">
                    <img src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
                    <a href="#"><label>${dto.productName}</label></a>
                </td>
                <td>${dto.price}</td>
                <td>${dto.discountRate}%</td>
                <td>${dto.totalStock}</td>
                <td>
                    <c:choose>
                        <c:when test="${dto.productStatus == 0}">
                            판매준비
                        </c:when>
                        <c:when test="${dto.productStatus == 1}">
                            판매중
                        </c:when>
                        <c:when test="${dto.productStatus == 2}">
                            품절
                        </c:when>
                        <c:when test="${dto.productStatus == 3}">
                            판매중단
                        </c:when>
                        <c:otherwise>
                            이게뭐지
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${dto.modifyDate}</td>
                <td>
                    <button type="button" class="btn border btn-productStock" data-productNum="${dto.productNum}" data-optionCount="${dto.optionCount}" data-bs-toggle="modal" data-bs-target="#productStockDialogModal">재고</button>
                    <button type="button" class="btn border" onclick="location.href='#';">수정</button>
                </td>
            </tr>                    
        </c:forEach>
    </tbody>
</table>
	
</body>
</html>