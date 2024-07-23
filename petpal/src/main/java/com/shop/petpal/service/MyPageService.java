package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Order;

public interface MyPageService {
	public void insertCart(Order dto) throws Exception;
	public void updateCart(Order dto) throws Exception;
	public List<Order> listCart(Long memberNum);
	public void deleteCart(Map<String, Object> map) throws Exception;
}
