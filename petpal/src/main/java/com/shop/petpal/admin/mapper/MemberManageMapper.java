package com.shop.petpal.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.UserPoint;


@Mapper
public interface MemberManageMapper {
	public List<Member> findAllMembers();
	public Member findById(Long memberNum);
	public void updateMember1(Member member);
	public void updateMember2(Member member);
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);

	// 포인트 관련 메서드 추가
	public void updatePoints(UserPoint userPoint);
}
