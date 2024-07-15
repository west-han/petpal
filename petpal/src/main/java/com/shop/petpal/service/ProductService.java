package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Product;

public interface ProductService {
	public Product findById(long productNum);
	public List<Product> listProductFile(long productNum);
	
	public List<Product> listCategory();
	public List<Product> listSubCategory(long parentNum);
	
	public List<Product> listProductOption(long productNum);
	public List<Product> listOptionDetail(long productNum);
	public List<Product> listOptionDetailStock(Map<String, Object> map);
}
