package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Product;
import com.shop.petpal.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;
	
	@Override
	public Product findById(long productNum) {
		Product dto = null;
		
		try {
			dto = mapper.findById(productNum);
			
			if(dto != null) {
				dto.setTotalPrice(dto.getPrice() - dto.getDiscountAmount());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Product> listProductFile(long productNum) {
		List<Product> list = null;
		
		try {
			list = mapper.listProductFile(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Product> listCategory() {
		List<Product> list = null;
		
		try {
			list = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Product> listSubCategory(long parentNum) {
		List<Product> list = null;
		
		try {
			list = mapper.listSubCategory(parentNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Product> listProductOption(long productNum) {
		List<Product> list = null;
		
		try {
			list = mapper.listProductOption(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Product> listOptionDetail(long optionNum) {
		List<Product> list = null;
		
		try {
			list = mapper.listOptionDetail(optionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Product> listOptionDetailStock(Map<String, Object> map) {
		List<Product> list = null;
		
		try {
			list = mapper.listOptionDetailStock(map);
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
