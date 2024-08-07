package com.shop.petpal.service;

import java.sql.SQLException;
import java.util.Map;

import com.shop.petpal.domain.Member;

public interface MemberService {
	public Member loginMember(String email); // 세션 로그인
	public void updateLastLogin(String email) throws SQLException;
	public void updateFailureCount(String email) throws SQLException;
	public void updateMember(Member dto) throws Exception;
	public Member findById(String email); // 이메일 체크
	public Member findById(long memberNum); // 이메일(@) 및 전화번호(-) 자르기용도
	public int checkFailureCount(String email); // 비밀번호 틀린 횟수
	public void checkFailureCountReset(String email) throws Exception; //비밀번호 틀린 횟수 초기화
	public void updateMemberEnabled(Map<String, Object> map) throws SQLException; // 로그인가능여부
	
	public void MemberAuthority(String email) throws Exception; // 권한 부여
	public void insertMember(Member dto) throws Exception; // 회원가입
	public Member findByEmail(String email) throws Exception;// 이메일중복 체크
	public Member findByNickName(String nickname) throws Exception;// 닉네임중복 체크
	
	

	
} 
