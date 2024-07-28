package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.Onetoone;

@Mapper
public interface OnetooneMapper {
	public long qnaSeq(); 
	public void insertQna(Onetoone dto) throws SQLException;
	public void deleteQna(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Onetoone> listQna(Map<String, Object> map);
	
	public Onetoone findById(long num);
	
	public void insertQnaFile(Onetoone dto) throws SQLException;
	public List<Onetoone> listQnaFile(long num);
	public void deleteQnaFile(Map<String, Object> map) throws SQLException;
}
