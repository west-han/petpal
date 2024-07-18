package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.domain.CouponManage;
import com.shop.petpal.admin.mapper.CouponManageMapper;

@Service
public class CouponManageServiceImpl implements CouponManageService{
	@Autowired
	private CouponManageMapper mapper;

	@Override
	public List<CouponManage> listCoupon(Map<String, Object> map) {
		List<CouponManage> list = null;
		try {
			list = mapper.listCoupon(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertCoupon(CouponManage couponManage) throws Exception {
		
		
		
		
	}
	
	
	
	
}
