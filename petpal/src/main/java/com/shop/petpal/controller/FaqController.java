package com.shop.petpal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/faq/*")
public class FaqController {
	
	@GetMapping("faq")
	public String feqForm() throws Exception {
		
		
		return ".faq.faq";
	}
	
	@GetMapping("onetoone")
	public String onetonoeForm() throws Exception {
		
		
		return ".faq.onetoone";
	}
	
	@GetMapping("notice")
	public String noticeForm() throws Exception {
		
		
		return ".faq.notice";
	}
	
	
	
}
