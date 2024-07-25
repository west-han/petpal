package com.shop.petpal.domain;

public class QnA {
	private long qnaNum;
	private long productNum;
	private long memberNum;
	private String nickName;
	private int secret;
	private String content;
	private String answer;
	private String answerNum;
	private String answerNick;
	private String questionDate;
	private String answerDate;
	private int showQuestion;
	
	public long getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(long qnaNum) {
		this.qnaNum = qnaNum;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
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
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
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
	public String getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(String answerNum) {
		this.answerNum = answerNum;
	}
	public String getAnswerNick() {
		return answerNick;
	}
	public void setAnswerNick(String answerNick) {
		this.answerNick = answerNick;
	}
	public String getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public int getShowQuestion() {
		return showQuestion;
	}
	public void setShowQuestion(int showQuestion) {
		this.showQuestion = showQuestion;
	}
	
}
