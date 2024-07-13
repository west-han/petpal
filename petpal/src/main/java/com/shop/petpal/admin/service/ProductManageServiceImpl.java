package com.shop.petpal.admin.service;



import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.domain.Attribute;
import com.shop.petpal.admin.mapper.ProductManageMapper;

@Service
public class ProductManageServiceImpl implements ProductManageService {
	@Autowired
	private ProductManageMapper mapper;

	@Override
	public List<Map<String, Object>> listCategory(int species) {
		List<Map<String, Object>> categories = null;
		
		try {
			categories = mapper.listCategory(species);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return categories;
	}

	@Override
	public List<Map<String, Object>> listSubCategory(int parentCategory) {
		List<Map<String, Object>> subCategories = null;
		
		try {
			subCategories = mapper.listSubCategory(parentCategory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return subCategories;
	}

	@Override
	public List<Attribute> listAttribute(int categoryNum) {
		List<Attribute> attributes = null;
		
		try {
			attributes = mapper.listAttribute(categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return attributes;
	}
}
