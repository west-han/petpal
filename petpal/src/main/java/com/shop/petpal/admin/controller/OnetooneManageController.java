package com.shop.petpal.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.petpal.admin.domain.OnetooneManage;
import com.shop.petpal.admin.service.OnetooneManageService;

@Controller
@RequestMapping("/admin/onetoone/*")
public class OnetooneManageController {
	
	@Autowired
	private OnetooneManageService service;
	
	
	@GetMapping("list")
	public String listOnetoone(Map<String,Object> map, Model model) {
		List<OnetooneManage> list = service.listOnetoone(map);
		model.addAttribute("list",list);
		
		return ".admin.onetoone.list";
	}
	
	
	
}
