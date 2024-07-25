package com.shop.petpal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.Review;
import com.shop.petpal.domain.Summary;

@Mapper
public interface ReviewMapper {
	public List<Review> listReview(Map<String, Object> map);
	public Summary findByReviewSummary(Map<String, Object> map);
}
