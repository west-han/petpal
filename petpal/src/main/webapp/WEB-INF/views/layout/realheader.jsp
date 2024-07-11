<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <link rel="stylesheet" href="./css/dog.css" />
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
                   <a href="#"> <img src="img/logo.png"></a>
                    <p class="name"><a href="#"><span class="highlight">PET</span>PAL</a></p>
                </div>
                <div class="search">
                    <input type="text" placeholder="어떤 상품을 찾고있개 ?">
                    <img src="./img/search.png" >
                </div>
                <div class="more">
                    <img src="img/heart.png" alt="찜하기">
                    <img src="img/bell.png" alt="알림">
                    <img src="img/person.png" alt="사용자">
                    <img src="img/cart.png" alt="장바구니">
                </div>
                <div style="width:200px;"></div>
            </div>
            <nav class="head2">
                <div class="menu">
                    <div class="dropdown">
                        <button class="dropbtn">
                            <img src="img/menu.png" ><p style="padding-left: 5px;">카테고리</p>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">사료</a>
                            <a href="#">간식</a>
                            <a href="#">건강관리</a>
                            <a href="#">위생/배변</a>
                            <a href="#">케어용품</a>
                            <a href="#">목욕용품</a>
                            <a href="#">하우스/스탭</a>
                            <a href="#">급식기/급수기</a>
                            <a href="#">산책/이동장</a>
                            <a href="#">장난감</a>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="menu2">
                        <span><a href="#"><img src="img/new.png" ><p>신상품</p></a></span>
                        <span><a href="#"><img src="img/best.png"><p>베스트</p></a></span>
                        <span><a href="#"><img src="img/present.png"><p>이벤트</p></a></span>
                        <span><a href="#"><img src="img/saleTag.png"><p>특가 상품</p></a></span>
                        <span><a href="#"><img src="img/clock.png"><p>타임 세일</p></a></span>
                        <span><a href="#"><img src="img/love.png"><p>맞춤 상품</p></a></span>
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