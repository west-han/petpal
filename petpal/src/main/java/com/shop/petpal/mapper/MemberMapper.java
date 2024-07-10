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
}
