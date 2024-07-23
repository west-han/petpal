package com.shop.petpal.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Mypage2;
import com.shop.petpal.domain.Order;
import com.shop.petpal.mapper.MyPageMapper;
import com.shop.petpal.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderMapper mapper;
	
	@Autowired
	private MyPageMapper myPageMapper;
	
	private static AtomicLong count = new AtomicLong(0);
	
	@Override
	public String productOrderNumber() {
		String result = "";
		
		try {
			Calendar cal = Calendar.getInstance();
			String y =String.format("%04d", cal.get(Calendar.YEAR));
			String m = String.format("%02d", (cal.get(Calendar.MONTH) + 1));
			String d = String.format("%03d", cal.get(Calendar.DATE) * 7);
			
			String preNumber = y + m + d;
			String savedPreNumber = "0";
			long savedLastNumber = 0;
			String maxOrderNumber = mapper.findByMaxOrderNum();
			if(maxOrderNumber != null && maxOrderNumber.length() > 9) {
				savedPreNumber = maxOrderNumber.substring(0, 9);
				savedLastNumber = Long.parseLong(maxOrderNumber.substring(9));
			}
			
			long lastNumber = 1;
			if(! preNumber.equals(savedPreNumber)) {
				count.set(0);
				lastNumber = count.incrementAndGet();
			} else {
				lastNumber = count.incrementAndGet();
				
				if( savedLastNumber >= lastNumber )  {
					count.set(savedLastNumber);
					lastNumber = count.incrementAndGet();
				}
			}
			
			result = preNumber + String.format("%09d", lastNumber);
			
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public void insertOrder(Order dto) throws Exception {
		try {
			mapper.insertOrder(dto);
			mapper.insertPayDetail(dto);
			
			for(int i=0; i < dto.getProductNums().size(); i++) {
				dto.setProductNum(dto.getProductNums().get(i));
				dto.setAmount(dto.getBuyAmounts().get(i));
				if(dto.getDetailNums().get(i) != 0) {
					dto.setDetailNum(dto.getDetailNums().get(i));
				}
				if(dto.getDetailNums2().get(i) != 0) {
					dto.setDetailNum2(dto.getDetailNums2().get(i));
				}
				
				dto.setPricePay(dto.getPricePays().get(i));
				dto.setPriceOrig(dto.getPriceOrigs().get(i));
				dto.setPriceDiscount(dto.getPriceDiscounts().get(i));
				dto.setTotalPrice(dto.getTotalPrices().get(i));
				dto.setStockNum(dto.getStockNums().get(i));
				
				mapper.insertOrderDetail(dto);
				
				mapper.updateProductStock(dto);
			}
			
			if(dto.getUsedPoint() > 0) {
				LocalDateTime now = LocalDateTime.now();
				String dateTime = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
					
				Mypage2 point = new Mypage2();
				point.setMemberNum(dto.getMemberNum());
					
				point.setPoint(-dto.getUsedPoint());
				point.setClassify(2);
				point.setRegDate(dateTime);
					
				mapper.insertUserPoint(point);
			}
				
			mapper.insertOrderDelivery(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Order> listOrderProduct(List<Map<String, Long>> list) {
		List<Order> listOrderProduct = null;
		
		try {
			listOrderProduct = mapper.listOrderProduct(list);
			for(Order dto : listOrderProduct) {
				dto.setTotalPrice(dto.getPriceOrig() - dto.getDiscountAmount());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listOrderProduct;
	}

	@Override
	public List<Order> listOptionDetail(List<Long> detailNums) {
		List<Order> listOptionDetail = null;
		
		try {
			listOptionDetail = mapper.listOptionDetail(detailNums);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listOptionDetail;
	}

	@Override
	public Order findByOrderDetail(long orderDetailNum) {
		Order dto = null;
		
		try {
			 dto = mapper.findByOrderDetail(orderDetailNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Order findByProduct(long productNum) {
		Order dto = null;
		
		try {
			dto = mapper.findByProduct(productNum);
			
			if(dto != null) {
				dto.setTotalPrice(dto.getPriceOrig() - dto.getDiscountAmount());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Order findByOptionDetail(long detailNum) {
		Order dto = null;
		
		try {
			dto = mapper.findByOptionDetail(detailNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Mypage2 findByUserPoint(long memberNum) {
		Mypage2 dto = null;
		
		try {
			dto = mapper.findByUserPoint(memberNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			myPageMapper.deleteCart(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Mypage2> findByMemberDest(long memberNum) {
		List<Mypage2> list = null;
		
		try {
			list = mapper.findByMemberDest(memberNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
