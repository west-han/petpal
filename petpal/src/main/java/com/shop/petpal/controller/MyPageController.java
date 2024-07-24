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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.domain.Order;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.MyPageService;

@Controller
@RequestMapping("/myPage/*")
public class MyPageController {
	@Autowired MyPageService service;
	
	@GetMapping("{species}/cart")
	public String cartList(@PathVariable(name = "species") Integer species,
			HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info != null) {
			List<Order> list = service.listCart(info.getMemberNum());
			
			int deliveryCharge = 0;
			int cartNsaledPrice = 0;
			int cartSaledTotal = 0;
			int cartTotalPrice = 0;
			int paymentPrice = 0;
			
			for(Order dto : list) {
				cartNsaledPrice += dto.getPriceOrig() * dto.getAmount();
				cartSaledTotal += dto.getDiscountAmount() * dto.getAmount();
				cartTotalPrice += dto.getPricePay();
				
				deliveryCharge = dto.getDeliveryCharge();
			}
			
			deliveryCharge = cartTotalPrice >= 20000 ? 0 : 3000;
			paymentPrice =  cartTotalPrice + deliveryCharge;
			
			model.addAttribute("cartNsaledPrice",cartNsaledPrice);
			model.addAttribute("cartSaledTotal",cartSaledTotal);
			model.addAttribute("cartTotalPrice",cartTotalPrice);
			model.addAttribute("deliveryCharge",deliveryCharge);
			model.addAttribute("paymentPrice",paymentPrice);
			model.addAttribute("list", list);
		} else {
			return "redirect:/member/login";
		}
		
		
		return ".myPage.cart";
	}
	
	@PostMapping("{species}/insertCart")
	public String insertCart(@PathVariable(name = "species") Integer species,
			Order dto, 
			HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			if(info != null) {
				dto.setMemberNum(info.getMemberNum());
				service.insertCart(dto);
			} else {
				return "redirect:/member/login";
			}
			
		} catch (Exception e) {
		}
		
		return "redirect:/myPage/{species}/cart";
	}
	
	@PostMapping("{species}/deleteSelectCart")
	public String deleteSelectCart(@PathVariable(name = "species") Integer species,
			@RequestParam List<Long> nums,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "list");
			map.put("memberNum", info.getMemberNum());
			map.put("list", nums);
			
			service.deleteCart(map);
			
		} catch (Exception e) {
		}
		
		return "redirect:/myPage/{species}/cart";
	}
	
	
	@GetMapping("{species}/deleteOne")
	public String deleteCartOne(@PathVariable(name = "species") Integer species,
			@RequestParam long stockNum,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "item");
			map.put("memberNum", info.getMemberNum());
			map.put("stockNum", stockNum);
			
			service.deleteCart(map);
		} catch (Exception e) {
		}
		
		
		return "redirect:/myPage/{species}/cart";
	}
	
	
	@PostMapping("{species}/updateCart")
	@ResponseBody
	public String updateCart(@PathVariable(name = "species") Integer species,
			@RequestParam("stockNum") long stockNum,
	        @RequestParam("amount") int amount,
	        HttpSession session) throws Exception {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			if (info != null) {
				Order dto = new Order();
				dto.setStockNum(stockNum);
				dto.setAmount(amount);
				
				dto.setMemberNum(info.getMemberNum());
				
				service.updateCart(dto);
				return "success";
			} else {
				return "redirect:/member/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/";
		}
	}
	
}

