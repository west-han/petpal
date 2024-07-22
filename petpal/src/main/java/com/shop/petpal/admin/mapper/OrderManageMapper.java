package com.shop.petpal.admin.mapper;

import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.OrderManage;

public interface OrderManageMapper {
	// NOTE: 필요한 쿼리: 주문 개수 조회, 주문 목록 조회, 주문 상태 변경, 주문 상세정보 조회
	public int countOrder(Map<String, Object> map);
	public List<OrderManage> listOrder(Map<String, Object> map);
	
	public List<Map<String, Object>> listDeliveryCompany();
}
