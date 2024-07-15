package com.shop.petpal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Mypage2;
import com.shop.petpal.mapper.MypageMapper2;

@Service
public class Mypage2ServiceImpl implements Mypage2Service {
	
	@Autowired
	private MypageMapper2 mapper;

	@Override
	public List<Mypage2> myPointList(long memberNums) {
		List<Mypage2> pointlist = null;
		try {
			pointlist = mapper.myPointList(memberNums);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pointlist;
	}

	
}
