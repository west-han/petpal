package com.shop.petpal.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.petpal.admin.domain.EventManage;
import com.shop.petpal.admin.mapper.EventManageMapper;
import com.shop.petpal.common.FileManager;

@Service
public class EventManageServiceImpl implements EventManageService{
    @Autowired
    private EventManageMapper mapper;
    @Autowired
    private FileManager fileManager;

    @Override
    public void insertEvent(EventManage dto, String pathname) throws Exception {
        try {
        	long seq = mapper.eventSeq();
			dto.setNum(seq);
			
            dto.setStartDate(dto.getSday() + " " + dto.getStime());
            dto.setEndDate(dto.getEday() + " " + dto.getEtime());
            
            String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);
            
            mapper.insertEvent(dto);
            // 파일 업로드
	 			if (! dto.getSelectEventFile().isEmpty()) {
	 				for (MultipartFile mf : dto.getSelectEventFile()) {
	 					String eventFileName = fileManager.doFileUpload(mf, pathname);
	 					if (eventFileName == null) {
	 						continue;
	 					}
	
	 					dto.setEventFileName(eventFileName);
	
	 					mapper.insertEventFile(dto);
	 				}
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }


    @Override
    public void updateEvent(EventManage dto, String pathname) throws Exception {
        try {
            dto.setStartDate(dto.getSday() + " " + dto.getStime() + ":00");
            dto.setEndDate(dto.getEday() + " " + dto.getEtime() + ":00");
            mapper.updateEvent(dto);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    public List<EventManage> listEventFile(long num){
    	List<EventManage> listFile = null;
    	
    	try {
			listFile = mapper.listEventFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return listFile;
    }
    
    //글 자체를 삭제할 때 (파일도 같이 날라감)
    @Override
    public void deleteEvent(long num, String pathname) throws Exception {
        try {
		// 파일 지우기
			List<EventManage> listFile = listEventFile(num);
			if (listFile != null) {
				for (EventManage dto : listFile) {
					fileManager.doFileDelete(dto.getEventFileName(), pathname);
				}
			}

			// 파일 테이블 내용 지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			mapper.deleteEventFile(map);

			// 게시글 지우기
			mapper.deleteEvent(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
        }
    }

    //수정화면에서 파일 1개 삭제할때 사용할곳
    @Override
    public void deleteFile(long fileNum, String pathname) throws Exception {
        try {
            EventManage dto = mapper.findEventFileByNum(fileNum);
            if (dto != null && dto.getEventFileName() != null) {
                fileManager.doFileDelete(dto.getEventFileName(), pathname);
            }

            Map<String, Object> map = new HashMap<String, Object>();
            
            map.put("field", "eventFileNum");
            map.put("num", fileNum);
            
            mapper.deleteEventFile(map);
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
    public List<EventManage> listEvent(Map<String, Object> map) {
        List<EventManage> list = null;
        
        try {
            list = mapper.listEvent(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }

    @Override
    public EventManage findByNum(long num) {
        EventManage dto = null;
        
        try {
            dto = mapper.findEventByNum(num);
            
            if (dto != null) {
                dto.setStartDate(dto.getStartDate().substring(0, 10));
                dto.setEndDate(dto.getEndDate().substring(0, 10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return dto;
    }

    @Override
    public EventManage findByPrev(Map<String, Object> map) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public EventManage findByNext(Map<String, Object> map) {
        // TODO Auto-generated method stub
        return null;
    }
}
