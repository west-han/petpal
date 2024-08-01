package com.shop.petpal.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shop.petpal.admin.domain.Attribute;
import com.shop.petpal.admin.domain.ProductManage;
import com.shop.petpal.admin.domain.ProductStockManage;

@Mapper
public interface ProductManageMapper {
	/*
	 NOTE: 필요한 쿼리
		1. 상품 등록
		- 동물 종류에 따른 상위 카테고리 불러오기, 상위 카테고리에 딸린 하위 카테고리 불러오기,
		- 상위 카테고리에 딸린 속성 및 속성에 딸린 속성값 불러오기, 상품 등록,
		- 상품 이미지 등록, 상품 옵션 등록, 상품 옵션값 등록, 상품 속성 등록
		
		-- 시퀀스 번호 받기 위한 메소드들
		- 상품 등록, 상품 이미지 등록, 상품 옵션 등록, 상품 속성 등록 시 상품번호(시퀀스) 필요
		- 하위옵션 및 상품 옵션값 등록 시 옵션 번호(시퀀스) 필요
		- 상품 속성 등록 시 속성 상세번호 필요
	*/
	public List<ProductManage> listProduct(Map<String, Object> map);
	public List<Map<String, Object>> listCategory(int species);
	public List<Map<String, Object>> listSubCategory(int parentCategory);
	public List<Attribute> listAttribute(int categoryNum);
	public int productCount(Map<String, Object> map);
	public long productSeq();
	public long optionSeq();
	public long attrDtlSeq();
	
	public void insertProduct(ProductManage dto) throws SQLException;
	public void insertProductImage(ProductManage dto) throws SQLException;
	public void insertProductOption(ProductManage dto) throws SQLException;
	public void insertProductOptionDetail(ProductManage dto) throws SQLException;
	public void insertProductAttribute(
			@Param("productNum") Long productNum,
			@Param("attrDtlNum") Long attrDtlNum) throws SQLException;


	public void insertProductStock(ProductStockManage dto) throws SQLException;
	public void updateProductStock(ProductStockManage dto) throws SQLException;
	public List<ProductStockManage> listProductStock(Map<String, Object> map);
	
	public int optionCount(Map<String, Object> map);
}

