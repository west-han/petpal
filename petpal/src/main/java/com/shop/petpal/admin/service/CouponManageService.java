package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.CouponManage;

public interface CouponManageService {
	public List<CouponManage> listCoupon(Map<String, Object> map);
	public void insertCoupon(CouponManage couponManage) throws Exception;
	
}
