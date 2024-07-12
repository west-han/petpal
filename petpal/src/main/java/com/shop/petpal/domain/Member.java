package com.shop.petpal.domain;

public class Member {
	private long memberNum;
	private String email;
	private String userName;
	private String nickname;
	private String password;
	private String regDate;
	private int notificationConsent;
	private String address1;
	private String address2;
	private String postalCode;
	private int membershipNum;
	private String membership;
	private int discountRate;
	private long baseAmount;
	private int failureCount;
	private String lastLogin;
	private String authority;
	
	
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
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

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getNotificationConsent() {
		return notificationConsent;
	}

	public void setNotificationConsent(int notificationConsent) {
		this.notificationConsent = notificationConsent;
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

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public int getMembershipNum() {
		return membershipNum;
	}

	public void setMembershipNum(int membershipNum) {
		this.membershipNum = membershipNum;
	}

	public String getMembership() {
		return membership;
	}

	public void setMembership(String membership) {
		this.membership = membership;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public long getBaseAmount() {
		return baseAmount;
	}

	public void setBaseAmount(long baseAmount) {
		this.baseAmount = baseAmount;
	}

	public int getFailureCount() {
		return failureCount;
	}

	public void setFailureCount(int failureCount) {
		this.failureCount = failureCount;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

}
