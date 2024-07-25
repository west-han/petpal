package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.QnA;

@Mapper
public interface QnAMapper {
	public void insertQnA(QnA dto) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<QnA> listQnA(Map<String, Object> map);
	
}
