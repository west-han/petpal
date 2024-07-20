package com.shop.petpal;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.petpal.service.ProductListService;
import com.shop.petpal.domain.Product;

@Controller
public class HomeController {
    @Autowired
    private ProductListService productListService;
    
    @RequestMapping(value = {"/", "/{species}"}, method = RequestMethod.GET)
    public String home(@PathVariable(required = false) Integer species, Model model) {
        
        if (species == null) {
            species = 1;
        }
        
        // 카테고리 리스트 가져오기
        List<Map<String, Object>> categories = productListService.listCategory(species);
        
        // 신상품 4개 가져오기 위한 파라미터 설정
        Map<String, Object> recentParams = new HashMap<>();
        recentParams.put("species", species);
        recentParams.put("startNum", 1);
        recentParams.put("endNum", 4);
        
        // 신상품 리스트 가져오기
        List<Product> recentProducts = productListService.listRecentProducts(recentParams);

        // 베스트 상품 8개 가져오기 위한 파라미터 설정
        Map<String, Object> bestParams = new HashMap<>();
        bestParams.put("species", species);
        bestParams.put("startNum", 1);
        bestParams.put("endNum", 8);
        
        // 베스트 상품 리스트 가져오기
        List<Product> bestProducts = productListService.listBestProducts(bestParams);
        
        // 모델에 데이터 추가
        model.addAttribute("categories", categories);
        model.addAttribute("species", species);
        model.addAttribute("newList", recentProducts);
        model.addAttribute("bestList", bestProducts);
        
        return ".home"; // 뷰 이름 반환
    }
}
