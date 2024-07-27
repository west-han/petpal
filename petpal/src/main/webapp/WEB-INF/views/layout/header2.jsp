<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
window.addEventListener('load', function() {
    document.querySelector('img.searchButton').addEventListener('click', function() {
        const f = document.searchForm;
        
        if (! f.kwd.value.trim()) {
            f.kwd.focus();
            alert('검색어를 입력하세요');
            return;
        }
        
        f.kwd.value = f.kwd.value.trim().replaceAll(' ', '');
        
        f.action = '${pageContext.request.contextPath}/product/search/${sessionScope.species}/0/0';
        
        f.submit();
    });
    
    document.querySelector('#pet-selector').addEventListener('change', function() {
        const url = '${pageContext.request.contextPath}/setSpecies/' + this.value;
        location.href = url;
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
                <p>지금 확인하러 가기</p>
            </a>
        </div>
    </div>
    <div id="head1">
        <div class="logo-container">
            <a href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/resources/images/logo.png">
            </a>
            <p class="name"><a href="${pageContext.request.contextPath}/"><span class="highlight">PET</span>PAL</a></p>
        </div>
        <div class="search">
            <form name="searchForm" action="" method="get">
                <input name="kwd" type="text" placeholder="어떤 상품을 찾고있${sessionScope.species == 1 ? '개' : '냥'}?" value="${not empty param.kwd ? param.kwd : ''}">
                <a><img class="searchButton" src="${pageContext.request.contextPath}/resources/images/search.png"></a>
            </form>
        </div>
        <div class="more">
                <c:choose>
                
                    <c:when test="${not empty sessionScope.member && sessionScope.member.authority == 'ADMIN'}">
                    	<div class="admindown">
                        <a href="${pageContext.request.contextPath}/admin/"><img src="${pageContext.request.contextPath}/resources/images/admin.png" alt="관리자페이지"></a>
                        <a href="${pageContext.request.contextPath}/member/logout"><img src="${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a>
                    	</div>
                    </c:when>
                    
                    <c:when test="${empty sessionScope.member}">
                        <div class="dropdown">
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/person2.png" alt="사용자" class="login-before"></a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/member/login" class="dropdown-button login-button">로그인</a>
                                <a href="${pageContext.request.contextPath}/member/join" class="dropdown-button signup-button">회원가입</a>
                            </div>
                        </div>
                    </c:when>
                    
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/myPage2/likelist"><img src="${pageContext.request.contextPath}/resources/images/heart.png" alt="찜하기"></a>
                        <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/bell.png" alt="알림"></a>
                        <div class="dropdown">
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/images/person.png" alt="사용자"></a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/myPage2/orderlist" class="dropdown-button login-button">마이페이지</a>
                                <a href="${pageContext.request.contextPath}/member/logout" class="dropdown-button signup-button">로그아웃</a>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/myPage/${sessionScope.species}/cart"><img src="${pageContext.request.contextPath}/resources/images/cart.png" alt="장바구니"></a>
                    </c:otherwise>
                    
                </c:choose>
            </div>
        </div>
    <nav class="head2">
        <div class="menu">
            <div class="dropdown">
                <button class="dropbtn">
                    <img src="${pageContext.request.contextPath}/resources/images/menu.png"><p style="padding-left: 5px;">카테고리</p>
                </button>
                <div class="dropdown-content">
                    <a href="${pageContext.request.contextPath}/product/category/${species}">전체</a>
                    <c:forEach items="${categories}" var="category">
                        <a href="${pageContext.request.contextPath}/product/category/${species}/${category.CATEGORYNUM}/0">${category.CATEGORYNAME}</a>
                    </c:forEach>
                </div>
            </div>
            <div class="line"></div>
            <div class="menu2">
                <span><a href="${pageContext.request.contextPath}/product/recent/${species}/0"><img src="${pageContext.request.contextPath}/resources/images/new.png"><p>신상품</p></a></span>
                <span><a href="${pageContext.request.contextPath}/product/best/${species}/0"><img src="${pageContext.request.contextPath}/resources/images/best.png"><p>베스트</p></a></span>
                <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/saleTag.png"><p>기획 상품</p></a></span>
                <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/love.png"><p>맞춤 상품</p></a></span>
                <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/present.png"><p>이벤트</p></a></span>
            </div>
        </div>
        <div class="pet-dropdown">
            <select id="pet-selector" name="species">
                <option value="1" ${sessionScope.species == 1 ? 'selected' : ''}>강아지</option>
                <option value="2" ${sessionScope.species == 2 ? 'selected' : ''}>고양이</option>
            </select>
        </div>
    </nav>
</header>
