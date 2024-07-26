package com.shop.petpal.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.shop.petpal.domain.Product;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@GetMapping(value = {"recent", "recent/{species}", "recent/{species}/{categoryNum}"})
	public String listRecentProducts(
			@PathVariable(name="species", required = false) Integer species,
			@PathVariable(name="categoryNum", required = false) Integer categoryNum,
			@RequestParam(name="currentPage", defaultValue = "1") int currentPage,
			HttpSession session,
			Model model) {

		if (species == null) {
			species = 1;
			session.setAttribute("species", species);
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
			@PathVariable(name="species", required = false) Integer species,
			@PathVariable(name="categoryNum", required = false) Integer categoryNum,
			@RequestParam(name="page", defaultValue = "1") int currentPage,
			HttpSession session,
			Model model) {

		if (species == null) {
			species = 1;
			session.setAttribute("species", species);
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
			@PathVariable(name="species", required = false) Integer species,
			@PathVariable(name="parentCategory", required = false) Integer parentCategory,
			@PathVariable(name="categoryNum", required = false) Integer categoryNum,
			@RequestParam(value = "page", defaultValue = "1") int currentPage,
			@RequestParam(value = "pageSize", defaultValue = "30") int pageSize,
			@RequestParam Map<String, Object> params,
			HttpSession session,
			Model model) {
		// NOTE: 파라미터 - sortBy(price, sales, ...) / order(asc, desc), 
		// NOTE: 파라미터 - 필터 조건 / 여러개의 필터는 ,로 구분
		// TODO: 쿼리 만들어서 넘겨주기
		
		if (species == null) {
			species = 1;
			session.setAttribute("species", species);
		}
		
		if (parentCategory == null) {
			parentCategory = 0;
		}

		if (categoryNum == null) {
			categoryNum = 0;
		}
		
		try {
			int offset = (currentPage - 1) * pageSize;
			if (offset < 0) {
				offset = 0;
			}

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
	public String search(
		@PathVariable(name="species", required = false) Integer species,
		@PathVariable(name="parentCategory", required = false) Integer parentCategory,
		@PathVariable(name="categoryNum", required = false) Integer categoryNum,
		@RequestParam(value = "page", defaultValue = "1") int currentPage,
		@RequestParam(value = "pageSize", defaultValue = "30") int pageSize,
		@RequestParam Map<String, Object> params,
		HttpSession session,
		Model model) {
	
	if (species == null) {
		species = 1;
		session.setAttribute("species", species);
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
	public String listSearchResult(
			@PathVariable(name="species", required = false) Integer species,
			@PathVariable(name="parentCategory", required = false) Integer parentCategory,
			@PathVariable(name="categoryNum", required = false) Integer categoryNum,
			@RequestParam(value = "page", defaultValue = "1") int currentPage,
			@RequestParam(value = "pageSize", defaultValue = "30") int pageSize,
			@RequestParam Map<String, Object> params,
			HttpSession session,
			Model model) {
		
		if (species == null) {
			species = 1;
			session.setAttribute("species", species);
		}
				
		if (parentCategory == null) {
			parentCategory = 0;
		}

		if (categoryNum == null) {
			categoryNum = 0;
		}
		
		int offset = (currentPage - 1) * pageSize;
		if (offset < 0) {
			offset = 0;
		}
		
		try {
			params.put("offset", offset);
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
			sb.append("minPrice=" + params.get("minPrice"));
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
			sb.append("&");
		}
		
		if (params.get("kwd") != null) {
			sb.append("kwd=" + params.get("kwd"));
		}
		
		if (sb.lastIndexOf("&") == sb.length() - 1) {
			sb.deleteCharAt(sb.length() - 1);
		}

		return sb.toString();
	}
	
	
	// ---------------- 상품 상세 페이지 ------------------
	@GetMapping("{species}/listOptionDetailStock")
	@ResponseBody
	public List<Product> listOptionDetailStock(@PathVariable(name = "species") Integer species,
			@RequestParam(name = "paramMap") Map<String, Object> paramMap) {
		List<Product> list = service.listOptionDetailStock(paramMap);
		
		return list;
	}
	
	@GetMapping("{species}/{product}")
	public String buyDetail(@PathVariable(name = "species") Integer species,
			@PathVariable(name = "product") String product,
			Model model, HttpSession session) throws Exception {
		
		try {
			List<Map<String, Object>> categories = service.listCategory(species);
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			long productNum = Long.parseLong(product);
			
			Product dto = service.findById(productNum);
			
			if(dto == null || dto.getShowSpecial() == 1) {
				return "redirect:/";
			}	
			
			int membershipNum = 1;
	        if (info != null) {
	            membershipNum = info.getMembershipNum();
	        }

	        dto.setMembershipNum(membershipNum);
			 
			
			if(membershipNum  == 1) {
				dto.setSavePoint((int)(dto.getTotalPrice() * 0.01));
			} else if(membershipNum  == 2) {
				dto.setSavePoint((int)(dto.getTotalPrice() * 0.02));
			} else if(membershipNum  == 3) {
				dto.setSavePoint((int)(dto.getTotalPrice() * 0.03));
			} else {
				dto.setSavePoint((int)(dto.getTotalPrice() * 0.04));
			}
			
			List<Product> listProductFile = service.listProductFile(productNum);
			
			List<Product> listProductOption = service.listProductOption(productNum);
			
			List<Product> listOptionDetail = null;
			if(listProductOption.size() > 0) {
				listOptionDetail = service.listOptionDetail(listProductOption.get(0).getOptionNum());
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			List<Product> listStock = null;
			if(dto.getOptionCount() < 2) {
				map.put("productNum", dto.getProductNum());
				listStock = service.listOptionDetailStock(map);
				
				if(dto.getOptionCount() == 0 && listStock.size() > 0) {
					dto.setStockNum(listStock.get(0).getStockNum());
					dto.setTotalStock(listStock.get(0).getTotalStock());
					
				} else if(dto.getOptionCount() > 0) {
					for(Product vo : listOptionDetail) {
						for(Product ps : listStock) {
							if(vo.getDetailNum() == ps.getDetailNum()) {
								vo.setStockNum(ps.getStockNum());
								vo.setTotalStock(ps.getTotalStock());
								break;
							}
						}
					}
				}
			}
			
			dto.setFileName(dto.getThumbnail());
			listProductFile.add(0, dto);
			
			model.addAttribute("dto", dto);
			model.addAttribute("listProductFile", listProductFile);
			model.addAttribute("listProductOption", listProductOption);
			model.addAttribute("listOptionDetail", listOptionDetail);
			model.addAttribute("categories", categories);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
		
		return ".product.buy";
	}
}
