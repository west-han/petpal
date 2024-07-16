package com.shop.petpal.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Mypage2;
import com.shop.petpal.mapper.MypageMapper2;


@Service
public class Mypage2ServiceImpl implements Mypage2Service {
	
	@Autowired
	private MypageMapper2 mapper;

	@Override
	public List<Mypage2> myPointList(long memberNum) {
		List<Mypage2> list = new ArrayList<Mypage2>();
		
		try {
			list = mapper.myPointList(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int pointDataCount(long memberNum) {
		int count = 0;
        
        try {
            count = mapper.pointDataCount(memberNum);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return count;
	}

	@Override
	public List<Mypage2> myPointListPaged(Map<String, Object> params) {
		List<Mypage2> list = new ArrayList<>();
        
        try {
            list = mapper.myPointListPaged(params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
	}

	@Override
	public int myTotalPoint(long memberNum) throws Exception {
		int totalPoint = 0;
		
		try {
			totalPoint = mapper.myTotalPoint(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return totalPoint;
	}
	
}
