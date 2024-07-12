package com.shop.petpal.admin.controller;


import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.admin.domain.ProductManage;
import com.shop.petpal.admin.service.ProductManageService;
import com.shop.petpal.common.MyUtil;







@Controller
@RequestMapping("/admin/product/*")
public class ProductManageController {

	
	@Autowired
	private ProductManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = {"{menuItem}/main", "/main"})
	public String list(@PathVariable(required = false) Optional<Integer> menuItem,
		@RequestParam(defaultValue = "0") long parentNum,
		@RequestParam(defaultValue = "0") long categoryNum,
		@RequestParam(defaultValue = "1") int productShow,
		@RequestParam(defaultValue = "all") String schType,
		@RequestParam(defaultValue = "") String kwd,		
		@RequestParam(value = "page", defaultValue = "1") int current_page,
		HttpServletRequest req,
		Model model) throws Exception {
	
		/*
		String str = null;
		String s = Optional.ofNullable(str).orElse("test"); // str 이 null 이면 test 반환하고 그렇지 않으면 str 값 반한
		*/
		int classify = menuItem.orElse(100);
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		List<ProductManage> listCategory = service.listCategory(); 
		List<ProductManage> listSubCategory = null;
		if(parentNum == 0 && listCategory.size() !=0) {
			parentNum = listCategory.get(0).getCategoryNum();
		}
		listSubCategory = service.listSubCategory(parentNum);
		if(categoryNum == 0 && listSubCategory.size() != 0) {
			categoryNum = listSubCategory.get(0).getCategoryNum();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("classify", classify);
		map.put("parentNum", parentNum);
		map.put("categoryNum", categoryNum);
		map.put("productShow", productShow);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<ProductManage> list = service.listProduct(map);
		
		String listUrl = cp + "/admin/product/" + classify + "/main";
		String articleUrl = cp + "/admin/product/" + classify + "/article?page=" + current_page;
		
		String query = "parentNum=" + parentNum + "&categoryNum="+categoryNum;
		if(productShow != -1) {
			query += "&productShow="+productShow;
		}
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}		
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("classify", classify);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		
		model.addAttribute("productShow", productShow);
		model.addAttribute("parentNum", parentNum);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
				
		return ".admin.product.list";
	}
	
	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(
			@RequestParam long parentNum) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<ProductManage> listSubCategory = service.listSubCategory(parentNum);
		
		model.put("listSubCategory", listSubCategory);
		
		return model;
	}
	
//	@GetMapping("{classify}/write")
//	public String writeForm(@PathVariable int classify, Model model) {
//		List<ProductManage> listCategory = service.listCategory();
//		List<ProductManage> listSubCategory = null;
//		long parentNum = 0;
//		if(listCategory.size() !=0) {
//			parentNum = listCategory.get(0).getCategoryNum();
//		}
//		listSubCategory = service.listSubCategory(parentNum);
//		
//		model.addAttribute("mode", "write");
//		model.addAttribute("classify", classify);
//		model.addAttribute("listCategory", listCategory);
//		model.addAttribute("listSubCategory", listSubCategory);
//		
//		return ".admin.product.write";
//	}
//	
//	@PostMapping("{classify}/write")
//	public String writeSubmit(@PathVariable int classify,
//			ProductManage dto,
//			HttpSession session,
//			Model model) {
//		
//		String root = session.getServletContext().getRealPath("/");
//		String path = root + "uploads" + File.separator + "product";
//		
//		try {
//			service.insertProduct(dto, path);
//		} catch (Exception e) {
//		}
//		
//		String url = "redirect:/admin/product/" + classify + "/main?parentNum=" + dto.getParentNum()
//						+ "&categoryNum=" + dto.getCategoryNum();
//		
//		return url;
//	}
	@GetMapping("list")
	public String listForm() {
		return ".admin.product.list";
	}
	@GetMapping("write")
	public String writeForm() {
		return ".admin.product.write";
	}
	
	
}
