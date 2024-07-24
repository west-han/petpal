package com.shop.petpal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shop.petpal.common.MyUtil;
import com.shop.petpal.domain.Review;
import com.shop.petpal.domain.Summary;
import com.shop.petpal.service.ReviewService;

@RestController
@RequestMapping("/productReview/*")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("list")
	public Map<String, Object> list(@RequestParam long productNum,
			@RequestParam(defaultValue = "0") int sortNo,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page
			) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("productNum", productNum);
			Summary summary = service.findByReviewSummary(map);
			
			if(summary == null) {
				return model;
			}
			
			dataCount = summary.getCount();
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			map.put("sortNo", sortNo);
			map.put("offset", offset);
			map.put("size", size);


			List<Review> list = service.listReview(map);
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listReview");
			
			model.put("list", list);
			model.put("summary", summary);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
		} catch (Exception e) {
		}
		
		return model;
	}
}