package com.shop.petpal.admin.domain;

public class OrderManage {
	private String orderNum;
	private long memberNum;
	private String email;
	private String userName;
	private String orderDate;

	private long totalMoney;
	private long usedPoint;
	private long usedCoupon;
	private int deliveryCharge;
	private long payment;
	private long cancelAmount;
	// NOTE: 0-결제대기, 1-결제완료, 2-발송처리, 3-배송시작, 4-배송중, 5-배송완료, 6-판매취소/주문취소
	private int orderState;
	private String orderStateInfo;
	
	private String orderStateDate;
	private String deliveryName; // NOTE: 택배사 코드
	private String invoiceNumber;
	private int userDelete;
	private String note;
	
	private int totalOrderCount;
	private int totalQuantity;
	private int detailCancelCount;
	
	private String payMethod;
	private String cardName;
	private String authNumber;
	private String authDate;
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String username) {
		this.userName = username;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public long getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(long totalMoney) {
		this.totalMoney = totalMoney;
	}
	public long getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(long usedPoint) {
		this.usedPoint = usedPoint;
	}
	public long getUsedCoupon() {
		return usedCoupon;
	}
	public void setUsedCoupon(long usedCoupon) {
		this.usedCoupon = usedCoupon;
	}
	public int getDeliveryCharge() {
		return deliveryCharge;
	}
	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}
	public long getPayment() {
		return payment;
	}
	public void setPayment(long payment) {
		this.payment = payment;
	}
	public long getCancelAmount() {
		return cancelAmount;
	}
	public void setCancelAmount(long cancelAmount) {
		this.cancelAmount = cancelAmount;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public String getOrderStateInfo() {
		return orderStateInfo;
	}
	public void setOrderStateInfo(String orderStateInfo) {
		this.orderStateInfo = orderStateInfo;
	}
	public String getOrderStateDate() {
		return orderStateDate;
	}
	public void setOrderStateDate(String orderStateDate) {
		this.orderStateDate = orderStateDate;
	}
	public String getDeliveryName() {
		return deliveryName;
	}
	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}
	public String getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public int getUserDelete() {
		return userDelete;
	}
	public void setUserDelete(int userDelete) {
		this.userDelete = userDelete;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getTotalOrderCount() {
		return totalOrderCount;
	}
	public void setTotalOrderCount(int totalOrderCount) {
		this.totalOrderCount = totalOrderCount;
	}
	public int getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public int getDetailCancelCount() {
		return detailCancelCount;
	}
	public void setDetailCancelCount(int detailCancelCount) {
		this.detailCancelCount = detailCancelCount;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
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
}
