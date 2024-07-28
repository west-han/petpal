package com.shop.petpal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.petpal.common.FileManager;
import com.shop.petpal.domain.Onetoone;
import com.shop.petpal.mapper.OnetooneMapper;

@Service
public class OnetooneServiceImpl implements OnetooneService {
	@Autowired
	private OnetooneMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertQna(Onetoone dto, String pathname) throws Exception {
		try {
			long seq = mapper.qnaSeq();
			dto.setNum(seq);
			mapper.insertQna(dto);
			
			if(!dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					
					dto.setQnaFileName(saveFilename);
					
					insertQnaFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteQna(long num, String pathname) throws Exception {
		try {
			List<Onetoone> listFile = listFileList(num);
			if(listFile != null) {
				for(Onetoone dto : listFile) {
					fileManager.doFileDelete(dto.getQnaFileName(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteQnaFile(map);
			
			mapper.deleteQna(num);
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
	public List<Onetoone> listQna(Map<String, Object> map) {
		List<Onetoone> list = null;
		
		try {
			list = mapper.listQna(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Onetoone findById(long num) {
		Onetoone dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertQnaFile(Onetoone dto) throws Exception {
		try {
			mapper.insertQnaFile(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Onetoone> listFileList(long num) {
		List<Onetoone> listFile = null;
		
		try {
			listFile = mapper.listQnaFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	
	@Override
	public void deleteQnaFile(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteQnaFile(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
}
