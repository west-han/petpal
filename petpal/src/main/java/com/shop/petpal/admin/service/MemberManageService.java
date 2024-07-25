package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.UserPoint;

public interface MemberManageService {
	public List<Member> findAllMembers();
	public Member findById(Long memberNum);
	public void updateMember(Member member);
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	 // 포인트 관련 메서드 추가
    public void updatePoints(Long memberNum, int point);
}
