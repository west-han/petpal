package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.domain.OnetooneManage;
import com.shop.petpal.admin.mapper.OnetooneManageMapper;

@Service
public class OnetooneServiceImpl implements OnetooneManageService{
	@Autowired
	private OnetooneManageMapper mapper;
	
	@Override
	public List<OnetooneManage> listOnetoone(Map<String, Object> map) {
		List<OnetooneManage> list = null;
		try {
			list = mapper.listonetoone(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public void saveResponse(OnetooneManage onetooneManage) {
		mapper.updateOnetoone(onetooneManage);
	}

}
