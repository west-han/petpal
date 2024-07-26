package com.shop.petpal.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventManage {
	private long num;
	private String subject;
	private String thumbnail;
	private String content;
	private String startDate;
	private String sday;
	private String stime;
	private String endDate;
	private String eday;
	private String etime;
	private long memberNum;
	
	
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEday() {
		return eday;
	}
	public void setEday(String eday) {
		this.eday = eday;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	private List<MultipartFile> selectFile;
	
	private long eventFileNum;
	private String eventFileName;
	
	
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public long getEventFileNum() {
		return eventFileNum;
	}
	public void setEventFileNum(long eventFileNum) {
		this.eventFileNum = eventFileNum;
	}
	public String getEventFileName() {
		return eventFileName;
	}
	public void setEventFileName(String eventFileName) {
		this.eventFileName = eventFileName;
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}
	
	
}
