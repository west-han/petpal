package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.Attribute;
import com.shop.petpal.admin.domain.ProductManage;
import com.shop.petpal.admin.domain.ProductStockManage;


public interface ProductManageService {
	public List<Map<String, Object>> listCategory(int species);
	public List<Map<String, Object>> listSubCategory(int parentCategory);
	public List<Attribute> listAttribute(int categoryNum);
	public int productCount(Map<String, Object> map);
	public List<ProductManage> listProduct(Map<String, Object> map);
	public void insertProduct(ProductManage productManage, String pathname) throws Exception;

	//재고
	public void updateProductStock(ProductStockManage dto) throws Exception;
	public List<ProductStockManage> listProductStock(Map<String, Object> map);
}
