package com.shop.petpal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Order;
import com.shop.petpal.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	@Override
	public void insertCart(Order dto) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNum", dto.getMemberNum());
		
		try {
			for(int i = 0; i < dto.getStockNums().size(); i++) {
				dto.setProductNum(dto.getProductNums().get(i));
				dto.setStockNum(dto.getStockNums().get(i));
				dto.setAmount(dto.getBuyAmounts().get(i));
				
				map.put("stockNum", dto.getStockNums().get(i));
				if(mapper.findByCartId(map) == null) {
					mapper.insertCart(dto);
				} else {
					mapper.updateCart(dto);
				}
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Order> listCart(Long memberNum) {
		List<Order> list = null;
		
		try {
			list = mapper.listCart(memberNum);
			
			for(Order dto : list) {
				dto.setPriceDiscount((dto.getPriceOrig() - dto.getDiscountAmount())); // 할인전체금액
				dto.setPricePay(dto.getPriceDiscount() * dto.getAmount()); // 해당 상품의 전체 가격
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteCart(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateCart(Order dto) throws Exception {
		try {
			mapper.updateCart(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	
}
