package com.shop.petpal.admin.controller;


import java.io.File;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.admin.domain.Attribute;
import com.shop.petpal.admin.domain.ProductManage;
import com.shop.petpal.admin.domain.ProductStockManage;
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
    public String listProducts(
    		@RequestParam(defaultValue = "1") int species,
    		@RequestParam(defaultValue = "0") int parentCategory,
    		@RequestParam(defaultValue = "0") int categoryNum,
    		HttpServletRequest req,
			Model model) {
		
        List<Map<String, Object>> categories = service.listCategory(species);  
        model.addAttribute("categories", categories);
        
        //int classify = menuItem.orElse(100);
		
		String cp = req.getContextPath();
		
		int size = 10;
		//int total_page;
		int dataCount;
        
		if (req.getMethod().equalsIgnoreCase("GET")) {
	//		kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("species", species);
		map.put("parentCategory", parentCategory);
		map.put("categoryNum", categoryNum);
        
		dataCount = service.productCount(map);
//		total_page = myUtil.pageCount(dataCount, size);
		/*
		if(current_page > total_page) {
			current_page = total_page;
		}
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		*/
		
		List<ProductManage> list = service.listProduct(map);
		model.addAttribute("species",species);
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		
		

		model.addAttribute("parentCategory", parentCategory);
		
        return ".admin.product.list";
    }
	
	 @GetMapping("listProduct")
	    public String listProduct(@RequestParam Map<String, Object> paramMap, Model model) throws Exception {
	        List<ProductManage> list = service.listProduct(paramMap);
	        model.addAttribute("list", list);
	        return "admin/product/listProduct";
	    }
	
	// AJAX-Text
		@GetMapping("listProductStock")
		public String listProductStock(@RequestParam Map<String, Object> paramMap, Model model) throws Exception {
			// 상세 옵션별 재고 -----
			try {
				List<ProductStockManage> list = service.listProductStock(paramMap); // productNum, optionCount
				
				if(list.size() >= 1) {
					String productName = list.get(0).getProductName();
					String title = list.get(0).getOptionName();
					String title2 = list.get(0).getOptionName2();
					
					model.addAttribute("productNum", paramMap.get("productNum"));
					model.addAttribute("productName", productName);
					model.addAttribute("title", title);
					model.addAttribute("title2", title2);
				}
				
				model.addAttribute("list", list);
			} catch (Exception e) {
			}
			
			return "admin/product/listProductStock";
		}
		
		@PostMapping("updateProductStock")
		@ResponseBody
		public Map<String, Object> updateProductStock(ProductStockManage dto) throws Exception {
			// 상세 옵션별 재고 추가 또는 변경 -----
			String state = "true";
			try {
				service.updateProductStock(dto);
			} catch (Exception e) {
				state = "false";
			}
			
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			return model;
		}
}
