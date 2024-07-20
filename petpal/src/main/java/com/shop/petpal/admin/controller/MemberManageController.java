package com.shop.petpal.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.admin.service.MemberManageService;
import com.shop.petpal.domain.Member;

@Controller
public class MemberManageController {
    @Autowired
    private MemberManageService memberManageService;

    @GetMapping("/admin/member/list")
    public String main(Model model) {
        List<Member> members = memberManageService.findAllMembers();
        model.addAttribute("members", members);
        return ".admin.member.list";
    }

    @GetMapping("/admin/member/{memberNum}")
    @ResponseBody
    public ResponseEntity<Member> getMember(@PathVariable Long memberNum) {
        Member member = memberManageService.findById(memberNum);
        if (member != null) {
            return ResponseEntity.ok(member);
        } else {
            return ResponseEntity.notFound().build();
            
        }
    }

    @PutMapping("/admin/member/{memberNum}")
    @ResponseBody
    public ResponseEntity<Void> updateMember(@PathVariable Long memberNum, @RequestBody Member member) {
        memberManageService.updateMember(member);
        return ResponseEntity.ok().build();
    }
}
