package com.shop.petpal.admin.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.admin.domain.Attribute;


public interface ProductManageService {
	public List<Map<String, Object>> listCategory(int species);
	public List<Map<String, Object>> listSubCategory(int parentCategory);
	public List<Attribute> listAttribute(int categoryNum);
}
