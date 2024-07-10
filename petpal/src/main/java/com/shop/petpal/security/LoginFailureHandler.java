package com.shop.petpal.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.shop.petpal.service.MemberService;

public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String defaultFailureUrl;
	
	@Autowired
	MemberService memberService;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String email = request.getParameter("email");
		String errorMsg = "아이디 또는 패스워드가 일치하지 않습니다.";
		
		try {
			if (exception instanceof BadCredentialsException) {
				
				memberService.updateFailureCount(email);
				
				int count = memberService.checkFailureCount(email);
				
				if (count >= 5) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("enabled", 0);
					map.put("email", email);
					map.put("stateCode", 1);
					
					memberService.updateMemberEnabled(map);
				}
			} else if (exception instanceof InternalAuthenticationServiceException) {
				
			} else if (exception instanceof DisabledException){
				// enabled 컬럼 값이 0인 경우
				errorMsg = "인증이 불가능합니다. 관리자에게 문의하세요.";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("message", errorMsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

}
