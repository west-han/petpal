package com.shop.petpal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.domain.Product;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductDetailController {
	@Autowired
	private ProductService service;
	
	@GetMapping("listOptionDetailStock")
	@ResponseBody
	public List<Product> listOptionDetailStock(@RequestParam Map<String, Object> paramMap) {
		List<Product> list = service.listOptionDetailStock(paramMap);
		
		return list;
	}
	
	@GetMapping("{species}/{product}")
	public String buyDetail(@PathVariable Integer species,
			@PathVariable String product,
			Model model, HttpSession session) throws Exception {
		
		try {
			if (species == null) {
				species = 1;
			}
			
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			
			long productNum = Long.parseLong(product);
			
			Product dto = service.findById(productNum);
			
			
			if(dto == null || dto.getShowSpecial() == 1) {
				return "redirect:/main/main";
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
			map.put("species", species);
			
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
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
		
		return ".product.buy";
	}
}
