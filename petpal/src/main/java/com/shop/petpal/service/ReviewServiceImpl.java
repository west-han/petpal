package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.Review;
import com.shop.petpal.domain.Summary;
import com.shop.petpal.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper mapper;
	
	
	@Override
	public List<Review> listReview2(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list = mapper.listReview2(map);
			
			
			for(Review dto : list) {
				if(dto.getReviewFileName() != null) {
					dto.setListReviewFileName(dto.getReviewFileName().split(","));
				}
				
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				if(dto.getAnswer() != null) {
					dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Summary findByReviewSummary(Map<String, Object> map) {
		Summary dto = null;
		
		try {
			dto = mapper.findByReviewSummary(map);
			
			dto.setScoreRate1((int)((double)dto.getScore1()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate2((int)((double)dto.getScore2()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate3((int)((double)dto.getScore3()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate4((int)((double)dto.getScore4()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate5((int)((double)dto.getScore5()/dto.getCount() * 100 + 0.5));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
