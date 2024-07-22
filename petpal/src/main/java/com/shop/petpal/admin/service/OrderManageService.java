package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.OrderManage;

public interface OrderManageService {
	public int countOrder(Map<String, Object> params);
	public List<OrderManage> listOrder(Map<String, Object> params);
	public List<Map<String, Object>> listDeliveryCompany();
}
