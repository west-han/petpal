package com.shop.petpal.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.admin.domain.CouponManage;
import com.shop.petpal.admin.domain.MemberCoupon;
import com.shop.petpal.admin.service.CouponManageService;
import com.shop.petpal.admin.service.ProductManageService;

@Controller
@RequestMapping("/admin/coupon/*")
public class CouponManageController {
	
	@Autowired
	private CouponManageService service;
	
	@Autowired
	private ProductManageService productservice;
	
	@GetMapping("list")
	public String listCoupon(Map<String, Object> map,Model model) {
		
			List<CouponManage> list = service.listCoupon(map);
			model.addAttribute("list",list);
		
		return ".admin.coupon.list";
	}
	
	@GetMapping("write")
	public String writeCoupon(Map<String, Object> map,Model model
			,@RequestParam(defaultValue = "1") int species
			) {
		
		List<Map<String, Object>> categories = productservice.listCategory(species);

		model.addAttribute("categories", categories);
		
		return ".admin.coupon.write";
	}
	
	
	@GetMapping("listCategory")
	@ResponseBody
	public Map<String, Object> listCategory(@RequestParam int species) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Map<String, Object>> categories = productservice.listCategory(species);
		
		model.put("categories", categories);
		
		return model;
	}
	
	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(@RequestParam int parentCategory) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Map<String, Object>> subCategories = productservice.listSubCategory(parentCategory);
		
		model.put("subCategories", subCategories);
		
		return model;
	}

	@PostMapping("insert")
	public String saveCoupon(CouponManage couponManage, 
                             @RequestParam("parentCategory") int parentCategory, 
                             @RequestParam("categoryNum") int categoryNum) {
		couponManage.setParentCategory(parentCategory);
		couponManage.setCategoryNum(categoryNum);
		try {
			service.insertCoupon(couponManage);			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return "redirect:/admin/coupon/list";
	}
  
	 @PostMapping("grant")
	    public String grantCoupon(@RequestParam("memberNum") long memberNum, 
	                              @RequestParam("couponNum") long couponNum) {
	        MemberCoupon memberCoupon = new MemberCoupon();
	        memberCoupon.setMemberNum(memberNum);
	        memberCoupon.setCouponNum(couponNum);
	        memberCoupon.setState(0); // 상태를 0으로 설정
	        try {
	        	service.grantCoupon(memberCoupon);				
			} catch (Exception e) {
				e.printStackTrace();
			}

	        return "redirect:/admin/coupon/list";
	    }

	    // 쿠폰 목록을 가져와서 JSP에 전달
	    @GetMapping("grant")
	    public String showGrantPage(Map<String, Object> map,Model model) {
	        List<CouponManage> coupons = service.listCoupon(map);	
			model.addAttribute("coupons", coupons);
			
	        return ".admin.coupon.grant";
	    }
	    
	    @GetMapping("checkMember")
	    @ResponseBody
	    public Map<String, Boolean> checkMember(@RequestParam("memberNum") long memberNum) {
	        boolean exists = false; // 변수 초기화

	        try {
	            exists = service.checkMemberExists(memberNum);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        Map<String, Boolean> response = new HashMap<>();
	        response.put("exists", exists);
	        return response;
	    }
	
	
}
