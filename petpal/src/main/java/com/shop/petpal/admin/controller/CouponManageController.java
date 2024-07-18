package com.shop.petpal.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.petpal.admin.domain.CouponManage;
import com.shop.petpal.admin.service.CouponManageService;

@Controller
@RequestMapping("/admin/coupon/*")
public class CouponManageController {
	
	@Autowired
	private CouponManageService service;
	
	@GetMapping("list")
	public String listCoupon(Map<String, Object> map,Model model) {
		
			List<CouponManage> list = service.listCoupon(map);
			model.addAttribute("list",list);
		
		return ".admin.coupon.list";
	}
	

  
	
}
