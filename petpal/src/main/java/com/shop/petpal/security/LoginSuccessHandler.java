package com.shop.petpal.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.MemberService;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	private String defaultUrl;

	// 로그인 페이지로 이동하기 전에 클라이언트가 원래 요청했던 정보를 캐싱하는 객체
	// 클라이언트의 요청 정보는 HttpSessionRequestCache() 객체 안에 담긴
	//   SavedRequest 구현체(DefaultSavedRequest 객체)에 저장된다.
	private RequestCache requestCache = new HttpSessionRequestCache();
	
	// 스프링 시큐리티에서 화면 이동할 때 쓰는 인터페이스
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		String email = authentication.getName();
		System.err.println("성공!");
		try {
			memberService.updateLastLogin(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		Member member = memberService.loginMember(email);
		SessionInfo info = new SessionInfo();
		
		info.setMemberNum(member.getMemberNum());
		info.setMembershipNum(member.getMembershipNum());
		info.setUserName(member.getUserName());
		info.setNickname(member.getNickname());
		
		session.setAttribute("member", info);
		
		resultRedirectStrategy(request, response, authentication);
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	private void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		String targetUrl = defaultUrl;
		
		if (savedRequest != null) {
			targetUrl = savedRequest.getRedirectUrl();
		}
		
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}
}
