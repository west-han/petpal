package com.shop.petpal.domain;

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
	
	
	// 주문내역
	private String orderNum; // 주문 번호
	private String orderDate; // 주문 날짜
	private int orderState; // 주문 상태
	private int totalMoney; // 총 금액
	private int usedPoint; // 사용된 포인트
	private int usedCoupon; // 사용된 쿠폰 금액
	private int deliveryCharge; // 배송비
	private int payment; // 실제 결제 금액
	private int detailState; // 상세 상태
	private int total_Price; // 총 가격 (주문 상세)
	private int total_Quantity; // 총 수량 (주문 상세)
	private String deliveryName; // 택배사 이름
	
	
	
	public int getTotal_Price() {
		return total_Price;
	}
	public void setTotal_Price(int total_Price) {
		this.total_Price = total_Price;
	}
	public int getTotal_Quantity() {
		return total_Quantity;
	}
	public void setTotal_Quantity(int total_Quantity) {
		this.total_Quantity = total_Quantity;
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
	
	
	
	
}
