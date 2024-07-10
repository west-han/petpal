package com.shop.petpal.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Member;
import com.shop.petpal.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;

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

	@Override
	public Member findById(String email) {
		Member member = null;
		
		try {
			member = mapper.findById(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public Member findById(long memberNum) {
		Member member = null;
		
		try {
			member = mapper.findByMemberNum(memberNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public int checkFailureCount(String email) {
		// NOTE: email이 존재하지 않는 경우 mapper가 null을 반환해서 예외가 발생, int 타입을 Integer 타입으로 변경
		Integer count = 0;
		
		try {
			count = mapper.checkFailureCount(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count == null ? 0 : count.intValue();
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws SQLException {
		try {
			mapper.updateMemberEnabled(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
