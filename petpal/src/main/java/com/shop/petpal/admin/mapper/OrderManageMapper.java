package com.shop.petpal.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.OrderDetailManage;
import com.shop.petpal.admin.domain.OrderManage;
import com.shop.petpal.domain.UserPoint;

public interface OrderManageMapper {
	// NOTE: 필요한 쿼리: 주문 개수 조회, 주문 목록 조회, 주문 상태 변경, 주문 상세정보 조회
	public int countOrder(Map<String, Object> map);
	public List<OrderManage> listOrder(Map<String, Object> map);
	
	public OrderManage findById(String orderNum);
	public List<OrderDetailManage> findByOrderDetails(String orderNum);
	public int countOrderDetail(Map<String, Object> map);
	
	public List<OrderDetailManage> listOrderDetail(Map<String, Object> map);
	
	public void updateProductStockInc(Map<String, Object> map) throws SQLException;
	
	public void updateOrderState(Map<String, Object> map) throws SQLException;
	public int findByTotalCancelAmount(String orderNum);
	public int countTotalOrder(String orderNum);

	public void updateCancelAmount(Map<String, Object> map) throws SQLException;
	public void updateOrderInvoiceNumber(Map<String, Object> map) throws SQLException;
	public void updateOrderDetailState(Map<String, Object> map) throws SQLException;
	
	public List<Map<String, Object>> listDeliveryCompany();
	public void insertDetailStateInfo(Map<String, Object> map) throws SQLException;
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum);
	
	public void updateAutoPurchaseconfirmation() throws SQLException;
	public void insertUserPoint(UserPoint userPoint) throws SQLException;
}
