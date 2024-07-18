package com.shop.petpal.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.admin.domain.CouponManage;

@Mapper
public interface CouponManageMapper {
	
	public List<CouponManage> listCoupon(Map<String, Object> map);
	
	
	
	public void insertCoupon(CouponManage dto) throws SQLException;
	
}
