package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage2;

public interface MypageMapper2 {
	// 포인트 리스트
	public List<Mypage2> myPointList(long memberNum) throws SQLException;
	public int pointDataCount(long memberNum) throws SQLException;
	public List<Mypage2> myPointListPaged(Map<String, Object> params) throws SQLException;
	public int myTotalPoint(long memberNum) throws SQLException;
	
	// 회원정보 수정
	public Member findByMemberNum(long memberNum); // 회원정보 가져오기
	public Member findByMemberEmail(String email); // 회원정보 가져오기
	public void updateMember(Member memberDto) throws SQLException; // 회원정보 수정
	public void updateMemberPassword(Member memberDto) throws SQLException; // 비밀번호 수정
	
	
	
	
}
