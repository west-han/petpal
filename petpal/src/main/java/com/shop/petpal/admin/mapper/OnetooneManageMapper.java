package com.shop.petpal.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.admin.domain.OnetooneManage;

@Mapper
public interface OnetooneManageMapper {
	
	public List<OnetooneManage> listonetoone(Map<String, Object> map);
	public void updateOnetoone(OnetooneManage onetoonemanage);
}
