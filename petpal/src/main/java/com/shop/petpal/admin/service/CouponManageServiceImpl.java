package com.shop.petpal.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.petpal.admin.domain.CouponManage;
import com.shop.petpal.admin.domain.MemberCoupon;
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
		
		try {
			mapper.insertCoupon(couponManage);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		
	}

	@Override
	public void grantCoupon(MemberCoupon memberCoupon) throws Exception {
		try {
			mapper.grantCoupon(memberCoupon);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
    @Transactional(readOnly = true)
    public boolean checkMemberExists(long memberNum) throws Exception {
        try {
            return mapper.memberExists(memberNum) > 0;
        } catch (SQLException e) {
            throw new Exception("Error checking member existence", e);
        }
    }
	
	
}
