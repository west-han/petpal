package com.shop.petpal.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Mypage2 {
	private long pointNum; // 포인트 적립 번호
	private String regDate; // 포인트날짜 // 쿠폰발급일
	private int classify; // 포인트상태 구매적립(0)/이벤트적립 (1)/ 사용(2)/소멸(3)
	private int point; // 포인트 액수
	private int balance; // 포인트 total

	private long memberNum; // 회원번호
	private long destNum; // 배송지번호
	private String recipientName; // 배송 받는사람 이름
	private int defaultDest; // 기본 배송지(0)/일반 배송지(1)
	private String tel; // 배송 전화번호
	private String postalCode; // 우편번호
	private String address1; // 기본 주소
	private String address2; // 상세 주소
	private String note; // 배송 메모

	// 쿠폰날짜 위에 있음
	private long couponNum; // 쿠폰 번호
	private int state; // 쿠폰 상태 사용가능(0)/사용완료(1)/만료(2)
	private String validity; // 쿠폰 유효기간
	private int minPayment; // 최소 결제 금액
	private String couponName; // 쿠폰 이름
	private int discountRate; // 쿠폰 할인율

	// 나의 펫
	private long petNum; // 펫 번호
	private String petName; // 펫이름
	private String petPhoto; // 펫 사진
	private String petBirth; // 펫 생일
	private int petGender; // 펫 성별
	private double petWeight; // 펫 몸무게
	private int bodyShape; // 펫 체형 날씬(1),적당(2),뚱뚱(3)
	private String petRegNum; // 동물 등록 번호
	private long breedNum; // 품종코드
	private int species; // 강아지1 고양이2 구분
	private String breedName; // 품종명

	// 찜 정보
	private long productNum; // 상품번호
	private String productName; // 상품 이름
	private int price; // 상품 가격
	private String thumbnail; // 대표 이미지 이름

	private MultipartFile selectFile; // 이미지 파일
	private List<MultipartFile> selectFiles; // 이미지 파일들

	// 주문내역
	private String orderNum; // 주문 번호
	private String orderDate; // 주문 날짜
	
	private int orderState; // 주문 상태
	private String orderStateMemo; // 주문상태 텍스트
	
	private int totalMoney; // 총 금액
	private int usedPoint; // 사용된 포인트
	private int usedCoupon; // 사용된 쿠폰 금액
	private int deliveryCharge; // 배송비
	private int payment; // 실제 결제 금액
	private int detailState; // 상세 상태(번호)
	private String detailStateMemo; // 상세 상태(텍스트)
	private int total_price; // 총 가격 (주문 상세)
	private int total_quantity; // 총 수량 (주문 상세)
	private String deliveryName; // 택배사 이름
	private String destMemo; // 택배 메모

	private long orderDetailNum; // 주문 상세 번호
	private int amount; // 수량
	private int priceOrig; // 원래 가격
	private int priceDiscount; // 할인된 가격
	private int pricePay; // 지불 가격
	private int savePoint; // 적립 포인트
	private long stockNum; // 재고 번호
	private String optionValue; // 옵션 값
	private int stateNum; // 상태 번호
	private String stateMemo; // 상태 메모
	private String detailStateDate; // 상세 상태 날짜
	private String deliveryTel; // 택배사 전화번호
	private String payClassify; // 결제 분류
	private String cardName; // 카드 이름
	private String authNumber; // 인증 번호
	private String authDate; // 인증 날짜
	private int cancelAmount; // 취소 금액
	private String candleDate; // 취소 날짜
	
	// 리뷰 작성
	private int rating; // 평점
	private String content; // 내용
	private String reviewFileName; // 리뷰 사진
	
	
	
	public List<MultipartFile> getSelectFiles() {
		return selectFiles;
	}

	public void setSelectFiles(List<MultipartFile> selectFiles) {
		this.selectFiles = selectFiles;
	}

	public String getReviewFileName() {
		return reviewFileName;
	}

	public void setReviewFileName(String reviewFileName) {
		this.reviewFileName = reviewFileName;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getOrderDetailNum() {
		return orderDetailNum;
	}

	public void setOrderDetailNum(long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPriceOrig() {
		return priceOrig;
	}

	public void setPriceOrig(int priceOrig) {
		this.priceOrig = priceOrig;
	}

	public int getPriceDiscount() {
		return priceDiscount;
	}

	public void setPriceDiscount(int priceDiscount) {
		this.priceDiscount = priceDiscount;
	}

	public int getPricePay() {
		return pricePay;
	}

	public void setPricePay(int pricePay) {
		this.pricePay = pricePay;
	}

	public int getSavePoint() {
		return savePoint;
	}

	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}

	public long getStockNum() {
		return stockNum;
	}

	public void setStockNum(long stockNum) {
		this.stockNum = stockNum;
	}

	public String getOptionValue() {
		return optionValue;
	}

	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}

	public int getStateNum() {
		return stateNum;
	}

	public void setStateNum(int stateNum) {
		this.stateNum = stateNum;
	}

	public String getStateMemo() {
		return stateMemo;
	}

	public void setStateMemo(String stateMemo) {
		this.stateMemo = stateMemo;
	}

	public String getDetailStateDate() {
		return detailStateDate;
	}

	public void setDetailStateDate(String detailStateDate) {
		this.detailStateDate = detailStateDate;
	}

	public String getDeliveryTel() {
		return deliveryTel;
	}

	public void setDeliveryTel(String deliveryTel) {
		this.deliveryTel = deliveryTel;
	}

	public String getPayClassify() {
		return payClassify;
	}

	public void setPayClassify(String payClassify) {
		this.payClassify = payClassify;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getAuthNumber() {
		return authNumber;
	}

	public void setAuthNumber(String authNumber) {
		this.authNumber = authNumber;
	}

	public String getAuthDate() {
		return authDate;
	}

	public void setAuthDate(String authDate) {
		this.authDate = authDate;
	}

	public int getCancelAmount() {
		return cancelAmount;
	}

	public void setCancelAmount(int cancelAmount) {
		this.cancelAmount = cancelAmount;
	}

	public String getCandleDate() {
		return candleDate;
	}

	public void setCandleDate(String candleDate) {
		this.candleDate = candleDate;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getTotal_quantity() {
		return total_quantity;
	}

	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}

	public String getDestMemo() {
		return destMemo;
	}

	public void setDestMemo(String destMemo) {
		this.destMemo = destMemo;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderState() {
		return orderState;
	}

	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	public int getUsedPoint() {
		return usedPoint;
	}

	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}

	public int getUsedCoupon() {
		return usedCoupon;
	}

	public void setUsedCoupon(int usedCoupon) {
		this.usedCoupon = usedCoupon;
	}

	public int getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getDetailState() {
		return detailState;
	}

	public void setDetailState(int detailState) {
		this.detailState = detailState;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public long getProductNum() {
		return productNum;
	}

	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public MultipartFile getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}

	public long getPetNum() {
		return petNum;
	}

	public void setPetNum(long petNum) {
		this.petNum = petNum;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetPhoto() {
		return petPhoto;
	}

	public void setPetPhoto(String petPhoto) {
		this.petPhoto = petPhoto;
	}

	public String getPetBirth() {
		return petBirth;
	}

	public void setPetBirth(String petBirth) {
		this.petBirth = petBirth;
	}

	public int getPetGender() {
		return petGender;
	}

	public void setPetGender(int petGender) {
		this.petGender = petGender;
	}

	public double getPetWeight() {
		return petWeight;
	}

	public void setPetWeight(double petWeight) {
		this.petWeight = petWeight;
	}

	public int getBodyShape() {
		return bodyShape;
	}

	public void setBodyShape(int bodyShape) {
		this.bodyShape = bodyShape;
	}

	public String getPetRegNum() {
		return petRegNum;
	}

	public void setPetRegNum(String petRegNum) {
		this.petRegNum = petRegNum;
	}

	public long getBreedNum() {
		return breedNum;
	}

	public void setBreedNum(long breedNum) {
		this.breedNum = breedNum;
	}

	public int getSpecies() {
		return species;
	}

	public void setSpecies(int species) {
		this.species = species;
	}

	public String getBreedName() {
		return breedName;
	}

	public void setBreedName(String breedName) {
		this.breedName = breedName;
	}

	public long getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(long couponNum) {
		this.couponNum = couponNum;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getValidity() {
		return validity;
	}

	public void setValidity(String validity) {
		this.validity = validity;
	}

	public int getMinPayment() {
		return minPayment;
	}

	public void setMinPayment(int minPayment) {
		this.minPayment = minPayment;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public long getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}

	public long getDestNum() {
		return destNum;
	}

	public void setDestNum(long destNum) {
		this.destNum = destNum;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public int getDefaultDest() {
		return defaultDest;
	}

	public void setDefaultDest(int defaultDest) {
		this.defaultDest = defaultDest;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public long getPointNum() {
		return pointNum;
	}

	public void setPointNum(long pointNum) {
		this.pointNum = pointNum;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getClassify() {
		return classify;
	}

	public void setClassify(int classify) {
		this.classify = classify;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getDetailStateMemo() {
		return detailStateMemo;
	}

	public void setDetailStateMemo(String detailStateMemo) {
		this.detailStateMemo = detailStateMemo;
	}

	public String getOrderStateMemo() {
		return orderStateMemo;
	}

	public void setOrderStateMemo(String orderStateMemo) {
		this.orderStateMemo = orderStateMemo;
	}
	
}
