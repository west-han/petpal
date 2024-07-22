package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.domain.OrderManage;
import com.shop.petpal.admin.mapper.OrderManageMapper;
import com.shop.petpal.common.OrderState;

@Service
public class OrderManageServiceImpl implements OrderManageService {
	
	@Autowired
	private OrderManageMapper mapper;
	
	@Override
	public int countOrder(Map<String, Object> params) {
		int count = 0;
		try {
			count = mapper.countOrder(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<OrderManage> listOrder(Map<String, Object> params) {
		List<OrderManage> list = null;
		try {
			list = mapper.listOrder(params);
			
			for (OrderManage orderManage : list) {
				orderManage.setOrderStateInfo(
						OrderState.ORDERSTATEINFO[orderManage.getOrderState()]);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> listDeliveryCompany() {
		List<Map<String, Object>> list = null;
		try {
			list = mapper.listDeliveryCompany();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
