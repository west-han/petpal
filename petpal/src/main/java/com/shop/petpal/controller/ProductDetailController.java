package com.shop.petpal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class ProductDetailController {
	@GetMapping("buy")
	public String buyDetail() throws Exception {
		
		
		return ".product.buy";
	}
}
