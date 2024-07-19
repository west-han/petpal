package com.shop.petpal.admin.service;

import java.util.List;

import com.shop.petpal.domain.Member;

public interface MemberManageService {
	List<Member> findAllMembers();
}
