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
	
	@GetMapping(value = {"recent", "recent/{species}", "recent/{species}/{categoryNum}"})
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
	
	@GetMapping(value = {"best", "best/{species}", "best/{species}/{categoryNum}"})
	public String listBestProducts(
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
			List<Product> bestProducts = service.listBestProducts(map);
			
			model.addAttribute("species", species);
			model.addAttribute("categories", categories);
			model.addAttribute("products", bestProducts);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("mode", "best");
		
		return ".product.main-without-filter";
	}
	
	@GetMapping(value = {"category", "category/{species}", "category/{species}/{parentCategory}",
			"category/{species}/{parentCategory}/{categoryNum}"})
	public String listCategorizedProducts(
			@PathVariable(required = false) Integer species,
			@PathVariable(required = false) Integer parentCategory,
			@PathVariable(required = false) Integer categoryNum,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model) {
		
		if (species == null) {
			species = 1;
		}
		
		if (parentCategory == null) {
			parentCategory = 0;
		}

		if (categoryNum == null) {
			categoryNum = 0;
		}
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("species", species);
			map.put("parentCategory", parentCategory);
			map.put("categoryNum", categoryNum);

			System.out.println("parentCategory: " + parentCategory + "\ncategoryNum: " + categoryNum);
			
			List<Map<String, Object>> categories = service.listCategory(species);
			List<Map<String, Object>> subCategories = service.listSubCategory(map);
			
			for (Map<String, Object> map2 : subCategories) {
				System.out.println("subcategory: " + map2.get("categoryNum") + "\tparentCategory: " + map2.get("parentCategory"));
			}
			
			model.addAttribute("categories", categories);
			model.addAttribute("subCategories", subCategories);
			model.addAttribute("species", species);
			model.addAttribute("parentCategory", parentCategory);
			model.addAttribute("categoryNum", categoryNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(species);
		
		return ".product.main-with-filter";
	}
	
	
}
