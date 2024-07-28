package com.shop.petpal.service;

import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Onetoone;

public interface OnetooneService {
	public void insertQna(Onetoone dto, String pathname) throws Exception;
	public void deleteQna(long num, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Onetoone> listQna(Map<String, Object> map);
	
	public Onetoone findById(long num);
	
	public void insertQnaFile(Onetoone dto) throws Exception;
	public List<Onetoone> listFileList(long num);
	public void deleteQnaFile(Map<String, Object> map) throws Exception;
}
