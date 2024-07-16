package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Product;

public interface ProductListService {
	public List<Map<String, Object>> listCategory(Integer species);
	public List<Product> listRecentProducts(Map<String, Object> map);
}