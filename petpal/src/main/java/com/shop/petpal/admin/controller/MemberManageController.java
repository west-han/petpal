package com.shop.petpal.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MemberManageController {
	@GetMapping("/admin/member/list")
	public String main(Model model) {
		
		
		return ".abmin.member.list";
	}

	
}
