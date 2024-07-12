package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.ProductManage;


public interface ProductManageService {
	public void insertProduct(ProductManage dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<ProductManage> listProduct(Map<String, Object> map);
	
	public ProductManage findById(long productNum);
	public ProductManage findByPrev(Map<String, Object> map);
	public ProductManage findByNext(Map<String, Object> map);
	
	public List<ProductManage> listProductFile(long productNum);
	public List<ProductManage> listProductOption(long productNum);
	public List<ProductManage> listOptionDetail(long optionNum);
	
	// 상품 상위 카테고리 목록
	public ProductManage findByCategory(long categoryNum);
	public List<ProductManage> listCategory();
	public List<ProductManage> listSubCategory(long parentNum);
}
