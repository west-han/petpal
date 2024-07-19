package com.shop.petpal.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.Member;

@Mapper
public interface MemberManageMapper {
	List<Member> findAllMembers();

}
