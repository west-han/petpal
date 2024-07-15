package com.shop.petpal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.Mypage2Service;

@Controller
@RequestMapping("/myPage2/*")
public class MyPageController2 {
	
	@Autowired
	private Mypage2Service service;
	
	@GetMapping("orderlist")
	public String orderlistForm() throws Exception {
		
		return ".myPage2.orderlist";
	}
	@GetMapping("cancel-return-change")
	public String ancelreturnchangeForm() throws Exception {
		
		return ".myPage2.cancel-return-change";
	}
	@GetMapping("mycoupon")
	public String mycouponForm() throws Exception {
		
		return ".myPage2.mycoupon";
	}
	
	@GetMapping("mypoint")
	public String mypointFrom() throws Exception {
		// 마이페이지 포인트리스트
		
		
		return ".myPage2.mypoint";
	}
	
	
	@GetMapping("mypet")
	public String mypetFrom() throws Exception {
		
		return ".myPage2.mypet";
	}
	@GetMapping("mymodify")
	public String mymodifyFrom() throws Exception {
		
		return ".myPage2.mymodify";
	}
	@GetMapping("likelist")
	public String likelistFrom() throws Exception {
		
		return ".myPage2.likelist";
	}
	
	
	@GetMapping("myreview")
	public String myreviewForm(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		service.myPointList(info.getMemberNum());
		
		
		return ".myPage2.myreview";
	}
	
	
	
	
	
	
}
