<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


    <div class="body-container">
    	<!-- if 태그로 검사, 기획전 상품 목록 페이지인 경우에는 아래 div 표시 -->
    	<c:if test="${mode} == special">
	        <div class="page-description special-content">
	            <h2>기획전 이름</h2>
	            기획전 소개글
	            Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni accusantium officiis ut! Assumenda hic, quas ex obcaecati odio modi quis natus facilis distinctio illo, tempore harum voluptas velit commodi ipsa!
	            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Minima illum, minus reprehenderit ad veritatis, dicta, rem explicabo quod cupiditate quos ipsa vel omnis totam alias impedit necessitatibus vero dolore commodi!
	            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Officiis placeat facere inventore, autem expedita possimus tempora. Amet facere est aut. Repellat delectus corporis consequuntur perspiciatis facilis odio nihil quos numquam.
	        </div>
    	</c:if>

    	<!-- if 태그로 검사, 맞춤 상품인 경우에만 아래 div 표시 -->
		<c:if test="${mode} == recommendation">
	    	<div class="page-description recommendation-content">
	    	
	    	</div>
		</c:if>

        <div class="list-container list-h">
            <h2>
            	<c:if test="${mode == 'recent'}"> 신상품 </c:if>
            	<c:if test="${mode == 'best'}"> 베스트 상품 </c:if>	
            </h2>
            <div class="category-box">
                <ul class="list-h category-list">
                	<li><a href="${pageContext.request.contextPath}/product/recent/${sessionScope.species}/0">전체</a></li>
                    <c:forEach items="${categories}" var="category">
                    	<li><a href="${pageContext.request.contextPath}/product/recent/${sessionScope.species}/${category.CATEGORYNUM}">${category.CATEGORYNAME}</a></li>
                    </c:forEach>
                </ul>
            </div>
            
            <div class="display-box list-h">
            	<c:if test="${empty products}">
            		<div style="margin: 0 auto; font-size: large;">등록된 상품이 없습니다.</div>
            	</c:if>
            	<c:forEach items="${products}" var="product">
	                <div class="product-box" onClick="location.href='${pageContext.request.contextPath}/product/${sessionScope.species}/${product.productNum}'">
	                    <div class="product-img-box">
	                        <img src="${pageContext.request.contextPath}/uploads/product/${product.thumbnail}" alt="이미지">
	                    </div>
	                    <div class="product-info">
	                        <p class="text-brand">${product.brand}</p>
	                        <p class="text-name">${product.productName}</p>
	                        <c:if test="${product.discountRate == 0}">
	                        	<strong class="text-discountedPrice">
	                        		${product.price}
	                        	</strong>
	                        </c:if>
	                        <c:if test="${product.discountRate != 0}">
		                        <p class="text-price">${product.price}</p>
		                        <p>
		                        	<span class="text-discountRate">
			                        	${product.discountRate}
			                        </span>
			                        <strong class="text-discountedPrice">
			                        	${product.price - product.discountAmount}
			                        </strong>
		                        </p>
	                        </c:if>
	                        <!-- 평점은 별에 색 채워서 표시 -->
	                        <p class="text-rate">
	                        	<span>${product.rating}</span>
	                        	<span>(${product.reviewCount})</span>
	                        </p>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
        </div>
    </div>
