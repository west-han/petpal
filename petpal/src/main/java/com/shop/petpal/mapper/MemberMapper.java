package com.shop.petpal.mapper;

import com.shop.petpal.domain.Member;

public interface MemberMapper {
	public Member loginMember(String email);
	public void updateLastLogin(String email);
	public void updateFailureCount(String email);
}
