package com.shop.petpal.admin.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.petpal.admin.domain.OrderManage;
import com.shop.petpal.admin.service.OrderManageService;

/*
 * NOTE: 주문상세상태
      - 0:구매확정대기, 1:구매확정, 2:자동구매확정
      - 3:판매취소(관리자),
      - 4:주문취소요청(구매자), 5:주문취소완료(관리자),
      - 6:교환요청(구매자), 7:교환접수(관리자), 8:교환발송완료(관리자), 9:교환불가(관리자)
      - 10:반품요청(구매자), 11:반품접수(관리자), 12:반품완료(관리자), 13:반품불가(관리자)
      - 14:기타
 */

@Controller
@RequestMapping(value = "/admin/order/*")
public class OrderManageController {
	@Autowired
	private OrderManageService service;
	
	// NOTE: order - 주문 관리, delivery - 배송 관리
	@RequestMapping("{orderStatus}")
	public String status(
			@PathVariable String orderStatus,
			@RequestParam(defaultValue = "1") int state,
			@RequestParam(value = "page", defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "orderNum") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "30") int pageSize,
			Model model) throws Exception {
		// NOTE: 필요한 파라미터: 페이지 번호, 검색 대상, 검색어 
		// NOTE: 주문 상태: 0 - 전체, 1 - 결제완료,  2 - 발송처리 ~ 구매확정 3 - 판매취소/주문취소
		// NOTE: 페이징은 뷰단에서 처리
		switch (orderStatus) {
			case "delivery": state = 2; break;
			case "canceled": state = 3; break;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		int dataCount = service.countOrder(map);
		
		int offset = (currentPage - 1) * pageSize;
		if (offset < 0) {
			offset = 0;
		}
		
		map.put("offset", offset);
		map.put("size", pageSize);
		
		List<OrderManage> list = service.listOrder(map);
		List<Map<String, Object>> deliveryCompanyList = service.listDeliveryCompany();
		
		String query = "state=" + state;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		model.addAttribute("orderStatus", orderStatus);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("state", state);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("query", query);
		
		model.addAttribute("deliveryCompanyList", deliveryCompanyList);
		
		return ".admin.orderStatus.status";
	}
	
	
}