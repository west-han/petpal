package com.shop.petpal.domain;

public class SessionInfo {
	// NOTE: 세션에 저장할 정보 - 회원번호, 이름, 닉네임, 회원등급
	private long memberNum;
	private String userName;
	private String nickname;
	private int membershipNum;
	private String email;
	private String authority;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
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

	public int getMembershipNum() {
		return membershipNum;
	}

	public void setMembershipNum(int membershipNum) {
		this.membershipNum = membershipNum;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
}
