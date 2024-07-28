package com.shop.petpal.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Onetoone {
	private long num;
	private String subject;
	private String content;
	private String regDate;
	private int isAnswered;
	
	private String ansSubject;
	private String ansContent;
	private String ansRegDate;
	private int asnwerNum;
	private List<MultipartFile> selectFile;
	
	private long qnaFileNum;
	private String qnaFileName;
	
	private int classNum;
	private String className;
	private String userName;
	private long memberNum;
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getIsAnswered() {
		return isAnswered;
	}
	public void setIsAnswered(int isAnswered) {
		this.isAnswered = isAnswered;
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
	public int getAsnwerNum() {
		return asnwerNum;
	}
	public void setAsnwerNum(int asnwerNum) {
		this.asnwerNum = asnwerNum;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
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
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}
	
	
}
