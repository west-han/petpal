package com.shop.petpal.admin.domain;

public class OnetooneManage {
	// 1대1 문의 DTO
	private long num; // 글번호
	private String subject; // 제목
	private String regDate; // 등록날짜
	private String ansSubject; // 답변제목
	private String ansContent; // 답변내용
	private String ansRegDate; // 답변 날짜
	private String photo; // 사진
	private int isanswered; // 답변여부 0 = 미답변 , 1 = 답변
	private long memberNum; // 회원 번호, member1 기본키
	private String userName;
	private long answerNum; // 답변자 번호, member1 기본키

	private int classNum; // 문의유형코드, quesClass 기본키
	private String className; // 문의유형
	
	
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	// QnaFile 테이블
	private long qnaFileNum;
	private String qnaFileName;
	
	
	public int getIsanswered() {
		return isanswered;
	}
	public void setIsanswered(int isanswered) {
		this.isanswered = isanswered;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getQnaFileNum() {
		return qnaFileNum;
	}
	public void setQnaFileNum(long qnaFileNum) {
		this.qnaFileNum = qnaFileNum;
	}
	public String getQnaFileName() {
		return qnaFileName;
	}
	public void setQnaFileName(String qnaFileName) {
		this.qnaFileName = qnaFileName;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getAnsSubject() {
		return ansSubject;
	}
	public void setAnsSubject(String ansSubject) {
		this.ansSubject = ansSubject;
	}
	public String getAnsContent() {
		return ansContent;
	}
	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}
	public String getAnsRegDate() {
		return ansRegDate;
	}
	public void setAnsRegDate(String ansRegDate) {
		this.ansRegDate = ansRegDate;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public long getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(long answerNum) {
		this.answerNum = answerNum;
	}
	
	
}
