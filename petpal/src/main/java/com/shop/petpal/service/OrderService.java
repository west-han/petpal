package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Mypage;
import com.shop.petpal.domain.Order;

public interface OrderService {
	public String productOrderNumber();
	public void insertOrder(Order dto) throws Exception;
	
	public List<Order> listOrderProduct(List<Map<String, Long>> list);
	public List<Order> listOptionDetail(List<Long> detailNums);
	public Order findByOrderDetail(long orderDetailNum);
	public Order findByProduct(long productNum);
	public Order findByOptionDetail(long detailNum);
	
	public Mypage findByUserPoint(long memberNum);
	public List<Mypage> findByMemberDest(long memberNum);
	
	public void deleteCart(Map<String, Object> map) throws Exception;
}
