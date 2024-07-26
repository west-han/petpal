package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.Product;

@Mapper
public interface ProductMapper {
	public Product findById(long productNum);
	public List<Product> listProductFile(long productNum);
	public List<Product> listProductOption(long productNum);
	public List<Product> listOptionDetail(long productNum);
	public List<Product> listOptionDetailStock(Map<String, Object> map);
	public void insertLike(Map<String, Object> map) throws SQLException;
	public void deleteLike(Map<String, Object> map) throws SQLException;
	public Product userProductLiked(Map<String, Object> map);

	// --------------- 상품 목록 ----------------
	// NOTE: 필요한 페이지 - 신상품 목록, 베스트상품 목록, 카테고리별 상품 목록(+검색결과),
	// 		 이벤트 페이지, 특가 상품, 타임 세일 상품, 맞춤 상품
	public List<Map<String, Object>> listCategory(Integer species);
	public List<Map<String, Object>> listSubCategory(Map<String, Object> map);
	public List<Map<String, Object>> listAttribute(Map<String, Object> map);
	
	// -- 필터 없는 화면: 출력할 상품 개수 50개로 고정 --
	public List<Product> listRecentProducts(Map<String, Object> map); // NOTE: species, categoryNum
	public List<Product> listBestProducts(Map<String, Object> map);

	// -- 필터 있는 화면 --
	public List<Product> listCategorizedProducts(Map<String, Object> map);
	public int countCategorizedProducts(Map<String, Object> map);
}
