<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

.body-container2 {
	width: 1300px;
	margin: 20px auto;
	margin-bottom: 60px;
	color: #434347;
}

.body-main {
	width: 100%;
}

.body-sep {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

.body-left, .body-right {
	width: 500px;
}

.body-left {
	padding-left: 30px;
	width: 50%;
}

.body-right {
	padding-right: 30px;
	display: flex;
	justify-content: center;
}

.body-right form {
	width: 500px;
}

.lg-img img { height: 530px; width: 580px; object-fit: cover;}
.md-img img { width: 200px; height: 200px; cursor: pointer; object-fit: cover; }
.sm-img img { width: 80px; height: 80px; cursor: pointer; object-fit: cover; }

.img-buy img {
	border-radius: 10px;
	width: 
}

.imgs {
	margin-top: 15px;
	margin-left: 10px;
}

.body-right .stock {
	display: flex;
	justify-content: center;
}

.body-right .stock-msg {
	font-size: 18px;
	font-weight: bold;
	color: gray;
	margin-bottom: 25px;
}

.price, .point, .delivery, .option, .total-price, .buttons {
	margin-top: 30px;
	color: #434347;
}

.category {
	margin-bottom: 8px;
	font-size: 13px;
}

.productName {
	font-size: 25px;
	font-weight: bold;
}

.price, .point, .buttons, .button-buy {
	display: flex;
}

.price div:first-child {
 	color: #DB9700;
 	font-size: 20px;
 	font-weight: bold;
}
 
.price div:last-child {
 	margin-left: 15px;
}
 
.price .discounted-price {
 	font-size: 20px;
 	font-weight: bold;
}

.price .original-price {
	font-size: 14px;
	text-decoration: line-through;
}

.point, .delivery, .option, .total-price, .buttons {
 	font-size: 14px;
}
 
.point div:first-child {
	font-size: 15px;
	font-weight: bold;
	margin-right: 140px;
}

.delivery {
	display: flex;
	margin-top: 40px;
}

.delivery div:first-child {
	font-size: 15px;
	font-weight: bold;
	margin-right: 170px;
}

.option {
	font-weight: bold;
	font-size: 15px;
}

.option-tab1, .option-tab2 {
	width: 70%;
	height: 38px;
	margin-top: 15px;
}

.option-tab1 option, .option-tab2 option {
	margin-left: 10px;
	border: 1px solid #CFCFCF;
}

hr {
	border-bottom: 1px solid #A6A6A6;
	margin-top: 40px;
	width: 500px;
}

.total-text {
	font-weight: bold;
	font-size: 18px;
}

.total-detail {
	margin-top: 20px;
}

.total-detail .product-totalAmount {
	color: #E4B075;
	font-weight: bold;
}

.buttons .btn {
	font-size: 15px;	
	font-weight: bold;
	padding: 10px 75px;
}

.buttons .button-wish {
	margin-left: 5px;
}

.buttons .btnbtn-productCart {
	border: 1px solid #BDBDBD;
	background-color: white;
	margin: 0 20px;
}

.buttons .btn-buySend {
	border: none;
	background: #E4B075;
	color: white;
}

.buttons .wish {
	padding-right:10px;
	padding-top: 5px;
	border: none;
	background-color: rgba(0,0,0,0);
	font-size: 24px;
	font-weight: bold;
}

select, button {
	cursor: pointer;
}

.qty-plus, .qty-minus, .qty-remove { cursor: pointer; }
.qty-plus:hover, .qty-minus:hover, .qty-remove:hover { color: #0b83e6; }

.nav-tabs .nav-link {
	min-width: 433px;
	color: #BDBDBD;
	font-weight: bold;
	border: none;
	font-size: 18px;
	padding-bottom: 15px;
	text-align: center;
}

.nav-tabs .nav-link.active {
	border-bottom: 3px solid #E4B075;
	color: #E4B075;
	outline: none;
	
}

.tab-content {
	border: none;
}

.tab-pane { min-height: 300px; }

.recomm-product .recomm-title {
	font-size: 20px;
	font-weight: bold;
	border-bottom: 3px solid #434347;
	padding-bottom: 16px;
}

.recomm-product .recomm-imgs {
	margin: 25px 20px 100px 20px;
	display: flex;
	justify-content: space-between;
}

.recomm-product .recomm-img:hover {
	cursor: pointer;
}

.recomm-product .recomm-img img {
	width: 180px; 
	height: 200px; 
	cursor: pointer; 
	object-fit: cover;
	border-radius: 5px;
}

.recomm-img div {
	 width: 180px;
	 margin-top: 17px;
}

.recomm-img .recomm-price span {
	margin-right: 5px;
	font-weight: bold;
}

.recomm-img .recomm-price span:first-child {
	color: #EBB078;

}

.review {
	margin-bottom: 100px;
}

.review-title p {
	font-size: 20px;
	border-bottom: 3px solid #434347;
	padding-bottom: 18px;
	margin-bottom: 0;
}

.star-sort {
	display: flex;
}

.star-box {
	display: flex;
	align-items: center;
	border-bottom: none;
}

.score-star { font-size: 0; letter-spacing: -4px; }

.score-star .item {
	font-size: 22px; 
	letter-spacing: 1px; 
	display: inline-block;
	text-decoration: none; 
	vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }

.score-star .on { color: #E4B075; }

.reviewSort-area .reviewSortNo {
	border: none;
	font-size: 18px;
	
}



.reviewSort-area {
	display: flex;
	align-items: center;
}

.review-content {
	padding-bottom: 20px;
}

.review-content .review-top {
	margin-top: 18px;
	display: flex;
	justify-content: space-between;
	font-size: 18px;
}

.review-content .review-top div:first-child {
	font-size: 18px;
}

.review-content .review-top div:last-child {
	margin-right: 15px;
}

.review-content .review-top-left label:last-child, .review-top div:last-child {
	color: #BDBDBD;
	font-weight: bold;
}

.review-content .review-top-left i {
	letter-spacing: -5px;
}

.review-content .review-top-left i:last-child {
	margin-right: 15px;
}

.review-content .review-option {
	margin: 10px 0 18px 0;
	font-size: 18px;
	color: #BDBDBD;
	font-weight: bold;
}

.review-content .review-img-content {
	display: flex;
	font-weight: bold;
	font-size: 18px;
}

.review-content .review-img-content img {
	width: 50px; 
	height: 50px; 
	object-fit: cover; 
	margin-right: 20px;
}

.qna .qna-title {
	border-bottom: 3px solid #434347;
}

.qna .qna-title p {
	font-size: 20px;
	font-weight: bold;
}

.deleteReview, .notifyReview { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .notifyReview:hover { font-weight: 500; color: #2478FF; }

.product-content {
	text-align: center;
}

.product-content img { 
	max-width: 1000px; 
}

.btnQuestion {
	background: #E4B075;
	color: white;
	font-weight: bold;
}

.qna-form textarea { width: 100%; height: 75px; resize: none; }
.qna-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.qna-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}

.deleteQuestion, .notifyQuestion { cursor: pointer; padding-left: 5px; }
.deleteQuestion:hover, .notifyQuestion:hover { font-weight: 500; color: #2478FF; }

.img-more {
	width: 1300px;
}

#detail.hidden {
	height: 1300px; 
	overflow: hidden;
}

#btnMore {
	font-size: 20px;
	border-radius: 10px;
	padding: 30px 30px;
	background: white;
	display: flex;
	justify-content: center;
	width: 1300px;
	margin-bottom: 50px;
	color: #E4B075;
}

.detailMore{position: relative;}

.detailMore:before {
    content: '';
    position: absolute;
    top: -90px; //맞게 조절
	left: 120px;
    display: block;
    width: 1300px;
    height: 96px;
    background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0), rgba(255, 255, 255, 0.8) 66%, rgba(255, 255, 255, 0.94) 83%, rgba(255, 255, 255, 0.98) 91%, #ffffff);
}







.btn_gotop {
    display:none;
    position:fixed;
    bottom:30px;
    right:90px;
    z-index:999;
    border:1px solid #ccc;
    outline:none;
    background-color:white;
    color:#333;
    cursor:pointer;
    padding:15px 20px;
    border-radius:100%;
    width: 60px;
    height: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.top_arrow {
    width: 50px; 
    height: auto;
}

.glyphicon-chevron-up {
    display: none; 
}

</style>

<div class="container">
	<div class="body-container">
		<div class="body-container2">
			<div class="body-main">
				<div class="row mt-4 body-sep">
					<div class="body-left">
						<div>
							<div class="lg-img">
								<img class="" 
								src="${pageContext.request.contextPath}/uploads/product/product_detail.jpg" class="img-buy">
							</div>
						</div>
						<div class="imgs">
							
								<div class="sm-img">
									<img 
									src="${pageContext.request.contextPath}/uploads/product/product_detail.jpg" class="img-buy">
								</div>
							
						</div>
					</div>
					
					<div class="body-right">
						<form name="buyForm">
								<!-- 
								<div class="stock">
									<label class="stock-msg">상품 재고가 없습니다.</label>
								</div>
								 -->
						
								<!-- 
								<div class="border rounded bg-light mt-2 p-2">
									<label class="fs-6 fw-semibold text-primary pe-2">${dto.classify == 200 ? "오늘의 특가" : "기획전"}</label>
									<label class="fs-6 fw-semibold pe-2 time-remaining">1일 10시간 남음</label>
									<label class="text-black-50"><fmt:formatNumber value="${dto.saleCount}"/>개 구매</label>
								</div>
								 -->
							<div class="category">
								<div>강아지 > 이동장/유모차</div>
							</div>					
							
							<div class="productName">
								<div>이츠독 올 뉴 투웨이 카시트</div>
							</div>
							
							<div class="price">
								<div>20%</div>
								
								<div>
									<label class="discounted-price">
										<fmt:formatNumber value=""/>39,900원
									</label>
	
									<label class="original-price">
										<fmt:formatNumber value=""/>59,900원
									</label>
									
								</div>
							</div>
							
							<div class="delivery">
								<div>배송비 </div> 
								<div>
									<label>
									 	<fmt:formatNumber value=""/>3,000원
									</label>
									<label>(20,000원 이상 주문 시 무료배송)</label>
								</div>
							</div>
							
							<div class="point">
								<div>적립포인트</div>
								<div>0.5% (199P)</div>
							</div>
							
							
							
								<div class="option">
									옵션 선택 
								</div>
							
							
							
								<div class="option-tab">
									<select class="form-select requiredOption option-tab1">
										<option> 그레이</option>
									</select>
								</div>
							
		
							
								<div class="option-tab">
									<select class="form-select requiredOption2 option-tab2">
										<option> S</option>
									</select>
								</div>
							
							
							
							<div class="order-area">
							</div>
							
							<hr>
							<div class="total-price">
								<div class="total-text">총상품금액</div>
								<div class="total-detail">
									<label>총수량 <span class="product-totalQty">1</span>개 | </label>
									<label><span class="product-totalAmount">42,900</span>원</label>
								</div>
							</div>
							
							
							
							<div class="buttons">
								<div class="button-wish">
									<button type="button" class="wish btn-productBlind">
										<i class="bi bi-heart"></i></button>
								</div>
								<div class="button-buy">
									<div>
										<button type="button" class="btnbtn-productCart btn" 
											onclick="sendOk('cart');">장바구니</button>
									</div>
									<div>
										<input type="hidden" name="mode" value="buy">
										<button type="button" class="btn btn-buySend" 
											onclick="sendOk('buy');">구매하기</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<nav id="navbar-example2">
					<ul class="nav nav-tabs mt-3 pt-5" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<a class="nav-link active" id="tab-1" data-bs-toggle="tab" 
								data-bs-target="#tab-pane-1" role="tab" aria-controls="1" 
								aria-selected="true">상세정보</a>
						</li>

						<li class="nav-tabs" role="presentation">
							<a class="nav-link active" href="#scrollr">구매후기 
								<span class="title-reviewCount">(3)</span></a>
						</li>
						<li class="nav-tabs" role="presentation">
							<a class="nav-link active" href="#scrollq">문의하기 
								<span class="title-qnaCount">(3)</span></a>
						</li>
					</ul>
				</nav>
				
				<div class="tab-content pt-3" id="myTabContent" data-bs-spy="scroll" 
						data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" 
						data-bs-smooth-scroll="true" class="scrollspy-example">
					<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel" 
							aria-labelledby="tab-1" tabindex="0">
						<div class="img-more">
							<div class="mt-4 product-content hidden" id="detail">
								<img 
								src="${pageContext.request.contextPath}/uploads/product/product_detail2.png" class="img-buy">
							</div>
							<div class="detailMore">
								<a id="btnMore" href="javascript:moreDetail();">상세 정보 더보기</a>
							</div>
						</div>
						
						<div class="recomm-product">
							<div class="recomm-title">비슷한 상품</div>
							<div class="recomm-imgs" >
								<c:forEach var="n" begin="1" end="6">
									<div class="recomm-img">
										<img src="${pageContext.request.contextPath}/uploads/product/10.jpg" class="img-buy">
										<div>개과천선 강아지 스페이스 카시트 라운드형 크림 아이보리</div>
										<div class="d-flex recomm-price">
											<span>68%</span>
											<span>39,000원</span>
										</div>
									</div>
										
								</c:forEach>
							</div>
						</div>
						
						<div class="review">
							<div class="mt-3 fw-bold review-title">
								<p>구매후기(3)</p> 
							</div>
							
							<div class="star-sort ms-3">
								<div class="col pt-3 pb-3 star-box">
									<div class="score-star review-score-star">
										<c:forEach var="n" begin="1" end="5">
											<c:set var="score" value=""/>
											<span class="item fs-2 on">
												<i class="bi bi-star-fill"></i></span>
										</c:forEach>
									</div>
									<div class="fs-2 ms-4 fw-bold">
										<label class="review-score">4.5</label> 
									</div>
								</div>
								<div class="reviewSort-area">
									<div>
										<select class="form-select reviewSortNo">
											<option selected value="1"> 평점 높은순 </option>
											<option value="2"> 평점 낮은순 </option>
											<option value="3"> 최신순 </option>
										</select>
									</div>
								</div>
							</div>
							
							<div class="review-con">
								<div class="review-content border-top">
									<div class="review-top ms-3">
										<div class="review-top-left">
											<label>
												<c:forEach var="n" begin="1" end="5">
													<i class="bi bi-star-fill"></i>
												</c:forEach>
											</label>
											<label> 캔따개 </label>							
										</div>
										<div>2024.07.10</div>
									</div>
									<div class="review-option ms-3">
										옵션: [색상]그레이 [사이즈]S
									</div>
									<div class="review-img-content ms-3">
										<img src="${pageContext.request.contextPath}/uploads/product/10.jpg" class="img-buy">
										<div>
											재질도 좋고 설치도 간편하고 견고한 것 같아요
										</div>
									</div>
								</div>
								
								<div class="review-content border-top">
									<div class="review-top ms-3">
										<div class="review-top-left">
											<label>
												<c:forEach var="n" begin="1" end="5">
													<i class="bi bi-star-fill"></i>
												</c:forEach>					
											</label>
											<label> 캔따개 </label>							
										</div>
										<div>2024.07.10</div>
									</div>
									<div class="review-option ms-3">
										옵션: [색상]그레이 [사이즈]S
									</div>
									<div class="review-img-content ms-3">
										<img src="${pageContext.request.contextPath}/uploads/product/10.jpg" class="img-buy">
										<div>
											재질도 좋고 설치도 간편하고 견고한 것 같아요
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="list-review"></div>
						
						<div class="qna" id="scrollr">
							<div class="qna-title">
								<p>문의</p> 
							</div>
					
							<div class="mt-3 p-2 text-end">
								<button type="button" class="btnQuestion btn"> 
									문의 작성하기 </button>
							</div>
						</div>
						
						<div class="mt-1 p-2 list-question" id="scrollq" ></div>
					</div>
				</div>
	
				<a href="#" class="btn_gotop">
	                <img src="${pageContext.request.contextPath}/resources/images/toparrow.png" class="top_arrow">
	                <span class="glyphicon glyphicon-chevron-up"></span>
           		 </a>

			</div>
		</div>
	</div>	
</div>

<script>
$(window).scroll(function(){
    if ($(this).scrollTop() > 300){
        $('.btn_gotop').show();
    } else{
        $('.btn_gotop').hide();
    }
});

$('.btn_gotop').click(function(){
    $('html, body').animate({scrollTop:0},400);
    return false;
});

function moreDetail(){
    $('#detail').removeClass('hidden');
    $('.detailMore').remove();
}
</script> 






