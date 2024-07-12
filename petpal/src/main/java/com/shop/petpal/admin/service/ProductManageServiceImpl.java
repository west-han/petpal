package com.shop.petpal.admin.service;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.admin.domain.ProductManage;
import com.shop.petpal.common.FileManager;

@Service
public class ProductManageServiceImpl implements ProductManageService {
//	@Autowired
//	private ProductManageMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertProduct(ProductManage dto, String pathname) throws Exception {
//		try {
//			// 썸네일 이미지
//			String imageName = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
//			dto.setThumbnail(imageName);
//			
//			// 상품 저장
//			long productNum = mapper.productSeq();
//			
//			dto.setProductNum(productNum);
//			mapper.insertProduct(dto);
//			
//			// 추가 이미지 저장
//			if(! dto.getAddFiles().isEmpty()) {
//				for(MultipartFile mf : dto.getAddFiles()) {
//					imageName = fileManager.doFileUpload(mf, pathname);
//					if(imageName == null) {
//						continue;
//					}
//					dto.setImageName(imageName);
//					
//					mapper.insertProductFile(dto);
//				}
//			}
//			
//			// 옵션추가
//			if(dto.getOptionCount() > 0) {
////				insertProductOption(dto);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw e;
//		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductManage> listProduct(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductManage findById(long productNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductManage findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductManage findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductManage> listProductFile(long productNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductManage> listProductOption(long productNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductManage> listOptionDetail(long optionNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductManage findByCategory(long categoryNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductManage> listCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductManage> listSubCategory(long parentNum) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
