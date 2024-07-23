package com.shop.petpal.admin.domain;

public class ReviewManage {
	private long orderdetailNum; // 주문상세번호
	private long memberNum; // 회원번호
	private long productNum; // 상품번호
	private long answerNum; // 답변자번호
	private int rating; // 평점
	private String content; // 내용
	private String reviewDate; // 리뷰등록일
	private String answer; // 답변
	private String answerDate; // 답변등록일
	private int showReview; // 관리자 숨김 여부
	
	private String userName; // 회원이름
	private String productName; // 상품이름
	private int qty; // 주문한 수량
	
	
	
	
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public long getOrderdetailNum() {
		return orderdetailNum;
	}
	public void setOrderdetailNum(long orderdetailNum) {
		this.orderdetailNum = orderdetailNum;
	}
	public long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public long getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(long answerNum) {
		this.answerNum = answerNum;
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
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public int getShowReview() {
		return showReview;
	}
	public void setShowReview(int showReview) {
		this.showReview = showReview;
	}
	
	
}
