package com.shop.petpal.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventManage {
    private long num;
    private String subject;
    private String thumbnail;
    private MultipartFile thumbnailFile;
    private String content;
    private String startDate;
    private String sday;
    private String stime;
    private String endDate;
    private String eday;
    private String etime;
    private long memberNum;
    private String userName;
    
    
    private List<MultipartFile> selectEventFile;
    
    private long eventFileNum;
	private String eventFileName; //컴퓨터 하드디스크에 저장할때 이 이름으로 식별
    
    // Getters and Setters
    
	
	
    public long getNum() {
        return num;
    }

    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public String getEventFileName() {
		return eventFileName;
	}

	public void setEventFileName(String eventFileName) {
		this.eventFileName = eventFileName;
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

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
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

    public long getMemberNum() {
        return memberNum;
    }

    public void setMemberNum(long memberNum) {
        this.memberNum = memberNum;
    }

    public List<MultipartFile> getSelectEventFile() {
        return selectEventFile;
    }

    public void setSelectEventFile(List<MultipartFile> selectEventFile) {
        this.selectEventFile = selectEventFile;
    }

    public long getEventFileNum() {
        return eventFileNum;
    }

    public void setEventFileNum(long eventFileNum) {
        this.eventFileNum = eventFileNum;
    }
}
