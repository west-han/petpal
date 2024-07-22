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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
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
        
        <div id="newcontainer">
            <div class="new title">
                <div class="left">
                    <img src="${pageContext.request.contextPath}/resources/images/new.png" alt="">
                    <p>신상품</p>
                </div>
                <a href="#"><span>더보기 ></span></a>
            </div>
            <div class="product">
                <c:forEach var="dto" items="${newList}" varStatus="status">
                    <a href="${pageContext.request.contextPath}/products/${dto.productNum}" class="item" style="background-image: url('${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}');">
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
                <a href="#"><span>더보기 ></span></a>
            </div>
            <div class="product">
                <c:forEach var="dto" items="${bestList}" varStatus="status">
                    <a href="${pageContext.request.contextPath}/products/${dto.productNum}" class="item" style="background-image: url('${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}');">
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
                <c:forEach var="dto" items="${customList}" varStatus="status">
                    <a href="${pageContext.request.contextPath}/products/${dto.productNum}" class="item" style="background-image: url('${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}');">
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
                <c:forEach var="dto" items="${specialList}" varStatus="status">
                    <a href="${pageContext.request.contextPath}/products/${dto.productNum}" class="item" style="background-image: url('${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}');">
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

        <a href="#" class="btn_gotop">
            <img src="${pageContext.request.contextPath}/resources/images/toparrow.png" class="top_arrow">
            <span class="glyphicon-chevron-up"></span>
        </a>
    </main>
</body>
</html>
