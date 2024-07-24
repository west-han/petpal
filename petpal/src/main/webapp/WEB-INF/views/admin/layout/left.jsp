<%@ page contentType="text/html; charset=UTF-8" %>

    <nav class="left-nav">
    <ul id="js-menu" class="menu">
        <li class="date-greeting">
            <div id="current-date" class="date"></div>
            <div class="greeting">안녕하세요! <span class="highlight">ADMIN</span>님<br>오늘도 즐거운 하루 되세요 :)</div>
        </li>
        <li class="menu--item" data-path="/order">
            <a href="${pageContext.request.contextPath}/admin/order/status" class="menu--link" title="주문 / 배송 관리">
                <i class="menu--icon fa-solid fa-box"></i>
                <span class="menu--label">주문 / 배송 관리</span>
            </a>
        </li>

        <li class="menu--item menu--item__has_sub_menu" data-path="/product">
            <label class="menu--link" title="상품 및 재고 관리">
                <i class="menu--icon fa-solid fa-cube"></i>
                <span class="menu--label">상품 및 재고 관리</span>
            </label>
            <ul class="sub_menu">
                <li class="sub_menu--item">
                    <a href="${pageContext.request.contextPath}/admin/product/list" class="sub_menu--link" data-path="/product/list">상품 관리</a>
                </li>
                <li class="sub_menu--item">
                    <a href="${pageContext.request.contextPath}/admin/product/special" class="sub_menu--link" data-path="/product/special">특가 관리</a>
                </li>
            </ul>
        </li>

        <li class="menu--item menu--item__has_sub_menu" data-path="/review">
            <label class="menu--link" title="리뷰 및 문의">
                <i class="menu--icon fa-solid fa-question-circle"></i>
                <span class="menu--label">리뷰 및 문의</span>
            </label>
            <ul class="sub_menu">
                <li class="sub_menu--item">
                    <a href="${pageContext.request.contextPath}/admin/review/list" class="sub_menu--link" data-path="/review/list">리뷰 관리</a>
                </li>
                <li class="sub_menu--item">
                    <a href="${pageContext.request.contextPath}/admin/onetoone/list" class="sub_menu--link" data-path="/inquiry/list">문의 관리</a>
                </li>
            </ul>
        </li>

        <li class="menu--item menu--item__has_sub_menu" data-path="/notification">
            <label class="menu--link" title="알림 / 이벤트 관리">
                <i class="menu--icon fa-solid fa-bell"></i>
                <span class="menu--label">알림 / 이벤트 관리</span>
            </label>
            <ul class="sub_menu">
                <li class="sub_menu--item">
                    <a href="${pageContext.request.contextPath}/admin/notification/list" class="sub_menu--link" data-path="/notification/list">알림 관리</a>
                </li>
                <li class="sub_menu--item">
                    <a href="${pageContext.request.contextPath}/admin/event/list" class="sub_menu--link" data-path="/event/list">이벤트 관리</a>
                </li>
            </ul>
        </li>

        <li class="menu--item menu--item__has_sub_menu" data-path="/member">
            <label class="menu--link" title="고객 정보 관리">
                <i class="menu--icon fa-solid fa-user"></i>
                <span class="menu--label">고객 정보 관리</span>
            </label>
            <ul class="sub_menu">
                <li class="sub_menu--item">
                    <a href="${pageContext.request.contextPath}/admin/member/list" class="sub_menu--link" data-path="/member/list">고객 정보 관리</a>
                </li>
                <li class="sub_menu--item">
                    <a href="${pageContext.request.contextPath}/admin/coupon/list" class="sub_menu--link" data-path="/coupon/list">쿠폰 관리</a>
                </li>
            </ul>
        </li>

        <li class="menu--item" data-path="/notice">
            <a href="${pageContext.request.contextPath}/admin/notice/list" class="menu--link" title="공지 사항">
                <i class="menu--icon fa-solid fa-headset"></i>
                <span class="menu--label">공지 사항</span>
            </a>
        </li>

        <li class="menu--item" data-path="/sales">
            <a href="${pageContext.request.contextPath}/admin/sales" class="menu--link" title="매출 현황">
                <i class="menu--icon fa-solid fa-chart-line"></i>
                <span class="menu--label">매출 현황</span>
            </a>
        </li>
    </ul>
</nav>

    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        var menuItems = document.querySelectorAll('.menu--item__has_sub_menu .menu--link');

        menuItems.forEach(function (menuItem) {
            menuItem.addEventListener('click', function () {
                var parent = this.parentElement;
                parent.classList.toggle('menu--subitems__opened');
            });
        });
    });
    </script>
    <script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function () {
		    // 현재 날짜 설정
		    var currentDateElement = document.getElementById('current-date');
		    var currentDate = new Date();
		    var options = { year: 'numeric', month: '2-digit', day: '2-digit', weekday: 'long' };
		    var formattedDate = currentDate.toLocaleDateString('ko-KR', options);
		    currentDateElement.textContent = formattedDate;
		    // 현재 페이지 URL 경로 가져오기
		    var currentPagePath = window.location.pathname;
		    
		    // 메뉴 항목 중 현재 페이지와 일치하는 항목 찾기
		    var menuItems = document.querySelectorAll('.menu--item, .sub_menu--item');
		    menuItems.forEach(function (menuItem) {
		        var link = menuItem.querySelector('.menu--link, .sub_menu--link');
		        if (link && currentPagePath.includes(link.getAttribute('href'))) {
		            menuItem.style.backgroundColor = '#f0f0f0';  // 선택된 항목의 배경색 변경
		            link.style.color = '#E4A951';  // 선택된 항목의 텍스트 색상 변경
		        }
		    });
		});
</script>

