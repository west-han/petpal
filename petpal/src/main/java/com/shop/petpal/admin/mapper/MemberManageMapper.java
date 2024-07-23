package com.shop.petpal.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.Member;


@Mapper
public interface MemberManageMapper {
	List<Member> findAllMembers();
	Member findById(Long memberNum);
    void updateMember1(Member member);
    void updateMember2(Member member);
	int dataCount(Map<String, Object> map);
	List<Member> listMember(Map<String, Object> map);

}
