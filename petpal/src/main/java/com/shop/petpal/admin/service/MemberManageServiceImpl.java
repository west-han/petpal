package com.shop.petpal.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.mapper.MemberManageMapper;
import com.shop.petpal.domain.Member;

@Service
public class MemberManageServiceImpl implements MemberManageService {

    @Autowired
    private MemberManageMapper memberManageMapper;

    @Override
    public List<Member> findAllMembers() {
        return memberManageMapper.findAllMembers();
    }

    @Override
    public Member findById(Long memberNum) {
        return memberManageMapper.findById(memberNum);
    }

    
    @Override
    public void updateMember(Member member) {
    	try {
            // 이메일이 부분적으로 입력된 경우 이메일 전체를 생성하여
    		
            if (member.getEmail().length() != 0) {
            	member.setEmail(member.getEmail());
            }

            // 전화번호가 부분적으로 입력된 경우 전화번호 전체를 생성하여 설
            if (member.getTel1() != null && member.getTel2() != null && member.getTel3() != null &&
            		member.getTel1().length() != 0 &&
            		member.getTel2().length() != 0 &&
            		member.getTel3().length() != 0) {
            	member.setTel(member.getTel1() + "-" + member.getTel2() + "-" + member.getTel3());
            }

            // 회원 정보를 member1 테이블에 업데이트
            // 패스워드가 변경된 경우에만 업데이트하도록 해야 하지만, 현재 조건이 없음
            memberManageMapper.updateMember1(member);
            memberManageMapper.updateMember2(member);
            
        } catch (Exception e) {
            // 예외 발생 시 스택 트레이스를 출력하고 예외를 다시 던짐
            e.printStackTrace();
            throw e;
        }        
    }
}

