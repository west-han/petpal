package com.shop.petpal.service;

import java.sql.SQLException;
import java.util.Map;

import com.shop.petpal.domain.Member;

public interface MemberService {
	public void updateLastLogin(String email) throws SQLException;
	public void updateFailureCount(String email) throws SQLException;
	public Member findById(String email);
	public Member findById(long memberNum);
	public int checkFailureCount(String email);
	public void updateMemberEnabled(Map<String, Object> map) throws SQLException;
}
