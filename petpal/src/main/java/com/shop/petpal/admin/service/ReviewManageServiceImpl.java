package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.domain.ReviewManage;
import com.shop.petpal.admin.mapper.ReviewManageMapper;

@Service
public class ReviewManageServiceImpl implements ReviewManageService{
	@Autowired
	private ReviewManageMapper mapper;
	
	@Override
	public List<ReviewManage> listReview(Map<String, Object> map) {
		List <ReviewManage> list = null;
		try {
			list = mapper.listReview(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void saveResponse(ReviewManage reviewManage) {
		mapper.updateReview(reviewManage);
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
	
	
	
}
