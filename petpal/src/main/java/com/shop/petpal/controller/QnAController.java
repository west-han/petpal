package com.shop.petpal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shop.petpal.common.MyUtil;
import com.shop.petpal.domain.QnA;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.QnAService;

@RestController
@RequestMapping("/qna/*")
public class QnAController {
	@Autowired
	private QnAService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@PostMapping("write")
	public Map<String, Object> writeOk(QnA dto, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		String state = "true";
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setMemberNum(info.getMemberNum());
			
			service.insertQnA(dto);
			
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}
	
	@GetMapping("list")
	public Map<String, Object> list(@RequestParam long productNum, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			Map<String, Object> map = new HashMap<String, Object>();
			int size = 5;
			int dataCount = 0;
			
			map.put("productNum", productNum);
			dataCount = service.dataCount(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if(current_page > total_page) {
				current_page = total_page;
			}
			
			int offset = (current_page - 1) * size;
			if(offset < 0) {
				offset = 0;
			}
			
			map.put("size", size);
			map.put("offset", offset);
			
			List<QnA> list = service.listQnA(map);
			for(QnA dto : list) {
				if(dto.getSecret() == 0 && (info == null || info.getAuthority() != "admin" && dto.getMemberNum() != info.getMemberNum())) {
					dto.setContent("비밀글입니다. <i class='bi bi-file-lock2'></i>");
					dto.setAnswer("");
					
				}
			}
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listQnA");
			
			map.put("size", size);
			map.put("total_page", total_page);
			map.put("dataCount", dataCount);
			map.put("pageNo", current_page);
			map.put("paging", paging);
			map.put("list", list);
			
			
		} catch (Exception e) {
		}
		
		return model;
	}
}
