package com.shop.petpal.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Member;
import com.shop.petpal.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;

	@Override
	public void updateLastLogin(String email) throws SQLException {
		// 마지막로그인과 FailCount 초기화
		try {
			mapper.updateLastLogin(email);
			mapper.updateFailureCountReset(email);
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
			member = mapper.findByEmail(email);
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

	@Override
	public void updateMember(Member dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void checkFailureCountReset(String email) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void MemberAuthority(String email) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void insertMember(Member dto) throws Exception {
	    try {
	        // 패스워드 암호화
	        String encPwd = bcryptEncoder.encode(dto.getPassword());
	        dto.setPassword(encPwd);

	        // 회원 시퀀스 증가 및 설정
	        long memberSeq = mapper.memberSeq();
	        dto.setMemberNum(memberSeq);
	        
	        
	        logger.info("Generated memberNum for member2: {}", memberSeq);
	        // 회원 정보 삽입
	        mapper.insertMember1(dto);
	        mapper.insertMember2(dto);
	        
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("memberNum", dto.getMemberNum());
	        mapper.updateArea(map);
	        
	        // 권한 저장
	        dto.setAuthority("USER");
	        mapper.insertMemberAuthority(dto);
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

	@Override
	public Member findByEmail(String email) throws Exception {
		// TODO 이메일 중복 체크
		
		Member dto = null;
		
		try {
			dto = mapper.findByEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Member findByNickName(String nickname) throws Exception {
		// TODO 닉네임 중복체크
		
		Member dto = null;
		
		try {
			dto = mapper.findByNickName(nickname);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return dto;
	}
	
	
}
