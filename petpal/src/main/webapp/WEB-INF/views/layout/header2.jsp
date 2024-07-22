<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
window.addEventListener('load', function() {
	document.querySelector('img.searchButton').addEventListener('click', function() {
		const f = document.searchForm;
		
		if (! f.kwd.value.trim()) {
			f.kwd.focus();
			alert('검색어를 입력하세요')
			return;
		}
		
		f.kwd.value = f.kwd.value.trim().replaceAll(' ', '');
		
		f.action = '${pageContext.request.contextPath}/products/search/${species}/0/0';
		
		f.submit();
	});
});
</script>

	<header>
            <div class="evtpreview">
                <div class="event-left">
                    <a href="#"><p>친구 초대하면 5000포인트 지급 !</p></a>
                </div>
                <div class="event-right">
                    <a href="#">
                    <p>7월 한정 초특가 세일 !</p>
                    <p>지금 확인하러 가기</p></a>
                </div>
            </div>
            <div id="head1">
                <div style="width: 200px;"></div>
                <div class="logo-container">
                   <a href="${pageContext.request.contextPath}/"> <img src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
                    <p class="name"><a href="${pageContext.request.contextPath}/"><span class="highlight">PET</span>PAL</a></p>
                </div>
                <div class="search">
                	<form name="searchForm" action="" method="get">
	                    <input name="kwd" type="text" placeholder="어떤 상품을 찾고있개 ?" value="${not empty param.kwd ? param.kwd : ''}">
	                    <a><img class="searchButton" src="${pageContext.request.contextPath}/resources/images/search.png" ></a>
                	</form>
                </div>
                <div class="more">
                	<div class="more">
					    <c:choose>
					        <c:when test="${empty sessionScope.member}">
					            <a href="${pageContext.request.contextPath}/member/login"><img src="${pageContext.request.contextPath}/resources/images/heart.png" alt="찜하기"></a>
					            <a href="${pageContext.request.contextPath}/member/login"><img src="${pageContext.request.contextPath}/resources/images/bell.png" alt="알림"></a>
					            <a href="${pageContext.request.contextPath}/member/login"><img src="${pageContext.request.contextPath}/resources/images/person.png" alt="사용자"></a>
					            <a href="${pageContext.request.contextPath}/member/login"><img src="${pageContext.request.contextPath}/resources/images/cart.png" alt="장바구니"></a>
					        </c:when>
					        <c:otherwise>
					            <a href="${pageContext.request.contextPath}/myPage2/likelist"><img src="${pageContext.request.contextPath}/resources/images/heart.png" alt="찜하기"></a>
					            <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/bell.png" alt="알림"></a>
					            <a href="${pageContext.request.contextPath}/myPage2/orderlist"><img src="${pageContext.request.contextPath}/resources/images/person.png" alt="사용자"></a>
					            <a href="${pageContext.request.contextPath}/myPage/cart"><img src="${pageContext.request.contextPath}/resources/images/cart.png" alt="장바구니"></a>
					        </c:otherwise>
					    </c:choose>
					</div>

                </div>
                <div style="width:200px;"></div>
            </div>
            <nav class="head2">
                <div class="menu">
                    <div class="dropdown">
                        <button class="dropbtn">
                            <img src="${pageContext.request.contextPath}/resources/images/menu.png" ><p style="padding-left: 5px;">카테고리</p>
                        </button>
                        <div class="dropdown-content">
                        	<a href="${pageContext.request.contextPath}/products/category/${species}">전체</a>
                           <c:forEach items="${categories}" var="category">
                           	<a href="${pageContext.request.contextPath}/products/category/${species}/${category.CATEGORYNUM}/0">${category.CATEGORYNAME}</a>
                           </c:forEach>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="menu2">
                        <span><a href="${pageContext.request.contextPath}/products/recent/${species}/0"><img src="${pageContext.request.contextPath}/resources/images/new.png" ><p>신상품</p></a></span>
                        <span><a href="${pageContext.request.contextPath}/products/best/${species}/0"><img src="${pageContext.request.contextPath}/resources/images/best.png"><p>베스트</p></a></span>
                        <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/saleTag.png"><p>기획 상품</p></a></span>
                        <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/love.png"><p>맞춤 상품</p></a></span>
                         <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/present.png"><p>이벤트</p></a></span>
                    </div>
                </div>
                <div class="pet-dropdown">
                    <select id="pet-selector">
                        <option value="dog">강아지</option>
                        <option value="cat">고양이</option>
                    </select>
                </div>
                <div style="width: 200px;"></div>
            </nav>
        </header>