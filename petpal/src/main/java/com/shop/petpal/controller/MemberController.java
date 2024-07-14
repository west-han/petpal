package com.shop.petpal.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.petpal.domain.Member;
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
		return "/member/join";
	}

	@PostMapping("join")
	public String joinSubmit(Member dto, final RedirectAttributes reAttr, Model model) {

		// 전화번호 - 잘라오기
		if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
			dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
		}
		try {
			service.insertMember(dto);
		} catch (DuplicateKeyException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
		} catch (Exception e) {

			model.addAttribute("message", "회원가입이 실패했습니다.");
			return "/member/join";
		}
		StringBuilder sb = new StringBuilder();
		sb.append(dto.getUserName() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");

		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "회원 가입");

		return "redirect:/member/login";
	}

	@PostMapping("userEmailCheck")
	@ResponseBody
	public Map<String, Object> emailCheck(@RequestParam String email) throws Exception {
		// 이메일 중복 검사
		String p = "true";
		Member dto = service.findByEmail(email);
		if (dto != null) {
			p = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}

	@PostMapping("userNicknameCheck")
	@ResponseBody
	public Map<String, Object> nickNameCheck(@RequestParam String nickname) throws Exception {

		String p = "true";
		Member dto = service.findByNickName(nickname);
		if (dto != null) {
			p = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}

	@GetMapping("notAuthorized")
	public String notAuthorized(Model model) {
		return ".member.notAuthorized";
	}
}
