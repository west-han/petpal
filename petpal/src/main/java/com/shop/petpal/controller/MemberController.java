package com.shop.petpal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.petpal.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	BCryptPasswordEncoder enc;
	
	@RequestMapping("login")
	public String loginForm(HttpServletRequest req) {
		
		
		return "member/login2";
	}
	
	@GetMapping("member")
	public String memberForm(Model model) {
		model.addAttribute("mode", "member");
		return "/member/member";
	}
	@GetMapping("pet")
	public String petForm(Model model) {
		model.addAttribute("mode", "member");
		return "/member/pet";
	}
	
	@GetMapping("mypage")
	public String mypageForm(Model model) {
		model.addAttribute("mode", "member");
		return ".member.mypage";
	}
	
	@GetMapping("join")
	public String joinForm(Model model) {
		// TODO: 회원 가입 페이지를 마이페이지 회원 정보 수정 페이지로 재활용할 거면 mode 추가하기
		return ".member.join";
	}
	
	@GetMapping("notAuthorized")
	public String notAuthorized(Model model) {
		return ".member.notAuthorized";
	}
}
