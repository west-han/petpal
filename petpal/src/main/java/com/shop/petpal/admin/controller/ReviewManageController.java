package com.shop.petpal.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.shop.petpal.admin.domain.ReviewManage;
import com.shop.petpal.admin.service.ReviewManageService;
import com.shop.petpal.domain.SessionInfo;

@Controller
@RequestMapping("/admin/review/*")
public class ReviewManageController {

	@Autowired
	private ReviewManageService service;
	
	@GetMapping("list")
	public String listReview(Map<String, Object> map,Model model) {
		
		List<ReviewManage> list = service.listReview(map);
		model.addAttribute("list",list);	
		
		return ".admin.review.list";
	}
	
	@PostMapping("/saveResponse")
	@ResponseBody
	public ResponseEntity<?> saveResponse(@RequestBody ReviewManage reviewManage, HttpSession session) {
	    try {
	        // 세션에서 memberNum 가져오기
	        
	    	SessionInfo info = (SessionInfo) session.getAttribute("member");
	        if (info != null) {
	            reviewManage.setAnswerNum(info.getMemberNum());
	            service.saveResponse(reviewManage);
	            return ResponseEntity.ok().build();
	        } else {
	        	
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
	        }
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
	    }
	}
	
}
