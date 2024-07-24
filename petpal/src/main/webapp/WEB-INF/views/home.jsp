<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
    <title>PETPAL : 멍냥 반려동물 용품</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <script>
        let slideIndex = 0;
        const slides = document.getElementsByClassName("slide");
        const dots = document.getElementsByClassName("dot");

        function showSlides() {
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) {
                slideIndex = 1;
            }
            for (let i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            setTimeout(showSlides, 5000);
        }

        function currentSlide(n) {
            slideIndex = n;
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (let i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex].style.display = "block";
            dots[slideIndex].className += " active";
        }

        document.addEventListener("DOMContentLoaded", showSlides);
    </script>
    <script>
    $(function() {
        $('.btn_gotop').hide();
    });

    $(window).scroll(function() {
        if ($(this).scrollTop() > 300) {
            $('.btn_gotop').show();
        } else {
            $('.btn_gotop').hide();
        }
    });

    $('.btn_gotop').click(function() {
        $('html, body').animate({scrollTop: 0}, 400);
        return false;
    });
    </script>
</head>
<body>
    <main>
        <div class="carousel">
            <div class="slides">
                <div class="slide" style="background-image: url('${pageContext.request.contextPath}/resources/images/banner1.jpg')"></div>
                <div class="slide" style="background-image: url('${pageContext.request.contextPath}/resources/images/banner2.png');"></div>
                <div class="slide" style="background-image: url('${pageContext.request.contextPath}/resources/images/banner3.png');"></div>
            </div>
            <div class="dots">
                <span class="dot" onclick="currentSlide(0)"></span>
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
            </div>
        </div>
        <!-- 맞춤상품 섹션 -->
        <div id="customcontainer">
            <div class="custom title">
                <div class="left">
                    <img src="${pageContext.request.contextPath}/resources/images/love.png" alt="">
                    <p>맞춤상품</p>
                </div>
                <a href="#"><span>더보기 ></span></a>
            </div>
            <div class="product">
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/custom1.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            펫트리움 쓱쓱 젤리 클리퍼
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">7%</label>
                            <label class="fs-5 pe-2 fw-semibold">13,900원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">14,900원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/2.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            세븐펫 오래오래 터키츄 링 20개입
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">54%</label>
                            <label class="fs-5 pe-2 fw-semibold">58,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">26,900원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/3.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            아띠지기 아띠트릿 단호박 40g
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">34%</label>
                            <label class="fs-5 pe-2 fw-semibold">9,900원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">15,000원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/4.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            츄통령 저염황태채 40g
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">35%</label>
                            <label class="fs-5 pe-2 fw-semibold">10,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">6,500원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/5.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            개과천선 노멜 애견방석 다크카키
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">68%</label>
                            <label class="fs-5 pe-2 fw-semibold">130,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">42,000원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/6.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            구루구루 슬림핏 펫 매트 롤형 크림
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">10%</label>
                            <label class="fs-5 pe-2 fw-semibold">49,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">44,100원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/7.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            페디칼 웰빙죽 소고기&전복 12개입
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">10%</label>
                            <label class="fs-5 pe-2 fw-semibold">24,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">21,600원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/8.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            38.5℃ 눈 건강에 좋은 루테인 아스잔틴 한스푼 60g
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">17%</label>
                            <label class="fs-5 pe-2 fw-semibold">30,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">25,000원</label>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div id="newcontainer">
            <div class="new title">
                <div class="left">
                    <img src="${pageContext.request.contextPath}/resources/images/new.png" alt="">
                    <p>신상품</p>
                </div>
                <span><a href="${pageContext.request.contextPath}/product/recent/${species}/0">더보기 ></a></span>
            </div>
            <div class="product">
                <c:forEach var="dto" items="${newList}" varStatus="status">
                    <a href="${pageContext.request.contextPath}/product/${sessionScope.species }/${dto.productNum}" class="item" style="background-image: url('${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}');">
                        <div class="p-2">
                            <div class="text-truncate fw-semibold pb-1">
                                ${dto.productName}
                            </div>
                            <div class="pb-1">
                                <c:if test="${dto.discountRate != 0}">
                                    <label class="fs-5 pe-2 text-danger">${dto.discountRate}%</label>
                                </c:if>
                                <label class="fs-5 pe-2 fw-semibold"><fmt:formatNumber value="${dto.price * (100 - dto.discountRate) / 100}" />원</label>
                                <c:if test="${dto.discountRate != 0}">
                                    <label class="fs-6 fw-light text-decoration-line-through"><fmt:formatNumber value="${dto.price}"/>원</label>
                                </c:if>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>

        <div id="rankcontainer">
            <div class="rank title">
                <div class="left">
                    <img src="${pageContext.request.contextPath}/resources/images/best.png" alt="">
                    <p>베스트</p>
                </div>
                <span><a href="${pageContext.request.contextPath}/product/best/${species}/0">더보기 ></a></span>
            </div>
            <div class="product">
                <c:forEach var="dto" items="${bestList}" varStatus="status">
                    <a href="${pageContext.request.contextPath}/product/${sessionScope.species}/${dto.productNum}" class="item" style="background-image: url('${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}');">
                        <div class="p-2">
                            <div class="text-truncate fw-semibold pb-1">
                                ${dto.productName}
                            </div>
                            <div class="pb-1">
                                <c:if test="${dto.discountRate != 0}">
                                    <label class="fs-5 pe-2 text-danger">${dto.discountRate}%</label>
                                </c:if>
                                <label class="fs-5 pe-2 fw-semibold"><fmt:formatNumber value="${dto.price * (100 - dto.discountRate) / 100}" />원</label>
                                <c:if test="${dto.discountRate != 0}">
                                    <label class="fs-6 fw-light text-decoration-line-through"><fmt:formatNumber value="${dto.price}"/>원</label>
                                </c:if>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>

        <!-- 기획상품 섹션 -->
        <div id="specialcontainer">
            <div class="special title">
                <div class="left">
                    <img src="${pageContext.request.contextPath}/resources/images/special.png" alt="">
                    <p>기획상품</p>
                </div>
                <a href="#"><span>더보기 ></span></a>
            </div>
            <div class="product">
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/special1.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            기획 상품 1
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">15%</label>
                            <label class="fs-5 pe-2 fw-semibold">12,750원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">15,000원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/special2.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            기획 상품 2
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">25%</label>
                            <label class="fs-5 pe-2 fw-semibold">18,750원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">25,000원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/special3.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            기획 상품 3
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">35%</label>
                            <label class="fs-5 pe-2 fw-semibold">22,750원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">35,000원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/special4.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            기획 상품 4
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">45%</label>
                            <label class="fs-5 pe-2 fw-semibold">24,750원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">45,000원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/special5.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            기획 상품 5
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">55%</label>
                            <label class="fs-5 pe-2 fw-semibold">22,500원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">50,000원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/special6.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            기획 상품 6
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">65%</label>
                            <label class="fs-5 pe-2 fw-semibold">21,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">60,000원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/special7.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            기획 상품 7
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">75%</label>
                            <label class="fs-5 pe-2 fw-semibold">17,500원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">70,000원</label>
                        </div>
                    </div>
                </a>
                <a href="#" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/special8.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            기획 상품 8
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">85%</label>
                            <label class="fs-5 pe-2 fw-semibold">12,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">80,000원</label>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <a href="#" class="btn_gotop">
            <img src="${pageContext.request.contextPath}/resources/images/toparrow.png" class="top_arrow">
            <span class="glyphicon-chevron-up"></span>
        </a>
    </main>
</body>
</html>
