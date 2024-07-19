package com.shop.petpal.admin.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	

	
}
