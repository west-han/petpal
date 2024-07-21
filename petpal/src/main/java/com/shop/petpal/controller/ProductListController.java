package com.shop.petpal.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		map.put("startNum", 1);
		map.put("endNum", 50);
		
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
		
		map.put("startNum", 1);
		map.put("endNum", 50);
		
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
			@RequestParam(value = "page", defaultValue = "1") int currentPage,
			@RequestParam(value = "pageSize", defaultValue = "30") int pageSize,
			@RequestParam Map<String, Object> params,
			Model model) {
		// NOTE: 파라미터 - sortBy(price, sales, ...) / order(asc, desc), 
		// NOTE: 파라미터 - 필터 조건 / 여러개의 필터는 ,로 구분
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
		
		try {
			int offset = (currentPage - 1) * pageSize;

			params.put("offset", offset);
			params.put("pageSize", pageSize);
			params.put("species", species);
			params.put("parentCategory", parentCategory);
			params.put("categoryNum", categoryNum);

			if (params.get("attributes") != null) {
				List<String> attrDtlNums = List.of(((String)params.get("attributes")).split(","));
				params.replace("attributes", attrDtlNums);
			}
			
			if (params.get("kwd") != null) {
				params.replace("kwd", ((String)params.get("kwd")).replaceAll(" ", ""));
			}

			List<Map<String, Object>> categories = service.listCategory(species);
			List<Map<String, Object>> subCategories = service.listSubCategory(params);
			List<Map<String, Object>> attributes = service.listAttribute(params);
			
			int dataCount = service.countCategorizedProducts(params);
			List<Product> products = service.listCategorizedProducts(params);
			
			model.addAttribute("attributes", attributes);
			model.addAttribute("categories", categories);
			model.addAttribute("subCategories", subCategories);
			model.addAttribute("species", species);
			model.addAttribute("parentCategory", parentCategory);
			model.addAttribute("categoryNum", categoryNum);
			model.addAttribute("products", products);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("currentPage", currentPage);
			
			model.addAttribute("mode", "category");
			
			String query = generateQueryString(params);
			
			model.addAttribute("query", query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".product.main-with-filter";
	}
	
	@PostMapping(value = {"search", "search/{species}", "search/{species}/{parentCategory}",
	"search/{species}/{parentCategory}/{categoryNum}"})
	private String search(
		@PathVariable(required = false) Integer species,
		@PathVariable(required = false) Integer parentCategory,
		@PathVariable(required = false) Integer categoryNum,
		@RequestParam(value = "page", defaultValue = "1") int currentPage,
		@RequestParam(value = "pageSize", defaultValue = "30") int pageSize,
		@RequestParam Map<String, Object> params,
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
		params.put("offset", 0);
		params.put("pageSize", pageSize);
		params.put("species", species);
		params.put("parentCategory", parentCategory);
		params.put("categoryNum", categoryNum);
	
		if (params.get("kwd") != null) {
			params.replace("kwd", ((String)params.get("kwd")).replaceAll(" ", ""));
		}
	
		List<Map<String, Object>> categories = service.listCategory(species);
		List<Map<String, Object>> subCategories = service.listSubCategory(params);
		List<Map<String, Object>> attributes = service.listAttribute(params);
		
		int dataCount = service.countCategorizedProducts(params);
		List<Product> products = service.listCategorizedProducts(params);
		
		model.addAttribute("attributes", attributes);
		model.addAttribute("categories", categories);
		model.addAttribute("subCategories", subCategories);
		model.addAttribute("species", species);
		model.addAttribute("parentCategory", parentCategory);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("products", products);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("currentPage", 1);
		model.addAttribute("mode", "search");
		
		String query = generateQueryString(params);
		
		model.addAttribute("query", query);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return ".product.main-with-filter";
	}
	
	@GetMapping(value = {"search", "search/{species}", "search/{species}/{parentCategory}",
			"search/{species}/{parentCategory}/{categoryNum}"})
	private String listSearchResult(
			@PathVariable(required = false) Integer species,
			@PathVariable(required = false) Integer parentCategory,
			@PathVariable(required = false) Integer categoryNum,
			@RequestParam(value = "page", defaultValue = "1") int currentPage,
			@RequestParam(value = "pageSize", defaultValue = "30") int pageSize,
			@RequestParam Map<String, Object> params,
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
			params.put("offset", 0);
			params.put("pageSize", pageSize);
			params.put("species", species);
			params.put("parentCategory", parentCategory);
			params.put("categoryNum", categoryNum);

			String kwd = null;
			
			if (params.get("kwd") != null) {
				kwd = (String)params.get("kwd");
				kwd = URLDecoder.decode(kwd, "utf-8");
				params.replace("kwd", kwd.replaceAll(" ", ""));
			}

			List<Map<String, Object>> categories = service.listCategory(species);
			List<Map<String, Object>> subCategories = service.listSubCategory(params);
			List<Map<String, Object>> attributes = service.listAttribute(params);
			
			int dataCount = service.countCategorizedProducts(params);
			List<Product> products = service.listCategorizedProducts(params);
			
			model.addAttribute("attributes", attributes);
			model.addAttribute("categories", categories);
			model.addAttribute("subCategories", subCategories);
			model.addAttribute("species", species);
			model.addAttribute("parentCategory", parentCategory);
			model.addAttribute("categoryNum", categoryNum);
			model.addAttribute("products", products);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("mode", "search");
			
			String query = generateQueryString(params);
			
			model.addAttribute("query", query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".product.main-with-filter";
	}
	
	private String generateQueryString(Map<String, Object> params) {
		StringBuilder sb = new StringBuilder();
		sb.append("?");
		
		if (params.get("minRating") != null) {
			sb.append("minRating=" + params.get("minRating"));
			sb.append("&");
		}
		
		if (params.get("minPrice") != null) {
			sb.append("minPrice=" + params.get("minRating"));
			sb.append("&");
		}
		
		if (params.get("maxPrice") != null) {
			sb.append("maxPrice=" + params.get("maxPrice"));
			sb.append("&");
		}
		
		if (params.get("sortBy") != null) {
			sb.append("sortBy=" + params.get("sortBy"));
			sb.append("&");
		}
		
		if (params.get("order") != null) {
			sb.append("order=" + params.get("order"));
		}
		
		if (params.get("kwd") != null) {
			sb.append("kwd=" + params.get("kwd"));
		}

		return sb.toString();
	}
}
