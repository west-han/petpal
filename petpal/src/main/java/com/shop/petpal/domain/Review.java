package com.shop.petpal.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Review {
	private long orderDetailNum;
	private long memberNum;
	private String nickName;
	private int rating;
	private String content;
	private String answer;
	private long productNum;
	private int showReview;
	private String reviewDate;
	private String answerDate;
	
	private String reviewFileNum;
	private String reviewFileName;
	private List<MultipartFile> selectFile;
	
	
	private String[] listReviewFileName;
	private String productName;
	private String optionValue;
	private String optionValue2;
	
	public long getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public int getShowReview() {
		return showReview;
	}
	public void setShowReview(int showReview) {
		this.showReview = showReview;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public String getReviewFileNum() {
		return reviewFileNum;
	}
	public void setReviewFileNum(String reviewFileNum) {
		this.reviewFileNum = reviewFileNum;
	}
	public String getReviewFileName() {
		return reviewFileName;
	}
	public void setReviewFileName(String reviewFileName) {
		this.reviewFileName = reviewFileName;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public String[] getListReviewFileName() {
		return listReviewFileName;
	}
	public void setListReviewFileName(String[] listReviewFileName) {
		this.listReviewFileName = listReviewFileName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	
}
