<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dog.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
    <title>PETPAL : 멍냥 반려동물 용품</title>
<main>
            <div class="carousel">
                <div class="slides">
                    <div class="slide" style="background-image: url('img/banner1.jpg')"></div>
                    <div class="slide" style="background-image: url('img/banner2.jpg');"></div>
                    <div class="slide" style="background-image: url('img/banner3.jpg');"></div>
                </div>
                <div class="dots">
                    <span class="dot" onclick="currentSlide(0)"></span>
                    <span class="dot" onclick="currentSlide(1)"></span>
                    <span class="dot" onclick="currentSlide(2)"></span>
                </div>
            </div>

            <div id="timecontainer">
                <div class="time">
                    <div class="left">
                        <p>타임 세일</p>
                        <img src="img/clock.png">
                    </div>
                    <span>
                        <p>남은 시간:</p>
                        <p>00 : 22 : 26</p>
                    </span>
                </div>
                <div class="time-sale-divider"></div>
                <div class="product">
                    <div class="property-card">
                        <a href="#">
                          <div class="property-image">
                            <img src="img/product1.jpeg" alt="">
                            <div class="property-image-title">
                            </div>
                          </div></a>
                        <div class="property-description">
                          <h5> 쿨매트 </h5>
                          <p>쿨매트 팝니다</p>
                          <p>5000원</p>
                        </div>
                      </div>
                      <div class="property-card">
                        <a href="#">
                          <div class="property-image">
                            <img src="img/product2.jpeg" alt="">
                            <div class="property-image-title">
                            </div>
                          </div>
                        </a>
                        <div class="property-description">
                          <h5> 테스트 명 </h5>
                          <p>테스트 설명란 입니다. 테스트에 관련된 설명을 작성해 주세요.</p>
                        </div>
                      </div>
                      <div class="property-card">
                        <a href="#">
                          <div class="property-image">
                            <img src="img/product1.jpeg" alt="">
                            <div class="property-image-title">
                            </div>
                          </div></a>
                        <div class="property-description">
                          <h5> 테스트 명 </h5>
                          <p>테스트 설명란 입니다. 테스트에 관련된 설명을 작성해 주세요.</p>
                        </div>
                      </div>
                      <div class="property-card">
                        <a href="#">
                          <div class="property-image">
                            <img src="img/product2.jpeg" alt="">
                            <div class="property-image-title">
                            </div>
                          </div></a>
                        <div class="property-description">
                          <h5> 테스트 명 </h5>
                          <p>테스트 설명란 입니다. 테스트에 관련된 설명을 작성해 주세요.</p>
                        </div>
                      </div>
                </div>
            </div>
            
            <div id="rankcontainer">
                <div class="rank">
                    <div class="left">
                        <p>랭킹 차트</p>
                        <img src="img/best.png" alt="">
                    </div>
                </div>
                <div class="progress-bar-container">
                    <p>베스트 리뷰</p>
                    <div class="progress-bar">
                        <p>인기 랭킹</p>
                    </div>
                </div>
                <div class="rankproduct">
                    <div class="item"></div>
                    <div class="item"></div>
                    <div class="item"></div>
                    <div class="item"></div>
                </div>
            </div>
            
        </main>