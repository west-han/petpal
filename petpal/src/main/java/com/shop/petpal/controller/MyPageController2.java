package com.shop.petpal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage2/*")
public class MyPageController2 {
	
	@GetMapping("myreview")
	public String myReview() throws Exception {
		
		return ".myPage2.myreview";
	}
	
	@GetMapping("likelist")
	public String likelist() throws Exception {
		
		return ".myPage2.likelist";
	}
	
	@GetMapping("mymodify")
	public String mymodify() throws Exception {
		
		return ".myPage2.mymodify";
	}
}
