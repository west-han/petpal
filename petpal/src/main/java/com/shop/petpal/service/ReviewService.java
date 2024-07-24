package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Review;
import com.shop.petpal.domain.Summary;

public interface ReviewService {
	public List<Review> listReview2(Map<String, Object> map);
	public Summary findByReviewSummary(Map<String, Object> map);
}
