package com.shop.petpal.admin.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.domain.OrderDetailManage;
import com.shop.petpal.admin.domain.OrderManage;
import com.shop.petpal.admin.mapper.OrderManageMapper;
import com.shop.petpal.common.OrderState;
import com.shop.petpal.domain.UserPoint;

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

	@Override
	public OrderManage findById(String orderNum) {
		OrderManage manage = null;
		
		try {
			manage = mapper.findById(orderNum);
			if (manage != null) {
				manage.setOrderStateInfo(OrderState.ORDERSTATEINFO[manage.getOrderState()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return manage;
	}
	
	@Override
	public List<OrderDetailManage> orderDetails(String orderNum) {
		List<OrderDetailManage> list = null;
		
		try {
			list = mapper.findByOrderDetails(orderNum);
			for (OrderDetailManage manage : list) {
				manage.setDetailStateInfo(OrderState.DETAILSTATEMANAGER[manage.getDetailState()]);
				int optionCount = 0;
				if (manage.getDetailNum() != null) {
					optionCount++;	
				}
				if (manage.getDetailNum2() != null) {
					optionCount++;
				}
				manage.setOptionCount(optionCount);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int orderDetailCount(Map<String, Object> map) {
		int count = 0;
		
		try {
			count = mapper.countOrderDetail(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<OrderDetailManage> listOrderDetail(Map<String, Object> map) {
		List<OrderDetailManage> list = null;
		
		try {
			list = mapper.listOrderDetail(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateOrder(String mode, Map<String, Object> map) throws Exception {
		try {
			if (mode.equals("state")) {
				mapper.updateOrderState(map);
			} else if (mode.equals("invoiceNumber")) {
				mapper.updateOrderInvoiceNumber(map);
			} else if (mode.equals("delivery")) {
				mapper.updateOrderState(map);
			} else if (mode.equals("cancelAmount")) {
				mapper.updateCancelAmount(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateOrderDetailState(Map<String, Object> map) throws Exception {
		try {
			String orderNum = (String)map.get("orderNum");
			int detailState = Integer.parseInt((String)map.get("detailState"));
			int priceOrig = Integer.parseInt((String)map.get("priceOrig"));
			int payment = Integer.parseInt((String)map.get("payment"));
			
			int cancelAmount = 0;
			if (detailState == 3 || detailState == 5 || detailState == 12) {
				cancelAmount = Integer.parseInt((String)map.get("cancelAmount"));
			}
			
			mapper.updateOrderDetailState(map);
			
			mapper.insertDetailStateInfo(map);
			
			if (detailState == 3 || detailState == 5 || detailState == 12) {
				cancelAmount += priceOrig;
				int amount = cancelAmount;
				if (cancelAmount > payment) {
					amount = payment;
				}
				
				map.put("cancelAmount", amount);
				
				mapper.updateCancelAmount(map);
				
				int totalOrderCount = mapper.countTotalOrder(orderNum);
				if (totalOrderCount == 0) {
					map.put("orderState", 6);
					mapper.updateOrderState(map);
				}
				
				mapper.updateProductStockInc(map);
				
				// TODO: 카드 취소내역 저장
				
				Long memberNum = Long.parseLong((String)map.get("memberNum"));
				int usedCoupon = Integer.parseInt((String)map.get("usedCoupon"));
				int usedPoint = Integer.parseInt((String)map.get("usedPoint"));
				String orderDate = (String)map.get("orderDate");
				
				/*
				 * NOTE: 주문 취소 시 포인트 환급 시스템 미구현
				 * if (memberNum != null) { if (totalOrderCount == 0) { UserPoint up = new
				 * UserPoint(); up.setMemberNum(memberNum); up.setPoint(usedPoint);
				 * up.setClassify(4); up.setRegDate(orderDate); up.setMemo("구매취소");
				 * mapper.insertUserPoint(up); } else { int diff = cancelAmount - payment; if
				 * (diff > 0) { UserPoint up = new UserPoint(); up.setMemberNum(memberNum);
				 * up.setPoint(diff); up.setClassify(4); up.setRegDate(orderDate);
				 * up.setMemo("구매취소에 따른 남은 포인트"); mapper.insertUserPoint(up); } } }
				 */
			} else if (detailState == 2) {
				Long memberNum = Long.parseLong((String)map.get("memberNum"));
				String orderDate = (String)map.get("orderDate");
				if (memberNum != null) {
					int savePoint = Integer.parseInt((String)map.get("savePoint"));
					
					UserPoint up = new UserPoint();
					up.setMemberNum(memberNum);
					up.setPoint(savePoint);
					up.setClassify(1);
					up.setRegDate(orderDate);
					up.setMemo("자동 구매확정");
					mapper.insertUserPoint(up);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum) {
		List<Map<String, Object>> list = null;
		try {
			list = mapper.listDetailStateInfo(orderDetailNum);
			
			String detailStateInfo;
			
			for (Map<String, Object> map : list) {
				int detailState = ((BigDecimal) map.get("DETAILSTATE")).intValue();
				detailStateInfo = OrderState.DETAILSTATEMANAGER[detailState];
				map.put("DETAILSTATEINFO", detailStateInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
