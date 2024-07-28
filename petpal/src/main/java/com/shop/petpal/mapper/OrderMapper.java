package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.Mypage;
import com.shop.petpal.domain.Order;

@Mapper
public interface OrderMapper {
	public String findByMaxOrderNum();
	public void insertOrder(Order dto) throws SQLException;
	public void insertOrderDetail(Order dto) throws SQLException;
	public void insertPayDetail(Order dto) throws SQLException;
	public void insertOrderDelivery(Order dto) throws SQLException;
	public void insertUserPoint(Mypage dto) throws SQLException;
	
	public void updateProductStock(Order dto) throws SQLException;
	public List<Order> listOrderProduct(List<Map<String, Long>> list);
	public List<Order> listOptionDetail(List<Long> detailNums);
	public Order findByOrderDetail(long orderDetailNum);
	public Order findByProduct(long productNum);
	public Order findByOptionDetail(long detailNum);
	public Mypage findByUserPoint(long memberNum);
	public List<Mypage> findByMemberDest(long memberNum);
}
