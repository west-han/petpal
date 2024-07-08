package com.shop.petpal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@GetMapping("login")
	public String login() {
		return "/member/login";
	}
	
	@PostMapping("login")
	public String loginSubmit(@RequestParam(value = "userId") String email, 
			@RequestParam(value = "userPwd") String password,
			HttpSession session,
			Model model) throws Exception {

		Member member = service.loginMember(email);

		if (member == null || !password.equals(member.getPassword())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			service.updateFailureCount(email);
			return "/member/login";
		}
		
		SessionInfo info = new SessionInfo();
		info.setMemberNum(member.getMemberNum());
		info.setMembershipNum(member.getMembershipNum());
		info.setNickname(member.getNickname());
		info.setUserName(member.getUserName());
		
		session.setAttribute("member", info);

		session.setMaxInactiveInterval(60 * 60);
		
		String uri = (String)session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:/" + uri;
		}
		
		return uri;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		session.invalidate();
		
		return "redirect:/";
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
