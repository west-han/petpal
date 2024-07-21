<%@ page contentType="text/html; charset=UTF-8" %>

    <nav class="left-nav">
        <ul id="js-menu" class="menu">
	        <li class="date-greeting">
	            <div class="date">2024-07-12 금요일</div>
	            <div class="greeting">안녕하세요! <span class="highlight">ADMIN</span>님<br>오늘도 즐거운 하루 되세요 :)</div>
	        </li>
            <li class="menu--item menu--item__has_sub_menu">
                <label class="menu--link" title="주문 / 배송 관리">
                    <i class="menu--icon fa-solid fa-box"></i>
                    <span class="menu--label">주문 / 배송 관리</span>
                </label>
                <ul class="sub_menu">
                    <li class="sub_menu--item">
                        <a href="#" class="sub_menu--link">주문 현황</a>
                    </li>
                    <li class="sub_menu--item">
                        <a href="#" class="sub_menu--link">배송 관리</a>
                    </li>
                </ul>
            </li>

            <li class="menu--item menu--item__has_sub_menu">
                <label class="menu--link" title="상품 및 재고 관리">
                    <i class="menu--icon fa-solid fa-cube"></i>
                    <span class="menu--label">상품 및 재고 관리</span>
                </label>
                <ul class="sub_menu">
                    <li class="sub_menu--item">
                        <a href="${pageContext.request.contextPath}/admin/product/list" class="sub_menu--link">상품 관리</a>
                    </li>
                    <li class="sub_menu--item">
                        <a href="#" class="sub_menu--link">특가 관리</a>
                    </li>
                </ul>
            </li>

            <li class="menu--item menu--item__has_sub_menu">
                <label class="menu--link" title="1:1 문의">
                    <i class="menu--icon fa-solid fa-question-circle"></i>
                    <span class="menu--label">리뷰 및 문의</span>
                </label>
                <ul class="sub_menu">
                    <li class="sub_menu--item">
                        <a href="#" class="sub_menu--link">리뷰 관리</a>
                    </li>
                    <li class="sub_menu--item">
                        <a href="#" class="sub_menu--link">문의 관리</a>
                    </li>
                </ul>
            </li>

            <li class="menu--item menu--item__has_sub_menu">
                <label class="menu--link" title="알림 / 이벤트 관리">
                    <i class="menu--icon fa-solid fa-bell"></i>
                    <span class="menu--label">알림 / 이벤트 관리</span>
                </label>
                <ul class="sub_menu">
                    <li class="sub_menu--item">
                        <a href="#" class="sub_menu--link">알림 관리</a>
                    </li>
                    <li class="sub_menu--item">
                        <a href="#" class="sub_menu--link">이벤트 관리</a>
                    </li>
                </ul>
            </li>
            <li class="menu--item menu--item__has_sub_menu">
                <label class="menu--link" title="고객 정보 관리">
                    <i class="menu--icon fa-solid fa-user"></i>
                    <span class="menu--label">고객 정보 관리</span>
                </label>
                <ul class="sub_menu">
                <li class="sub_menu--item">
                        <a href="${pageContext.request.contextPath}/admin/member/list" class="sub_menu--link">고객 정보 관리</a>
                    </li>
                    <li class="sub_menu--item">
                        <a href="${pageContext.request.contextPath}/admin/coupon/list" class="sub_menu--link">쿠폰 관리</a>
                    </li>
                </ul>
            </li>
            <li class="menu--item">
                <a href="#" class="menu--link" title="공지 사항">
                    <i class="menu--icon fa-solid fa-headset"></i>
                    <span class="menu--label">공지 사항</span>
                </a>
                
                
            </li>
			<li class="menu--item">
			                <a href="#" class="menu--link" title="매출 현황">
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

