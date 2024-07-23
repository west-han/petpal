package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.Order;

@Mapper
public interface MyPageMapper {
	public void insertCart(Order dto) throws SQLException;
	public void updateCart(Order dto) throws SQLException;
	public Order findByCartId(Map<String, Object> map);
	public List<Order> listCart(Long memberNum);
	public void deleteCart(Map<String, Object> map) throws SQLException;
}
