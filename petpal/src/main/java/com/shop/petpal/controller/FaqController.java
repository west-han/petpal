package com.shop.petpal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/faq/*")
public class FaqController {
	
	@GetMapping("faq")
	public String orderlistForm() throws Exception {
		
		
		return ".faq.faq";
	}
}
