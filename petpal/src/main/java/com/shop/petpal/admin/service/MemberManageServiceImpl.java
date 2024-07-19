package com.shop.petpal.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.mapper.MemberManageMapper;
import com.shop.petpal.domain.Member;

@Service
public class MemberManageServiceImpl implements MemberManageService{

	@Autowired
	private MemberManageMapper memberManageMapper;
	
	@Override
	public List<Member> findAllMembers() {
		
		return memberManageMapper.findAllMembers();
	}
	


}
