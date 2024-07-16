package com.shop.petpal.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage2;
import com.shop.petpal.mapper.MypageMapper2;


@Service
public class Mypage2ServiceImpl implements Mypage2Service {
	
	@Autowired
	private MypageMapper2 mapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;

	@Override
	public List<Mypage2> myPointList(long memberNum) {
		List<Mypage2> list = new ArrayList<Mypage2>();
		
		try {
			list = mapper.myPointList(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int pointDataCount(long memberNum) {
		int count = 0;
        
        try {
            count = mapper.pointDataCount(memberNum);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return count;
	}

	@Override
	public List<Mypage2> myPointListPaged(Map<String, Object> params) {
		List<Mypage2> list = new ArrayList<>();
        
        try {
            list = mapper.myPointListPaged(params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
	}

	@Override
	public int myTotalPoint(long memberNum) throws Exception {
		int totalPoint = 0;
		
		try {
			totalPoint = mapper.myTotalPoint(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return totalPoint;
	}

	@Override
	public Member findByMember(long memberNum) {
		Member memberDto = null;
		
		try {
			memberDto = mapper.findByMemberNum(memberNum);
			if(memberDto != null) {
				if(memberDto.getTel() != null) {
					String[] s = memberDto.getTel().split("-");
					memberDto.setTel1(s[0]);
					memberDto.setTel2(s[1]);
					memberDto.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDto;
	}
	@Override
	public Member findByMember(String email) {
		Member memberDto = null;
		
		try {
			memberDto = mapper.findByMemberEmail(email);
			if(memberDto != null) {
				if(memberDto.getTel() != null) {
					String[] s = memberDto.getTel().split("-");
					memberDto.setTel1(s[0]);
					memberDto.setTel2(s[1]);
					memberDto.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDto;
	}

	@Override
	public void updateMember(Member memberDto) throws Exception {
		try {
			if (memberDto.getTel1().length() != 0 && memberDto.getTel2().length() != 0 && memberDto.getTel3().length() != 0) {
				memberDto.setTel(memberDto.getTel1() + "-" + memberDto.getTel2() + "-" + memberDto.getTel3());
			}
			mapper.updateMember(memberDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMemberPassword(Member memberDto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isPasswordCheck(String email, String password) {
		Member memberDto = findByMember(email);
		
		if(memberDto == null) {
			return false;
		}
		return bcryptEncoder.matches(password, memberDto.getPassword());
	}

	
	
}
