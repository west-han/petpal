package com.shop.petpal.admin.controller;

import java.net.URLDecoder;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.admin.domain.ReviewManage;
import com.shop.petpal.admin.service.ReviewManageService;
import com.shop.petpal.common.MyUtil;
import com.shop.petpal.domain.SessionInfo;

@Controller
@RequestMapping("/admin/review/*")
public class ReviewManageController {

	@Autowired
	private ReviewManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("list")
	public String listReview(HttpSession session,
			Model model) throws Exception{
		
		
		return ".admin.review.list";
	}
	
	@GetMapping("reviewList")
	public String listreview(
	        @RequestParam(value = "pageNo", defaultValue = "1") int current_page,
	        @RequestParam(defaultValue = "1") int gubun,
	        @RequestParam(defaultValue = "productName") String schType,
	        @RequestParam(defaultValue = "") String kwd,
	        HttpServletRequest req,
	        HttpSession session,
	        Model model) throws Exception {
	    
	    // 디버깅 로그 추가
	    System.out.println("listreview 메서드 호출됨");
	    System.out.println("pageNo: " + current_page);
	    System.out.println("gubun: " + gubun);

	    int size = 2;
	    int total_page = 0;
	    int dataCount = 0;

	    kwd = URLDecoder.decode(kwd, "utf-8");

	    // 전체 페이지 수
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("gubun", gubun);
	    map.put("schType", schType);
	    map.put("kwd", kwd);

	    dataCount = service.dataCount(map);
	    if (dataCount != 0) {
	        total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
	    }

	    if (total_page < current_page) {
	        current_page = total_page;
	    }

	    int offset = (current_page - 1) * size;
	    if (offset < 0) offset = 0;

	    map.put("offset", offset);
	    map.put("size", size);

	    List<ReviewManage> list = service.listReview(map);

	    String paging = myUtil.pagingMethod(current_page, total_page, "listReview");

	    model.addAttribute("list", list);
	    model.addAttribute("dataCount", dataCount);
	    model.addAttribute("pageNo", current_page);
	    model.addAttribute("size", size);
	    model.addAttribute("total_page", total_page);
	    model.addAttribute("paging", paging);

	    return "admin/review/reviewlist";
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
