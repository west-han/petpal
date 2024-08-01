package com.shop.petpal.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.petpal.common.MyUtil;
import com.shop.petpal.domain.Onetoone;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.OnetooneService;

@Controller
@RequestMapping("/onetoone/*")
public class OnetooneController {
	@Autowired
	private OnetooneService service;
	
	@Autowired
	private MyUtil myUtil;	
	
	
	@RequestMapping("list")
	public String list(@RequestParam(name = "page", value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<Onetoone> list = service.listQna(map);
		
		String query = "";
		String listUrl = cp + "/onetoone/list";
		String articleUrl = cp + "/onetoone/article?page=" + current_page;
		
		if (query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		return ".onetoone.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		
		return ".onetoone.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Onetoone dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "onetoone";
		
		try {
			dto.setMemberNum(info.getMemberNum());
			service.insertQna(dto, path);
		} catch (Exception e) {
		}
		
		return "redirect:/onetoone/list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam(name = "num") long num,
			@RequestParam(name = "page") String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String query = "page=" + page;
		
		Onetoone dto = service.findById(num);
		if(dto == null) {
			return "redirect:/onetoone/list?" + query;
		}
		
		if(dto.getMemberNum() != info.getMemberNum()) {
			return "redirect:/";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		List<Onetoone> listFile = service.listFileList(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		
		return ".onetoone.article";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam(name = "num") long num,
			@RequestParam(name = "page") String page,
			HttpSession session) throws Exception {
		
		String query = "page=" + page;
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "onetoone";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Onetoone dto = service.findById(num);
		if (dto == null) {
			return "redirect:/onetoone/list?page=" + page;
		}
		
		if (dto.getMemberNum() != info.getMemberNum()) {
			return "redirect:/";
		}
		
		try {
			service.deleteQna(num, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/onetoone/list?" + query;
	}
	
	
}
