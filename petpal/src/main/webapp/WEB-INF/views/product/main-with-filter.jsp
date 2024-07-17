<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main>
    <div class="body-container">    
        <div class="list-container list-h">
            <div class="left">
                <h2>간식</h2>
                <div class="side-box">
                    <h4>카테고리</h4>
                    <ul class="list-w">
                        <li><a class="${parentCategory == 0 ? 'selected' : ''}" href="${pageContext.request.contextPath}/products/category/${species}/0">전체</a></li>
                        <c:forEach items="${categories}" var="category">
                        	<li><a class="${parentCategory == category.CATEGORYNUM ? 'selected' : ''}" href="${pageContext.request.contextPath}/products/category/${species}/${category.CATEGORYNUM}/0">${category.CATEGORYNAME}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="side-box">
                    <h4>가격</h4>
                    <ul class="list-w">
                    </ul>
                </div>
                <div class="side-box">
                    <h4>평점</h4>
                    <ul class="list-w">
                    </ul>
                </div>
                <div class="side-box">
                    <h4>브랜드</h4>
                    <ul class="list-w">
                    </ul>
                </div>
                <div class="side-box">
                    <h4>급여대상</h4>
                    <ul class="list-w">
                    </ul>
                </div>
                <div class="side-box">
                    <h4>주원료</h4>
                    <ul class="list-w">
                    </ul>
                </div>
                <div class="side-box">
                    <h4>기능</h4>
                    <ul class="list-w">
                    </ul>
                </div>
            </div>

            <div class="right">
                <div class="subcategory-box">
                    <ul class="list-h subcategory-list">
                        <li>
                        	<a
                        		${parentCategory == 0 || categoryNum == 0 ? 'class="selected"' : ''}
                        		href="${pageContext.request.contextPath}/products/category/${species}/${empty parentCategory ? '' : parentCategory += '/'}0"
                        	>
                        		전체
                        	</a>
                        </li>
                        <c:forEach items="${subCategories}" var="subCategory">
                        	<li>
                        		<c:if test="${empty subCategory.PARENTCATEGORY}">
                        			<a
                        				class="${parentCategory == subCategory.CATEGORYNUM ? 'selected' : ''}"
                        				href="${pageContext.request.contextPath}/products/category/${species}/${subCategory.CATEGORYNUM}">${subCategory.CATEGORYNAME}
                        			</a>
                        		</c:if>
                        		<c:if test="${not empty subCategory.PARENTCATEGORY}">
                        			<a 
	                        			class="${categoryNum == subCategory.CATEGORYNUM ? 'selected' : ''}"
	                        			href="${pageContext.request.contextPath}/products/category/${species}/${subCategory.PARENTCATEGORY}/${subCategory.CATEGORYNUM}">${subCategory.CATEGORYNAME}
	                        		</a>
                        		</c:if>
                        	</li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="sort-box list-h">
                    <span>전체 <strong>n</strong>개</span>
                    <div class="dropdown">
                        <div class="list-h">
                            <button class="dropdown-button">
                                판매량
                            </button>
                            <i class="bi fs-5 bi-arrow-down"></i>
                        </div>
                        <ul class="dropdown-menu-han menu-hidden">
                            <li class="menu-item" data-sortby="price">가격</li>
                            <li class="menu-item" data-sortby="name">이름</li>
                            <li class="menu-item" data-sortby="pop">판매량</li>
                            <li class="menu-item" data-sortby="date">등록일</li>
                            <li class="menu-item" data-sortby="rating">평점</li>
                            <li class="menu-item" data-sortby="review">후기수</li>
                        </ul>
                    </div>
                </div>
                <div class="display-box list-h">
                    <div class="product-box"> 
                        <div class="product-img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/product1.jpeg" alt="이미지">
                        </div>
                        <div class="product-info">
                            <p>브랜드</p>
                            <p>상품명</p>
                            <p>거품가격</p>
                            <p>할인율/찐가격</p>
                            <p>평점</p>
                        </div>
                    </div>
                    <div class="product-box"> 
                        <div class="product-img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/product1.jpeg" alt="이미지">
                        </div>
                        <div class="product-info">
                            <p>브랜드</p>
                            <p>상품명</p>
                            <p>거품가격</p>
                            <p>할인율/찐가격</p>
                            <p>평점</p>
                        </div>
                    </div>
                    <div class="product-box"> 
                        <div class="product-img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/product1.jpeg" alt="이미지">
                        </div>
                        <div class="product-info">
                            <p>브랜드</p>
                            <p>상품명</p>
                            <p>거품가격</p>
                            <p>할인율/찐가격</p>
                            <p>평점</p>
                        </div>
                    </div>
                    <div class="product-box"> 
                        <div class="product-img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/product1.jpeg" alt="이미지">
                        </div>
                        <div class="product-info">
                            <p>브랜드</p>
                            <p>상품명</p>
                            <p>거품가격</p>
                            <p>할인율/찐가격</p>
                            <p>평점</p>
                        </div>
                    </div>
                    <div class="product-box"> 
                        <div class="product-img-box">
                            <img src="${pageContext.request.contextPath}/resources/images/product1.jpeg" alt="이미지">
                        </div>
                        <div class="product-info">
                            <p>브랜드</p>
                            <p>상품명</p>
                            <p>거품가격</p>
                            <p>할인율/찐가격</p>
                            <p>평점</p>
                        </div>
                    </div>
                </div>
                <div class="page-box">
                    <span>1</span>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <a href="">5</a>
                    <a href="">6</a>
                    <a href="">7</a>
                    <a href="">8</a>
                    <a href="">9</a>
                    <a href="">10</a>
                </div>
            </div>
        </div>
    </div>
</main>