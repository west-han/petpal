package com.shop.petpal.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.admin.service.MemberManageService;
import com.shop.petpal.common.MyUtil;
import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.UserPoint;

@Controller
public class MemberManageController {
    @Autowired
    private MemberManageService memberManageService;
    
    @Autowired
    private MyUtil myUtil;

    @GetMapping("/admin/member/{memberNum}") 
    @ResponseBody
    public ResponseEntity<Member> getMember(@PathVariable(name = "memberNum") Long memberNum) {
        Member member = memberManageService.findById(memberNum);
        if (member != null) {
            return ResponseEntity.ok(member);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PutMapping("/admin/member/{memberNum}")
    @ResponseBody
    public ResponseEntity<Void> updateMember(@PathVariable(name = "memberNum") Long memberNum, @RequestBody Member member) {
        member.setMemberNum(memberNum);
        memberManageService.updateMember(member);
        return ResponseEntity.ok().build();
    }
    
    @PutMapping("/admin/member/points/{memberNum}")
    @ResponseBody
    public ResponseEntity<Void> updatePoints(@PathVariable(name = "memberNum") Long memberNum, @RequestBody UserPoint pointsData) {
        
    	try {
    		memberManageService.updatePoints(memberNum, pointsData.getPoint());
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return ResponseEntity.ok().build();
    }
    
    @RequestMapping("/admin/member/list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "email") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equals("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		// 데이터 개수 / 전체 페이지수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = memberManageService.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		// 리스트
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
		
		List<Member> list = memberManageService.listMember(map);
		
		String query = "";
		String cp = req.getContextPath();
		String listUrl;
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" +
					URLEncoder.encode(kwd, "utf-8");
		}
		
		listUrl = cp + "/admin/member/list";
		if(query.length() != 0) {
			listUrl += "?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 포워딩할 JSP에 전달할 모델
		model.addAttribute("members", list);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("paging", paging);
		
		return ".admin.member.list";
	}
}
