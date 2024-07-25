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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage2;
import com.shop.petpal.domain.Order;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.MemberService;
import com.shop.petpal.service.OrderService;
import com.shop.petpal.service.ProductService;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
    private ProductService productService;
	
	@RequestMapping("{species}/payment")
	public String paymentForm(@PathVariable(name = "species") Integer species,
			@RequestParam List<Long> productNums,
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
					
					double savePointMultiplier;
				    if (info.getMembershipNum() == 1) {
				        savePointMultiplier = 0.01;
				    } else if (info.getMembershipNum() == 2) {
				        savePointMultiplier = 0.02;
				    } else if (info.getMembershipNum() == 3) {
				        savePointMultiplier = 0.03;
				    } else {
				        savePointMultiplier = 0.04;
				    }
				    
				    int calculatedSavePoint = (int)(buyAmounts.get(i) * dto.getTotalPrice() * savePointMultiplier);
				    dto.setSavePoint(calculatedSavePoint);
				    totalSavePoint += calculatedSavePoint; 
				    
				    System.out.println("Product " + i + ": Amount = " + buyAmounts.get(i) + 
		                       ", TotalPrice = " + dto.getTotalPrice() + 
		                       ", SavePointMultiplier = " + savePointMultiplier + 
		                       ", savePoint = " + calculatedSavePoint);
				    
					totalMoney += buyAmounts.get(i) * dto.getTotalPrice(); // totalPrice : 할인된 상품가격 * 개수 
					totalDiscountPrice += dto.getDiscountAmount();
					
					dto.setPriceDiscount(buyAmounts.get(i) * dto.getDiscountAmount());
					
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
				
				
				Mypage2 userPoint = orderService.findByUserPoint(info.getMemberNum());
				List<Mypage2> memberDest = orderService.findByMemberDest(info.getMemberNum());
				
				List<Map<String, Object>> categories = productService.listCategory(species);
				
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
				model.addAttribute("categories", categories);
				
			} else {
				return "redirect:/member/login";
			}
			
			return ".order.payment";
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	
	
	@PostMapping("{species}/paymentOk")
	public String paymentSubmit(@PathVariable(name = "species") Integer species,
			@RequestParam(defaultValue = "buy") String mode,
				Order dto, RedirectAttributes reAttr,
				HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberNum(info.getMemberNum());
			dto.setEmail(info.getEmail());
			dto.setDestMemo(dto.getNote());
			
			orderService.insertOrder(dto);
			
			if(mode.equals("cart")) {
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("gubun", "list");
				map.put("memberNum", info.getMemberNum());
				map.put("list", dto.getStockNums());
				
				orderService.deleteCart(map);
				
			}
			
			reAttr.addFlashAttribute("title", "상품 결제 완료");
			reAttr.addFlashAttribute("message", "정상처리");
			
			return "redirect:/order/{species}/done";
			
		} catch (Exception e) {
		}
		
		
		return "redirect:/";
	}
	
	@GetMapping("{species}/done")
	public String done(@PathVariable(name = "species") Integer species,
			@ModelAttribute("title") String title, 
			@ModelAttribute("message") String message,
			Model model) throws Exception {
		if (message == null || message.length() == 0) { 
			return "redirect:/";
		}
		
		List<Map<String, Object>> categories = productService.listCategory(species);
		model.addAttribute("categories", categories);
		
		
		return ".order.done";
	}

}
