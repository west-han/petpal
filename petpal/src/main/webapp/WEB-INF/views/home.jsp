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
                <a href="${pageContext.request.contextPath}/product/1/69" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/1.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            펫베오 5초 순면 핸즈프리 리드줄 소라
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">32%</label>
                            <label class="fs-5 pe-2 fw-semibold">13,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">19,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/141" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/2.png');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            웨어러블 UFO 강아지 자동리드줄 2세대
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">30%</label>
                            <label class="fs-5 pe-2 fw-semibold">37,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">53,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/142" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/3.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            러프웨어 탑로프 목줄 블루 S
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">19%</label>
                            <label class="fs-5 pe-2 fw-semibold">38,900원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">48,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/143" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/4.png');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            젠틀우프 워크하드 목줄 올리브
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">32%</label>
                            <label class="fs-5 pe-2 fw-semibold">24,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">34,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/144" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/5.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            로이코 트릿토이
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">36%</label>
                            <label class="fs-5 pe-2 fw-semibold">89,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">139,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/145" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/6.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            펫홀릭 노즈워크 주말농장
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">12%</label>
                            <label class="fs-5 pe-2 fw-semibold">26,500원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">30,000원</label>
                        </div>
                    </div>
                    
                </a>
                <a href="${pageContext.request.contextPath}/product/1/146" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/7.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                           에코펫위드 꽈배기 노즈워크
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">49%</label>
                            <label class="fs-5 pe-2 fw-semibold">5,000원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">9,900원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/40" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/8.png');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            이즈칸 독 퍼포먼스 어덜트 6.5kg
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">18%</label>
                            <label class="fs-5 pe-2 fw-semibold">44,500원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">54,000원</label>
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
                <a href="${pageContext.request.contextPath}/product/1/147" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/11.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            패리스독 펫츠플레이 미디움볼 라텍스토이 3종세트
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 fw-semibold">10,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/148" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/22.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            미밍코 핑크볼 3개입
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 fw-semibold">14,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/149" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/33.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            패리스독 굿모닝 라텍스토이 4종세트
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 fw-semibold">11,500원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/150" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/44.png');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            도기맨 풀리데코 장난감 토끼
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">15%</label>
                            <label class="fs-5 pe-2 fw-semibold">5,500원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">6,500원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/151" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/55.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            크레용펫 당근 실타래 로프토이
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">5%</label>
                            <label class="fs-5 pe-2 fw-semibold">1,900원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">2,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/152" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/66.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            [키니키니X어프어프]DOT FLOWER BEAR HARNESS-NAVY(하네스-H형)
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">20%</label>
                            <label class="fs-5 pe-2 fw-semibold">34,500원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">43,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/153" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/77.jpg');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            펫츠랜드 루나 프릴 하네스 밀키블루
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">38%</label>
                            <label class="fs-5 pe-2 fw-semibold">14,900원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">24,000원</label>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/product/1/154" class="item" style="background-image: url('${pageContext.request.contextPath}/resources/images/main/88.png');">
                    <div class="p-2">
                        <div class="text-truncate fw-semibold pb-1">
                            해리스힐 메쉬원버튼 입마개 그레이
                        </div>
                        <div class="pb-1">
                            <label class="fs-5 pe-2 text-danger">10%</label>
                            <label class="fs-5 pe-2 fw-semibold">8,900원</label>
                            <label class="fs-6 fw-light text-decoration-line-through">9,900원</label>
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
