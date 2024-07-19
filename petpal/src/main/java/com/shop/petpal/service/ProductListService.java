package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Product;

public interface ProductListService {
	public List<Map<String, Object>> listCategory(Integer species);
	public List<Map<String, Object>> listSubCategory(Map<String, Object> map);
	public List<Map<String, Object>> listAttribute(Map<String, Object> map);
	
	public List<Product> listRecentProducts(Map<String, Object> map);
	public List<Product> listBestProducts(Map<String, Object> map);
	public List<Product> listCategorizedProducts(Map<String, Object> params);
	
	public int countCategorizedProducts(Map<String, Object> params);
}