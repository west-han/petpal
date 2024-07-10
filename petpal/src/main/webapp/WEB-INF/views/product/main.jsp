<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<main>
    <div class="body-container">
        <div class="list-container list-h">
            <div class="left">
                <h2>간식</h2>
                <div class="category-box">
                    <ul class="list-w">
                        <li>사료</li>
                        <li>간식</li>
                        <li>건강관리</li>
                        <li>위생/배변</li>
                        <li>케어용품</li>
                        <li>목욕용품</li>
                        <li>하우스/스탭</li>
                        <li>급식기/급수기</li>
                        <li>산책/이동장</li>
                        <li>장난감</li>
                    </ul>
                </div>
                <div class="filter-box">
                    <ul class="list-w">
                        <li>가격</li>
                        <li>평점</li>
                        <li>브랜드</li>
                        <li>급여대상</li>
                        <li>주원료</li>
                        <li>기능</li>
                    </ul>
                </div>
            </div>

            <div class="right">
                <div class="subcategory-box">
                    <ul class="list-h subcategory-list">
                        <li>껌</li>
                        <li>육포</li>
                        <li>저키/트릿</li>
                        <li>비스켓/시리얼</li>
                        <li>소시지</li>
                        <li>캔/파우치</li>
                        <li>뼈/건조간식</li>
                        <li>수제간식</li>
                        <li>파우더</li>
                        <li>우유/음료</li>
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
                            <img src="product1.jpg" alt="이미지">
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
                            <img src="product1.jpg" alt="이미지">
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
                            <img src="product1.jpg" alt="이미지">
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
                            <img src="product1.jpg" alt="이미지">
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
                            <img src="product1.jpg" alt="이미지">
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