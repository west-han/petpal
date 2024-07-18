package com.shop.petpal.admin.domain;

public class CouponManage {
	private long couponNum;
	private String couponName;
	private int discountRate;
	private int minPayment;
	private String validity;
	
	private int categoryNum;
	private String categoryName;

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public long getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(long couponNum) {
		this.couponNum = couponNum;
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

	public int getMinPayment() {
		return minPayment;
	}

	public void setMinPayment(int minPayment) {
		this.minPayment = minPayment;
	}

	public String getValidity() {
		return validity;
	}

	public void setValidity(String validity) {
		this.validity = validity;
	}

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	
	
}
