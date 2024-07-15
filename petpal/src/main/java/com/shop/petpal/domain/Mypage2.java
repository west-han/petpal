package com.shop.petpal.domain;

public class Mypage2 {
	private long pointNum; // 포인트 적립 번호	
	private String regDate; // 포인트날짜
	private int classify; // 포인트상태 구매적립(0)/이벤트적립 (1)/ 사용(2)/소멸(3)
	private int point; // 포인트 액수
	private int balance; // 포인트 total
	
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
