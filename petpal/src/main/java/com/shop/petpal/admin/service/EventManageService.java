package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.EventManage;

public interface EventManageService {
	public void insertEvent(EventManage dto,String pathname) throws Exception;
	public void updateEvent(EventManage dto, String pathname) throws Exception;
	public void deleteEvent(long num, String pathname) throws Exception;
	public void deleteFile(long fileNum, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<EventManage> listEvent(Map<String, Object> map);
	
	public EventManage findByNum(long num);

	public EventManage findByPrev(Map<String, Object> map);
	public EventManage findByNext(Map<String, Object> map);
	
	
}
