package com.shop.petpal.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.petpal.admin.service.ReviewManageService;

@Controller
@RequestMapping("/admin/review/*")
public class ReviewManageController {

	@Autowired
	private ReviewManageService service;
	
	@GetMapping("list")
	public String listCoupon(Map<String, Object> map,Model model) {
		
			
		
		return ".admin.coupon.list";
	}
	
	
	
}
