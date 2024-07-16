package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Mypage2;

public interface MypageMapper2 {
	public List<Mypage2> myPointList(long memberNum) throws SQLException;
	public int pointDataCount(long memberNum) throws SQLException;
	public List<Mypage2> myPointListPaged(Map<String, Object> params) throws SQLException;
	public int myTotalPoint(long memberNum) throws SQLException;
	
}
