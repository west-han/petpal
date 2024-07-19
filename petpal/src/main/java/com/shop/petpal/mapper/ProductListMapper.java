package com.shop.petpal.mapper;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Product;

public interface ProductListMapper {
	// NOTE: 필요한 페이지 - 신상품 목록, 베스트상품 목록, 카테고리별 상품 목록,
	// 		 이벤트 페이지, 특가 상품, 타임 세일 상품, 맞춤 상품
	
	
	// -- 필터 없는 화면 --
	// NOTE: 신상품 목록 - 동물 종류에 따른 카테고리 리스트, 카테고리에 해당하는 상품 리스트
	public List<Map<String, Object>> listCategory(Integer species);
	public List<Map<String, Object>> listSubCategory(Map<String, Object> map);
	public List<Map<String, Object>> listAttribute(Map<String, Object> map);
	
	public List<Product> listRecentProducts(Map<String, Object> map); // NOTE: species, categoryNum
	public List<Product> listBestProducts(Map<String, Object> map);
	public List<Product> listCategorizedProducts(Map<String, Object> map);
	public int countCategorizedProducts(Map<String, Object> map);
}
