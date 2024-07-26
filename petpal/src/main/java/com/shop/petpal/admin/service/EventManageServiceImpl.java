package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.domain.EventManage;
import com.shop.petpal.admin.mapper.EventManageMapper;

@Service
public class EventManageServiceImpl implements EventManageService{
	@Autowired
	private EventManageMapper mapper;

	@Override
	public void insertEvent(EventManage dto) throws Exception {
		try {
			dto.setStartDate(dto.getSday() + " " + dto.getStime() + ":00");
			dto.setEndDate(dto.getEday() + " " + dto.getEtime() + ":00");
			mapper.insertEvent(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateEvent(EventManage dto) throws Exception {
		try {
			dto.setStartDate(dto.getSday() + " " + dto.getStime() + ":00");
			dto.setEndDate(dto.getEday() + " " + dto.getEtime() + ":00");
			mapper.updateEvent(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteEvent(long num) throws Exception {
		try {
			mapper.deleteEvent(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<EventManage> listEvent(Map<String, Object> map) {
		List<EventManage> list = null;
		
		try {
			list = mapper.listEvent(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public EventManage findByNum(long num) {
		EventManage dto = null;
		
		try {
			dto = mapper.findEventByNum(num);
			
			if(dto != null) {
				dto.setStartDate(dto.getStartDate().substring(0, 10));
				
				dto.setEndDate(dto.getEndDate().substring(0, 10));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public EventManage findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EventManage findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
