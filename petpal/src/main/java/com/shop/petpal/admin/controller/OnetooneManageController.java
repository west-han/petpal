package com.shop.petpal.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.admin.domain.OnetooneManage;
import com.shop.petpal.admin.service.OnetooneManageService;
import com.shop.petpal.domain.SessionInfo;

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
	
	@PostMapping("/saveResponse")
	@ResponseBody
	public ResponseEntity<?> saveResponse(@RequestBody OnetooneManage onetooneManage, HttpSession session) {
	    try {
	        // 세션에서 memberNum 가져오기
	        
	    	SessionInfo info = (SessionInfo) session.getAttribute("member");
	        if (info != null) {
	        	onetooneManage.setAnswerNum(info.getMemberNum());
	            service.saveResponse(onetooneManage);
	            return ResponseEntity.ok().build();
	        } else {
	        	
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
	        }
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
	    }
	}
	
}
