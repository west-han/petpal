package com.shop.petpal.admin.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.admin.domain.EventManage;
import com.shop.petpal.admin.service.EventManageService;
import com.shop.petpal.common.MyUtil;
import com.shop.petpal.domain.SessionInfo;

@Controller
public class EventManageController {
    @Autowired
    private EventManageService service;
    
    @Autowired
    @Qualifier("myUtilGeneral")
    private MyUtil myUtil;
    
    @GetMapping("/admin/event/list")
    public String event(
            @RequestParam(value = "page", defaultValue = "1") int current_page,
            @RequestParam(defaultValue = "email" ,name = "schType") String schType,
            @RequestParam(defaultValue = "" ,name = "kwd") String kwd,
            HttpServletRequest req, Model model) throws Exception {

        int size = 10;
        int total_page = 0;
        int dataCount = 0;

        if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
            kwd = URLDecoder.decode(kwd, "utf-8");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("schType", schType);
        map.put("kwd", kwd);

        dataCount = service.dataCount(map);
        if (dataCount != 0) {
            total_page = myUtil.pageCount(dataCount, size);
        }
        
        if (total_page < current_page) {
            current_page = total_page;
        }

        int offset = (current_page - 1) * size;
        if (offset < 0) offset = 0;

        map.put("offset", offset);
        map.put("size", size);

        // 글 리스트
        List<EventManage> list = service.listEvent(map);
        
        String cp = req.getContextPath();
        String query = "";
        String listUrl = cp + "/admin/event/list";
        String articleUrl = cp + "/admin/event/article?page=" + current_page;

        if (kwd.length() != 0) {
            query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
        }
        listUrl += "?" + query;
        articleUrl += "&" + query;

        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("size", size);
        model.addAttribute("total_page", total_page);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("paging", paging);

        model.addAttribute("schType", schType);
        model.addAttribute("kwd", kwd);

        return ".admin.event.list";
    }

    
    @GetMapping("/admin/event/write")
    public String writeForm(Model model) {
        model.addAttribute("mode", "write");
        return ".admin.event.write";
    }
    
    @PostMapping("/admin/event/write")
    public String writeSubmit(
            EventManage dto, HttpSession session) throws Exception {

        SessionInfo info = (SessionInfo) session.getAttribute("member");
        try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "event";

			dto.setMemberNum(info.getMemberNum());
			service.insertEvent(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}

        return "redirect:/admin/event/list";
    }
    
    
    @GetMapping("/admin/event/delete")
	public String deleteEvent(@RequestParam ( name ="num") long num,
			@RequestParam(name = "page", defaultValue = "1") String page,
			@RequestParam(name ="schType",defaultValue = "all") String schType,
			@RequestParam(name ="kwd",defaultValue = "") String kwd,
			HttpSession session) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";
			service.deleteEvent(num, pathname);
		} catch (Exception e) {
		}

		return "redirect:/admin/event/list?" + query;
	}

    @PostMapping("deleteFile")
    @ResponseBody
    public Map<String, Object> deleteFile(
            @RequestParam(name = "fileNum") long fileNum,
            HttpSession session) {
        String root = session.getServletContext().getRealPath("/");
        String path = root + "uploads" + File.separator + "event";
        String state = "true";
        
        try {
            service.deleteFile(fileNum, path);
        } catch (Exception e) {
            state = "false";
        }
        
        Map<String, Object> model = new HashMap<>();
        model.put("state", state);
        return model;
    }
}
