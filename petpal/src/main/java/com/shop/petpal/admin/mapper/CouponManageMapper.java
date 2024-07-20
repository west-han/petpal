package com.shop.petpal.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shop.petpal.admin.domain.CouponManage;
import com.shop.petpal.admin.domain.MemberCoupon;

@Mapper
public interface CouponManageMapper {
	
	public List<CouponManage> listCoupon(Map<String, Object> map);
	
	
	
	public void insertCoupon(CouponManage dto) throws SQLException;
	public void grantCoupon(MemberCoupon dto) throws SQLException;
	public int memberExists(@Param("memberNum") long memberNum) throws SQLException;
}
