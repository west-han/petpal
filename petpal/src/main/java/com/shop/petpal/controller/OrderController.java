package com.shop.petpal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@GetMapping("payment")
	public String paymentForm() throws Exception {
		
		return ".order.payment";
	}
	
	@GetMapping("done")
	public String done() throws Exception {
		
		return ".order.done";
	}

}
