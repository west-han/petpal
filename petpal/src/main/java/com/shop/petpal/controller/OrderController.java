package com.shop.petpal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage2;
import com.shop.petpal.domain.Order;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.MemberService;
import com.shop.petpal.service.OrderService;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("payment")
	public String paymentForm(@RequestParam List<Long> productNums,
			@RequestParam List<Long> stockNums,
			@RequestParam List<Integer> buyAmounts,
			@RequestParam(defaultValue = "buy") String mode,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			if(info != null) {
				Member orderUser = memberService.findById(info.getMemberNum());
				
				String productOrderNumber = null;
				String productOrderName = "";
				int totalMoney = 0;
				int deliveryCharge = 0;
				int totalPayment = 0;
				int totalSavePoint = 0;
				int totalDiscountPrice = 0;
				
				productOrderNumber = orderService.productOrderNumber();
				
				List<Map<String, Long>> list = new ArrayList<Map<String,Long>>();
				for(int i = 0; i < stockNums.size(); i++) {
					Map<String, Long> map = new HashMap<String, Long>();
					map.put("stockNum", stockNums.get(i));
					map.put("productNum", productNums.get(i));
					list.add(map);
				}
				
				
				
				
				Order order = new Order();
				order.setTotalSavePoint(totalSavePoint);
				
				List<Order> listProduct = orderService.listOrderProduct(list);
				
				for(int i = 0; i < listProduct.size(); i++) {
					Order dto = listProduct.get(i);
					dto.setAmount(buyAmounts.get(i));
					dto.setPricePay(buyAmounts.get(i) * dto.getTotalPrice()); 
					
					if(info.getMembershipNum() == 1) {
						totalSavePoint += (int)(buyAmounts.get(i) * 0.01);
						dto.setSavePoint(buyAmounts.get(i) * dto.getSavePoint());
					} else if(info.getMembershipNum() == 2) {
						totalSavePoint += (int)(buyAmounts.get(i) * 0.02);
						dto.setSavePoint(buyAmounts.get(i) * dto.getSavePoint());
					} else if(info.getMembershipNum() == 3) {
						totalSavePoint += (int)(buyAmounts.get(i) * 0.03);
						dto.setSavePoint(buyAmounts.get(i) * dto.getSavePoint());
					} else {
						totalSavePoint += (int)(buyAmounts.get(i) * 0.04);
						dto.setSavePoint(buyAmounts.get(i) * dto.getSavePoint());
					}
					
					totalMoney += buyAmounts.get(i) * dto.getTotalPrice(); // totalPrice : 할인된 상품가격 * 개수 
					totalDiscountPrice += dto.getDiscountAmount();
					if(i == 0 || deliveryCharge > dto.getDeliveryCharge()) {
						deliveryCharge = dto.getDeliveryCharge();
					}
				}
				
				productOrderName = listProduct.get(0).getProductName();
				if(listProduct.size() > 1) {
					productOrderName += " 외 " + (listProduct.size() - 1) + "건";
				}
				
				deliveryCharge = totalMoney >= 20000 ? 0 : deliveryCharge;
				
				totalPayment = totalMoney + deliveryCharge;
				
				if (totalSavePoint == 0) {
	                System.out.println("totalSavePoint is zero. Possible calculation error.");
	            } else {
	                System.out.println("totalSavePoint: " + totalSavePoint);
	            }
				
				
				
				Mypage2 userPoint = orderService.findByUserPoint(info.getMemberNum());
				List<Mypage2> memberDest = orderService.findByMemberDest(info.getMemberNum());
				
				model.addAttribute("productOrderNumber", productOrderNumber);
				model.addAttribute("orderUser", orderUser);
				model.addAttribute("productOrderName", productOrderName);
				
				model.addAttribute("listProduct", listProduct);
				model.addAttribute("totalMoney", totalMoney);
				model.addAttribute("totalPayment", totalPayment);
				model.addAttribute("totalSavePoint", totalSavePoint);
				model.addAttribute("totalDiscountPrice", totalDiscountPrice);
				model.addAttribute("userPoint", userPoint);
				model.addAttribute("memberDest", memberDest);
				model.addAttribute("deliveryCharge", deliveryCharge);
				model.addAttribute("mode", mode);
				
			} else {
				return "redirect:/member/login";
			}
			
			return ".order.payment";
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/";
	}
	
	
	
	@PostMapping("paymentOk")
	public String paymentSubmit(@RequestParam(defaultValue = "buy") String mode,
				Order dto, 
				HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberNum(info.getMemberNum());
			dto.setEmail(info.getEmail());
			
			
			orderService.insertOrder(dto);
			
			if(mode.equals("cart")) {
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("gubun", "list");
				map.put("memberNum", info.getMemberNum());
				map.put("list", dto.getStockNums());
				
				orderService.deleteCart(map);
				
			}
			
			return "redirect:/order/done";
			
		} catch (Exception e) {
		}
		
		
		return "redirect:/";
	}
	
	@GetMapping("done")
	public String done(@ModelAttribute("title") String title, 
			@ModelAttribute("message") String message
			) throws Exception {
		if (message == null || message.length() == 0) { 
			return "redirect:/";
		}
		
		return ".order.done";
	}

}
