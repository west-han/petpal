package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.Map;

import com.shop.petpal.domain.Member;

public interface MemberMapper {
	public Member loginMember(String email);
	public void updateLastLogin(String email) throws SQLException;
	public void updateFailureCount(String email) throws SQLException;
	public Member findById(String email);
	public Member findByMemberNum(long memberNum);
	public Integer checkFailureCount(String email);
	public void updateMemberEnabled(Map<String, Object> map) throws SQLException;
	
	// 회원가입
	public long memberSeq(); // 시퀀스 증가
	public void insertMember1(Member dto) throws SQLException; // member1 회원가입
	public void insertMember2(Member dto) throws SQLException;// member2 회원가입
	public void insertMemberAuthority(Member dto) throws SQLException; // USER 권한 부여
	
	
}
