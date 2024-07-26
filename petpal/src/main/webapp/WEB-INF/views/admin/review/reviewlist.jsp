<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div id="allContainer">
    <table class="table table-border table-list">
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
                        <th>
                            <a href="#" class="review-link" 
                            data-order="${dto.orderDetailNum}" 
                            data-name="${dto.productName}" 
                            data-content="${dto.content}">
                                ${dto.productName}
                            </a>
                        </th>
                        <th>${dto.amount}</th>
                        <th>${dto.reviewDate}</th>
                        <th>
                        	<c:choose>
                        		<c:when test="${empty dto.answerNum}">
								    미답변
								</c:when>
                        		<c:when test="${!empty dto.answerNum}">
                        			답변
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
    <div class = "page-navigation">${dataCount == 0 ? "내역이 없습니다" : paging}</div>
    
    
</div>

<table class="table table-borderless">
            <tr>
                <td width="150">
                    <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/review/list';">
                        <i class="bi bi-arrow-clockwise"></i>
                    </button>
                </td>
                <td align="center">
                    <form class="row justify-content-center" name="searchForm" action="${pageContext.request.contextPath}/admin/review/" method="post">
                        <div class="col-auto p-1">
                            <select name="schType" class="form-select">
                                <option value="all" selected>평점+</option>
                                <option value="productNum">상품이름</option>
                                <option value="userName">회원이름</option>
                                <option value="showReview">숨김여부</option>
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
                            <button type="button" class="btn btn-light" onclick="searchList()">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </form>
                </td>
            </tr>
        </table>