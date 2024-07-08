<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

.body-container {
	max-width: 1000px;
	margin: 40px auto;
	margin-bottom: 60px;
	color: #434347;
	
}

.body-sep {
	display: flex;
	width: 100%;
}

.body-left, .body-right {
	width: 500px;
}

.body-left {
	padding-left: 30px;
}
.body-right {
	padding-left: 30px;
	padding-right: 30px;
}

.lg-img img { height: 420px; width: 420px; object-fit: cover;}
.md-img img { width: 200px; height: 200px; cursor: pointer; object-fit: cover; }
.sm-img img { width: 50px; height: 50px; cursor: pointer; object-fit: cover; }

img {
	border-radius: 10px;
}

.imgs {
	margin-top: 30px;
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
	margin-top: 20px;
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
	margin-right: 20px;
}

.delivery {
	display: flex;
	margin-top: 40px;
}

.delivery div:first-child {
	font-size: 15px;
	font-weight: bold;
	margin-right: 50px;
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
	height: 3px;
	margin-top: 33px;
	color: #BDBDBD;
}

.total-text {
	font-weight: bold;
	font-size: 15px;
}

.total-detail {
	margin-top: 10px;
}

.total-detail .product-totalAmount {
	color: #E4B075;
	font-weight: bold;
}

.buttons .btn {
	font-size: 20px;	
	padding: 8px 45px;
}

.buttons .btnbtn-productCart {
	border: 1px solid #BDBDBD;
	background-color: white;
	margin: 0 15px;
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
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}
.nav-tabs .nav-link.active {
	background: #3d3d4f;
	color: #fff;
}
.tab-pane { min-height: 300px; }

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #f54a4c; }

.graph { font-size: 0;  letter-spacing: 0; word-spacing: 0; }
.graph-title { padding-right: 3px; }
.graph .one-space { font-size:13px; background:#eee;}
.graph .one-space:after { content: ''; display: inline-block; width:17px; }
.graph .one-space.on{ background:  #f54a4c; }
.graph .one-space:first-child{ border-top-left-radius:5px;  border-bottom-left-radius:5px; }
.graph .one-space:last-child{ border-top-right-radius:5px; border-bottom-right-radius:5px; }
.graph-rate { padding-left: 5px; display: inline-block; width: 60px; text-align: left; }

.deleteReview, .notifyReview { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .notifyReview:hover { font-weight: 500; color: #2478FF; }

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

.product-content img { max-width: 1000px; }
</style>

<div class="container">
	<div class="body-container">	
		<div class="body-main">
			<div class="row mt-4 body-sep">
				<div class="body-left">
					<div>
						<div class="lg-img">
							<img class="" src="${pageContext.request.contextPath}/uploads/product/product_detail.jpg">
						</div>
					</div>
					<div class="imgs">
						
							<div class="sm-img">
								<img src="${pageContext.request.contextPath}/uploads/product/product_detail.jpg">
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
								<button type="button" class="wish btn-productBlind"><i class="bi bi-heart"></i></button>
							</div>
							<div class="button-buy">
								<div>
									<button type="button" class="btnbtn-productCart btn" onclick="sendOk('cart');">장바구니</button>
								</div>
								<div>
									<input type="hidden" name="mode" value="buy">
									<button type="button" class="btn btn-buySend" onclick="sendOk('buy');">구매하기</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		
			<ul class="nav nav-tabs mt-5 pt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="true">상세정보</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false">리뷰 <span class="title-reviewCount">(3)</span></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane-3" type="button" role="tab" aria-controls="3" aria-selected="false">문의사항 <span class="title-qnaCount">(3)</span></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane-4" type="button" role="tab" aria-controls="4" aria-selected="false">배송 및 환불정책</button>
				</li>
			</ul>
			
			<div class="tab-content pt-2" id="myTabContent">
				<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
					<div class="mt-5 product-content">
						<img src="${pageContext.request.contextPath}/uploads/product/product_detail2.png">
					</div>
				</div>
				<div class="tab-pane fade" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">상품 리뷰</p> 
					</div>

					<div class="row border-bottom">
						<div class="col p-3 text-center">
							<div class="fs-6 fw-semibold">상품만족도</div>
							<div class="score-star review-score-star">
								<c:forEach var="n" begin="1" end="5">
									<c:set var="score" value=""/>
									<span class="item fs-2 on"><i class="bi bi-star-fill"></i></span>
								</c:forEach>
							</div>
							<div class="fs-2">
								<label class="review-score">4 / 5</label> 
							</div>
						</div>
						
						<div class="col p-3 text-center">
							<div class="fs-6 fw-semibold">리뷰수</div>
							<div class="fs-2"><i class="bi bi-chat-right-text"></i></div>
							<div class="fs-2 review-reviewCount">3</div>
						</div> 
						
						<div class="col p-3 text-center review-rate">
							<div class="fs-6 fw-semibold">평점비율</div>
							<div class="p-1 score-5">
								<span class="graph-title">5점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
							<div class="p-1 score-4">
								<span class="graph-title">4점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
							<div class="p-1 score-3">
								<span class="graph-title">3점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
							<div class="p-1 score-2">
								<span class="graph-title">2점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
							<div class="p-1 score-1">
								<span class="graph-title">1점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
						</div>
					</div>

					<div class="row mt-3 reviewSort-area">
						<div class="col">&nbsp;</div>
						<div class="col-auto text-end">
							<select class="form-select reviewSortNo">
								<option value="0"> 출력 순서 </option>
								<option value="1"> 최신 글 </option>
								<option value="2"> 평점 높은순 </option>
								<option value="3"> 평점 낮은순 </option>
							</select>
						</div>
					</div>
					
					<div class="mt-2 list-review"></div>
				</div>
				
				<div class="tab-pane fade" id="tab-pane-3" role="tabpanel" aria-labelledby="tab-3" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">상품 문의 사항</p> 
					</div>
			
					<div class="mt-3 p-2 text-end">
						<button type="button" class="btnMyQuestion btn btn-dark"> 내 Q&amp;A 보기  </button>
						<button type="button" class="btnQuestion btn btn-dark"> 상품 Q&amp;A 작성 </button>
					</div>
					<div class="mt-1 p-2 list-question"></div>
										
				</div>
				
				<div class="tab-pane fade" id="tab-pane-4" role="tabpanel" aria-labelledby="tab-4" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">배송 및 환불정책</p> 
					</div>
					<div class="mt-3">
						<p> 배송 및 환불 정책 입니다. </p>
					</div>				
				</div>
			</div>

			<div>
				<div class="fs-5 fw-bold">비슷한 상품</div>
				<hr>
				
			</div>
		</div>
	</div>
</div>




