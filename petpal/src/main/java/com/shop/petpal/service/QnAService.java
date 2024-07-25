package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.QnA;

public interface QnAService {
	public void insertQnA(QnA dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<QnA> listQnA(Map<String, Object> map);
}
