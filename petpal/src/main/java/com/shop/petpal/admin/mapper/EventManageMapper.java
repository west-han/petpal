package com.shop.petpal.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.EventManage;

public interface EventManageMapper {
	public long eventSeq();
	// CRUD: CREATE, READ, UPDATE, DELETE
	
	// CREATE
	// 게시글 쓰기
		// - 입력값: 글 제목, 본문, 이벤트 시작일/종료일, 작성자 정보, 썸네일 파일명
		// - 출력값: 없음
	public void insertEvent(EventManage eventManage) throws SQLException;
	// 파일 올리기
	public void insertEventFile(EventManage eventManage) throws SQLException;
	
	// READ
	// 게시글 목록 보기
	public int dataCount(Map<String, Object> map);
	public List<EventManage> listEvent(Map<String, Object> map);
	// 게시글 내용(본문) 보기
	public EventManage findEventByNum(long num);
	// 파일 내용 보기
    public EventManage findEventFileByNum(long eventFileNum);
	// 파일 목록 보기
    public List<EventManage> listEventFile(long num);
    
	
	// UPDATE
	// 게시글 수정
	public void updateEvent(EventManage eventManage) throws SQLException;
	
	
	// DELETE
	// 게시글 삭제
	public void deleteEvent(long num) throws SQLException;
	public void deleteEventFile(Map<String, Object> map) throws SQLException;
	
}
