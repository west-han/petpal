package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Mypage2;

public interface Mypage2Service {
	public List<Mypage2> myPointList(long memberNum) throws Exception; // 포인트 리스트
	public int pointDataCount(long memberNum) throws Exception;; // 데이터카운트
	public List<Mypage2> myPointListPaged(Map<String, Object> params) throws Exception; // 포인트 날짜 검색
}
