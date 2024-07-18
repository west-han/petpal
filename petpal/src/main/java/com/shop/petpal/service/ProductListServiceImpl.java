package com.shop.petpal.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
	
	// TODO: 페이징 구현
	
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
	
	@Override
	public List<Map<String, Object>> listSubCategory(Map<String, Object> map) {
		List<Map<String, Object>> subCategories = null;
		
		try {
			subCategories = mapper.listSubCategory(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return subCategories;
	}
	
	@Override
	public List<Map<String, Object>> listAttribute(Map<String, Object> map) {
		List<Map<String, Object>> attributes = null;
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		/*
		 // TODO: 아래 형식으로 재구성
		 [
			 {
			 	attributeNum: attributeNum,
			 	attributeName: attributeName,
			 	attrDtls: 
			 		[
			 			{attrDtlNum: attrDtlNum, attrDtlName: attDtlName},
			 			{...},
			 			...
			 		]
			 },
			 {
			 	... 
			 }
		 ]
		 */
		
		try {
			// HACK: Attribute DTO 클래스를 사용하거나 속성과 속성값을 따로 가져오도록 변경
			
			attributes = mapper.listAttribute(map);
			
			// NOTE: 속성 번호, 이름 중복 제거하고 추출
			List<String> attrs = attributes.stream()
				.map(item -> ((BigDecimal)item.get("ATTRIBUTENUM")).toString() 
						+ "/" + item.get("ATTRIBUTENAME"))
				.distinct()
				.collect(Collectors.toList());
			
			// NOTE: 속성, 속성값 데이터 재구성
			for (String attr : attrs) {
				String num = attr.split("/")[0];
				String name = attr.split("/")[1];
				
				Map<String, Object> innerMap = new HashMap<String, Object>();
				
				List<Map<String, Object>> attrDtls = attributes.stream()
					.filter(item -> ((BigDecimal)item.get("ATTRIBUTENUM")).toString().equals(num))
					.map(item -> {
						Map<String, Object> attrDtl = new HashMap<>();
						
						attrDtl.put("attrDtlNum", item.get("ATTRDTLNUM"));
						attrDtl.put("attrDtlName", item.get("ATTRDTLNAME"));
						
						return attrDtl;
					})
					.collect(Collectors.toList());
				
				innerMap.put("attributeNum", num);
				innerMap.put("attributeName", name);
				innerMap.put("attrDtls", attrDtls);
				
				result.add(innerMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Product> listBestProducts(Map<String, Object> map) {
		List<Product> bestProducts = null;
		
		try {
			map.put("startNum", 1);
			map.put("endNum", 30);
			
			bestProducts = mapper.listBestProducts(map);
			
			for (Product product : bestProducts) {
				product.setRegDate(product.getRegDate().substring(0, 10));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bestProducts;
	}

	@Override
	public List<Product> listCategorizedProducts(Map<String, Object> map) {
		List<Product> products = null;
		
		try {
			
			products = mapper.listCategorizedProducts(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
}
