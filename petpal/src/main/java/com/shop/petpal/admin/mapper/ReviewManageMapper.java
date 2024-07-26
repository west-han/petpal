package com.shop.petpal.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.admin.domain.ReviewManage;

@Mapper
public interface ReviewManageMapper {
	
	public List<ReviewManage> listReview(Map<String, Object> map);
	public void updateReview(ReviewManage reviewmanage);
	public int dataCount(Map<String, Object> map);
}
