package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Member;

public interface MemberManageService {
    List<Member> findAllMembers();
    Member findById(Long memberNum);
    void updateMember(Member member);
	int dataCount(Map<String, Object> map);
	List<Member> listMember(Map<String, Object> map);
}
