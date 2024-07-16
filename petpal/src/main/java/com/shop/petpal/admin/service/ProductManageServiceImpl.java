package com.shop.petpal.admin.service;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.petpal.admin.domain.Attribute;
import com.shop.petpal.admin.domain.ProductManage;
import com.shop.petpal.admin.domain.ProductStockManage;
import com.shop.petpal.admin.mapper.ProductManageMapper;
import com.shop.petpal.common.FileManager;

@Service
public class ProductManageServiceImpl implements ProductManageService {
	@Autowired
	private ProductManageMapper mapper;
	@Autowired
	private FileManager fileManager;

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

	@Override
	public void insertProduct(ProductManage productManage, String pathname) throws Exception {
		// NOTE: 수행해야 할 INSERT 작업 목록 - 상품 테이블에 상품 정보, 상품 속성 테이블에 상품에 대한 속성,
		//									옵션 테이블에 옵션 정보, 옵션 상세 테이블에 옵션값,
		//									상품 이미지 테이블에 상품 상세 이미지들
		try {
			String filename = fileManager.doFileUpload(productManage.getThumbnailFile(), pathname);
			productManage.setThumbnail(filename);
			
			long productNum = mapper.productSeq();
			
			productManage.setProductNum(productNum);
			mapper.insertProduct(productManage);
			
			List<MultipartFile> files = productManage.getAddFiles();
			
			if (files != null && ! files.isEmpty()) {
				for (MultipartFile file : files) {
					if ((filename = fileManager.doFileUpload(file, pathname)) == null) {
						continue;
					}
					
					productManage.setFilename(filename);
					
					mapper.insertProductImage(productManage);
				}
			}

			if (productManage.getOptionCount() > 0) {
				insertProductOption(productManage);
			}

			if (productManage.getAttrDtlNums() == null) {
				return;
			}
			
			for (Long attrDtlNum : productManage.getAttrDtlNums()) {
				if (attrDtlNum != null) {
					mapper.insertProductAttribute(productNum, attrDtlNum);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	private void insertProductOption(ProductManage productManage) throws Exception {
		try {
			int optionCount = productManage.getOptionCount();
			long optionNum = 0;
			long optionNum2 = 0;
			
			if (optionCount > 0) {
				optionNum = mapper.optionSeq();
				productManage.setOptionNum(optionNum);
				productManage.setParentOption(null);
				
				System.out.println("optionNum: " + optionNum);
				mapper.insertProductOption(productManage);
				
				for (String optionValue : productManage.getOptionValues()) {
					productManage.setOptionValue(optionValue);
					mapper.insertProductOptionDetail(productManage);
				}
			}
			
			if (optionCount > 1) {
				optionNum2 = mapper.optionSeq();
				System.out.println("optionNum2: " + optionNum2);
				productManage.setOptionNum(optionNum2);
				productManage.setParentOption(optionNum);
				mapper.insertProductOption(productManage);
				
				for (String optionValue : productManage.getOptionValues2()) {
					productManage.setOptionValue(optionValue);
					mapper.insertProductOptionDetail(productManage);
				}
			}
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int productCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.productCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ProductManage> listProduct(Map<String, Object> map) {
		 List<ProductManage> list = null;
		 
		 try {
			list = mapper.listProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		return list;
	}

	@Override
	public List<ProductStockManage> listProductStock(Map<String, Object> map) {
		List<ProductStockManage> list = null;
		
		try {
			// 상세 옵션별 재고 현황 -----
			list = mapper.listProductStock(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateProductStock(ProductStockManage dto) throws Exception{
		try {
			// 상세 옵션별 재고 추가 또는 변경 -----
			for(int idx = 0; idx < dto.getStockNums().size(); idx++) {
				dto.setStockNum(dto.getStockNums().get(idx));
				if(dto.getDetailNums() != null && dto.getDetailNums().get(idx) != 0) {
					dto.setDetailNum1(dto.getDetailNums().get(idx));
				}
				if(dto.getDetailNums2() != null && dto.getDetailNums2().get(idx) != 0) {
					dto.setDetailNum2(dto.getDetailNums2().get(idx));
				}
				dto.setTotalStock(dto.getTotalStocks().get(idx));
				
				if(dto.getStockNum() == 0) {
					mapper.insertProductStock(dto);
				} else {
					mapper.updateProductStock(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
