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
import com.shop.petpal.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;

    @Autowired
    private DateUtil dateUtil;

    private final int lookupDays = 90;

	// ------------- 상품 상세페이지 ----------------
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

	// ------------- 상품 목록 ----------------
    @Override
    public List<Product> listRecentProducts(Map<String, Object> map) {
        List<Product> recentProducts = null;
        try {
            // NOTE: 오늘 날짜와 기준 날짜 설정
            String today = String.format("%tF", Calendar.getInstance()).replaceAll("-", "");
            String baseDate = dateUtil.toDaysAgo(today, lookupDays);
            map.put("baseDate", baseDate);
            
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
        List<Map<String, Object>> result = new ArrayList<>();
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
            // TODO: Attribute DTO 클래스를 사용하거나 속성과 속성값을 따로 가져오도록 변경
            attributes = mapper.listAttribute(map);
            // NOTE: 속성 번호, 이름 중복 제거하고 추출
            List<String> attrs = attributes.stream()
                .map(item -> ((BigDecimal)item.get("ATTRIBUTENUM")).toString() + "/" + item.get("ATTRIBUTENAME"))
                .distinct()
                .collect(Collectors.toList());
            // NOTE: 속성, 속성값 데이터 재구성
            for (String attr : attrs) {
                String num = attr.split("/")[0];
                String name = attr.split("/")[1];
                Map<String, Object> innerMap = new HashMap<>();
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
            // 베스트 상품 리스트 가져오기
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
    public List<Product> listCategorizedProducts(Map<String, Object> params) {
        List<Product> products = null;
        try {
            products = mapper.listCategorizedProducts(params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
    
    @Override
    public int countCategorizedProducts(Map<String, Object> params) {
        int dataCount = 0;
        try {
            dataCount = mapper.countCategorizedProducts(params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataCount;
    }

	@Override
	public void insertLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public boolean userProductLiked(Map<String, Object> map) {
		boolean result = false;
		
		try {
			Product dto = mapper.userProductLiked(map);
			if(dto != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
