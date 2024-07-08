package com.shop.petpal.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Member;
import com.shop.petpal.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public Member loginMember(String email) {
		Member member = null;
		
		try {
			member = mapper.loginMember(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public void updateLastLogin(String email) throws SQLException {
		try {
			mapper.updateLastLogin(email);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateFailureCount(String email) throws SQLException {
		try {
			mapper.updateFailureCount(email);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
