package com.shop.petpal.service;

import java.sql.SQLException;

import com.shop.petpal.domain.Member;

public interface MemberService {
	public Member loginMember(String email);
	public void updateLastLogin(String email) throws SQLException;
	public void updateFailureCount(String email) throws SQLException;
}
