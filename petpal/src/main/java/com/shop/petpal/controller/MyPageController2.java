package com.shop.petpal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage2/*")
public class MyPageController2 {
	
	@GetMapping("orderlist")
	public String orderlistForm() throws Exception {
		
		return ".myPage2.orderlist";
	}
	@GetMapping("cancel-return-change")
	public String ancelreturnchangeForm() throws Exception {
		
		return ".myPage2.cancel-return-change";
	}
	@GetMapping("mycoupon")
	public String mycouponForm() throws Exception {
		
		return ".myPage2.mycoupon";
	}
	@GetMapping("mypoint")
	public String mypointFrom() throws Exception {
		
		return ".myPage2.mypoint";
	}
	
	
	@GetMapping("mypet")
	public String mypetFrom() throws Exception {
		
		return ".myPage2.mypet";
	}
	@GetMapping("mymodify")
	public String mymodifyFrom() throws Exception {
		
		return ".myPage2.mymodify";
	}
	@GetMapping("likelist")
	public String likelistFrom() throws Exception {
		
		return ".myPage2.likelist";
	}
	
	
	@GetMapping("myreview")
	public String myreviewForm() throws Exception {
		
		return ".myPage2.myreview";
	}
	
	
	
	
	
	
}
