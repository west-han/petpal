package com.shop.petpal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage/*")
public class MyPageController {
	
	@GetMapping("cart")
	public String cartList() throws Exception {
		
		return ".myPage.cart";
	}
}
