package com.shop.petpal.admin.controller;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.admin.domain.Attribute;
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
	
	@GetMapping("write")
	// @GetMapping("{classify}/write")
	public String writeForm(
			// TODO: 일반 상품 / 특가 상품 구분 구현한 이후에는 classify 들어간 코드들 주석 풀어서 쓰기
			@RequestParam(defaultValue = "1") int species,
			Model model) { // , @PathVariable classify) {
		
		List<Map<String, Object>> categories = service.listCategory(species);
		
//		int parentCategory = 0;
//		if (categories != null && categories.size() > 0) {
//			parentCategory = ((BigDecimal)categories.get(0).get("CATEGORYNUM")).intValue();			
//		}
//		List<Map<String, Object>> subCategories = service.listSubCategory(parentCategory);
//		model.addAttribute("subCategories", subCategories);
		
		// model.addAttribute("classify", classify);
		model.addAttribute("mode", "write");
		model.addAttribute("categories", categories);
		
		return ".admin.product.write";
	}
	
	/**
	 * @param productManage
	 * @param attrDtlNums
	 * @return
	 */
	@PostMapping("write")
	public String writeSubmit(ProductManage productManage, HttpSession session) {
		// NOTE: 필요한 파라미터 - 상품 정보를 담는 DTO
		
		String path = session.getServletContext().getRealPath("/")
				+ "uploads" + File.separator + "product";
		
		try {
			 service.insertProduct(productManage, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/product/write";
	}
	
	@GetMapping("listCategory")
	@ResponseBody
	public Map<String, Object> listCategory(@RequestParam int species) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Map<String, Object>> categories = service.listCategory(species);
		
		model.put("categories", categories);
		
		return model;
	}
	
	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(@RequestParam int parentCategory) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Map<String, Object>> subCategories = service.listSubCategory(parentCategory);
		
		model.put("subCategories", subCategories);
		
		return model;
	}
	
	@GetMapping("listAttribute")
	@ResponseBody
	public Map<String, Object> listAttribute(@RequestParam int parentCategory) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Attribute> attributes = service.listAttribute(parentCategory);
		
		model.put("attributes", attributes);
		
		return model;
	}


	@GetMapping("list")
    public String listProducts(Model model) {
		/*
        List<ProductManage> products = ProductManageService.getAllProducts();  
        model.addAttribute("products", products);
        */
        return ".admin.product.list";
    }
}
