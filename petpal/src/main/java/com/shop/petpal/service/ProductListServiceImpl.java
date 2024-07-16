package com.shop.petpal.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.common.DateUtil;
import com.shop.petpal.domain.Product;
import com.shop.petpal.mapper.ProductListMapper;

@Service
public class ProductListServiceImpl implements ProductListService {
	@Autowired
	private ProductListMapper mapper;
	
	@Autowired
	private DateUtil dateUtil;
	
	private final int pageSize = 30;
	private final int lookupDays = 90;
	
	@Override
	public List<Product> listRecentProducts(Map<String, Object> map) {
		List<Product> recentProducts = null;
		try {
			
			String today = String.format("%tF", Calendar.getInstance()).replaceAll("-", "");
			String baseDate = dateUtil.toDaysAgo(today, lookupDays);
			
			map.put("baseDate", baseDate);
			
			map.put("startNum", 1);
			map.put("endNum", 30);
			
			recentProducts = mapper.listRecentProducts(map);
			for (Product product : recentProducts) {
				product.setRegDate(product.getRegDate().substring(0, 10));
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return recentProducts;
	}

	@Override
	public List<Map<String, Object>> listCategory(Integer species) {
		List<Map<String, Object>> categories = null;
		try {
			categories = mapper.listCategory(species);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categories;
	}

}
