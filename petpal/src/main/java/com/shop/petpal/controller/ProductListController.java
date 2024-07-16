package com.shop.petpal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.petpal.domain.Product;
import com.shop.petpal.service.ProductListService;

@Controller
@RequestMapping("/products/*")
public class ProductListController {
	@Autowired
	private ProductListService service;
	
	@GetMapping(value = {"recent/{species}/{categoryNum}", "recent", "recent/{species}"})
	public String listRecentProducts(
			@PathVariable(required = false) Integer species,
			@PathVariable(required = false) Integer categoryNum,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model) {

		if (species == null) {
			species = 1;
		}
		
		if (categoryNum == null) {
			categoryNum = 0;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNum", categoryNum);
		map.put("species", species);
		map.put("currentPage", currentPage);
		
		try {
			List<Map<String, Object>> categories = service.listCategory(species);
			List<Product> recentProducts = service.listRecentProducts(map);
			
			model.addAttribute("species", species);
			model.addAttribute("categories", categories);
			model.addAttribute("products", recentProducts);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("mode", "recent");
		
		return ".product.main-without-filter";
	}
	
	@GetMapping("best/{species}")
	public String listBestProducts(
			@PathVariable(required = false) Integer species,
			@RequestParam(defaultValue = "all") String category,
			Model model) {

		return "product/main-without-filter";
	}
	
	@GetMapping("category/{species}/{categoryNum}")
	public String listCategorizedProducts(
			@PathVariable(required = false) Integer species,
			@PathVariable(required = false) Integer categoryNum) {
		
		if (species == null) {
			species = 1;
		}
		
		if (categoryNum == null) {
			categoryNum = 0;
		}
		
		
		
		return "product/main-with-filter";
	}
	
	
}
