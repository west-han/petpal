package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.CouponManage;
import com.shop.petpal.admin.domain.MemberCoupon;

public interface CouponManageService {
	public List<CouponManage> listCoupon(Map<String, Object> map);
	public void insertCoupon(CouponManage couponManage) throws Exception;
	
	public void grantCoupon(MemberCoupon memberCoupon) throws Exception;
	public boolean checkMemberExists(long memberNum) throws Exception;
}
