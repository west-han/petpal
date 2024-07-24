package com.shop.petpal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop.petpal.common.MyUtil;
import com.shop.petpal.service.ReviewService;


public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
}
