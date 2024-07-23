package com.shop.petpal.domain;

import java.util.List;

public class Order {
	private long productNum;
	private String productName;
	private String thumbnail;
	private int priceOrig;
	private int discountRate;
	private int discountAmount;
	private int totalPrice;
	private int point;
	private int deliveryCharge;
	private int optionCount;
	private int totalSavePoint;
	private int savePoint;
	
	private long memberNum;
	private String email;
	
	private String orderNum;
	private long orderDetailNum;
	private String orderDate;
	private int usedPoint;
	private int usedCoupon;
	private int payment;
	private int totalMoney;
	private int delivery;
	private int priceDiscount;
	private int amount;
	private int pricePay;
	private int orderState;
	private int userDelete;
	private String note;
	
	private long stockNum;
	private int totalStock;
	
	private long detailNum;
	private long detailNum2;
	private String optionValue;
	private String optionValue2;
	private String optionName;
	private String optionName2;
	private List<String> optionNames;
	private List<String> optionNames2;
	
	private List<Long> productNums;
	private List<Long> stockNums;
	private List<Long> detailNums;
	private List<Long> detailNums2;
	private List<String> optionValues;
	private List<String> optionValues2;
	private List<Integer> buyAmounts;
	private List<Integer> pricePays;
	private List<Integer> priceOrigs;
	private List<Integer> priceDiscounts;
	private List<Integer> totalPrices;
	
	private Long cartNum;
	
	private String recipientName;
	private String tel;
	private String postalCode;
	private String address1;
	private String address2;
	private String destMemo;
	
	private int payClassify;
	private String cardName;
	private String authNumber;
	private String authDate;
	
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getPriceOrig() {
		return priceOrig;
	}
	public void setPriceOrig(int priceOrig) {
		this.priceOrig = priceOrig;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getOptionCount() {
		return optionCount;
	}
	public void setOptionCount(int optionCount) {
		this.optionCount = optionCount;
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
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public long getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getDeliveryCharge() {
		return deliveryCharge;
	}
	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}
	public int getPriceDiscount() {
		return priceDiscount;
	}
	public void setPriceDiscount(int priceDiscount) {
		this.priceDiscount = priceDiscount;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPricePay() {
		return pricePay;
	}
	public void setPricePay(int pricePay) {
		this.pricePay = pricePay;
	}
	public long getStockNum() {
		return stockNum;
	}
	public void setStockNum(long stockNum) {
		this.stockNum = stockNum;
	}
	public int getTotalStock() {
		return totalStock;
	}
	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}
	public long getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}
	public long getDetailNum2() {
		return detailNum2;
	}
	public void setDetailNum2(long detailNum2) {
		this.detailNum2 = detailNum2;
	}
	public String getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}
	public String getOptionValue2() {
		return optionValue2;
	}
	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getOptionName2() {
		return optionName2;
	}
	public void setOptionName2(String optionName2) {
		this.optionName2 = optionName2;
	}
	public List<String> getOptionNames() {
		return optionNames;
	}
	public void setOptionNames(List<String> optionNames) {
		this.optionNames = optionNames;
	}
	public List<String> getOptionNames2() {
		return optionNames2;
	}
	public void setOptionNames2(List<String> optionNames2) {
		this.optionNames2 = optionNames2;
	}
	public List<Long> getProductNums() {
		return productNums;
	}
	public void setProductNums(List<Long> productNums) {
		this.productNums = productNums;
	}
	public List<Long> getStockNums() {
		return stockNums;
	}
	public void setStockNums(List<Long> stockNums) {
		this.stockNums = stockNums;
	}
	public List<Long> getDetailNums() {
		return detailNums;
	}
	public void setDetailNums(List<Long> detailNums) {
		this.detailNums = detailNums;
	}
	public List<Long> getDetailNums2() {
		return detailNums2;
	}
	public void setDetailNums2(List<Long> detailNums2) {
		this.detailNums2 = detailNums2;
	}
	public List<String> getOptionValues() {
		return optionValues;
	}
	public void setOptionValues(List<String> optionValues) {
		this.optionValues = optionValues;
	}
	public List<String> getOptionValues2() {
		return optionValues2;
	}
	public void setOptionValues2(List<String> optionValues2) {
		this.optionValues2 = optionValues2;
	}
	public List<Integer> getBuyAmounts() {
		return buyAmounts;
	}
	public void setBuyAmounts(List<Integer> buyAmounts) {
		this.buyAmounts = buyAmounts;
	}
	public List<Integer> getPricePays() {
		return pricePays;
	}
	public void setPricePays(List<Integer> pricePays) {
		this.pricePays = pricePays;
	}
	public List<Integer> getPriceOrigs() {
		return priceOrigs;
	}
	public void setPriceOrigs(List<Integer> priceOrigs) {
		this.priceOrigs = priceOrigs;
	}
	public List<Integer> getPriceDiscounts() {
		return priceDiscounts;
	}
	public void setPriceDiscounts(List<Integer> priceDiscounts) {
		this.priceDiscounts = priceDiscounts;
	}
	public List<Integer> getTotalPrices() {
		return totalPrices;
	}
	public void setTotalPrices(List<Integer> totalPrices) {
		this.totalPrices = totalPrices;
	}
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
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
	public String getDestMemo() {
		return destMemo;
	}
	public void setDestMemo(String destMemo) {
		this.destMemo = destMemo;
	}
	public int getPayClassify() {
		return payClassify;
	}
	public void setPayClassify(int payClassify) {
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
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
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
	public int getTotalSavePoint() {
		return totalSavePoint;
	}
	public void setTotalSavePoint(int totalSavePoint) {
		this.totalSavePoint = totalSavePoint;
	}
	public int getSavePoint() {
		return savePoint;
	}
	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}
	
	
	
}
