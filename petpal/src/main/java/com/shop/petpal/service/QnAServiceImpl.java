package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.petpal.domain.QnA;
import com.shop.petpal.mapper.QnAMapper;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnAMapper mapper;
	
	@Override
	public void insertQnA(QnA dto) throws Exception {
		try {
			mapper.insertQnA(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<QnA> listQnA(Map<String, Object> map) {
		List<QnA> list = null;
		
		
		try {
			list = mapper.listQnA(map);
			
			for(QnA dto : list) {
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
	
}
