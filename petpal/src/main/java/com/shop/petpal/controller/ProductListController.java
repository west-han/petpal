package com.shop.petpal.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
			@RequestParam Map<String, String> params,
			Model model) {
		// NOTE: 파라미터 - sortBy(price, sales, ...), order(asc, desc), 
		// NOTE: 파라미터 - 필터 조건, 여러개의 필터는 ,로 구분
		// TODO: 쿼리 만들어서 넘겨주기
		
		if (species == null) {
			species = 1;
		}
		
		if (parentCategory == null) {
			parentCategory = 0;
		}

		if (categoryNum == null) {
			categoryNum = 0;
		}

		// TODO: 테스트 코드 삭제
		Iterator<String> it = params.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			System.out.println(key + ": " + params.get(key));
		}
		
		// TODO: 파라미터 decoding
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("species", species);
			map.put("parentCategory", parentCategory);
			map.put("categoryNum", categoryNum);

			List<Map<String, Object>> categories = service.listCategory(species);
			List<Map<String, Object>> subCategories = service.listSubCategory(map);
			List<Map<String, Object>> attributes = service.listAttribute(map);
			
			List<Product> products = service.listCategorizedProducts(map);
			
			model.addAttribute("attributes", attributes);
			model.addAttribute("categories", categories);
			model.addAttribute("subCategories", subCategories);
			model.addAttribute("species", species);
			model.addAttribute("parentCategory", parentCategory);
			model.addAttribute("categoryNum", categoryNum);
			model.addAttribute("products", products);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(species);
		
		return ".product.main-with-filter";
	}
	
	@RequestMapping(value = {"search", "search/{species}", "search/{species}/{parentCategory}",
	"search/{species}/{parentCategory}/{categoryNum}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String search(
		@PathVariable(required = false) Integer species,
		@PathVariable(required = false) Integer parentCategory,
		@PathVariable(required = false) Integer categoryNum,
		@RequestParam(defaultValue = "1") int currentPage,
		Model model) {
		
		return "";
	}
	
}
