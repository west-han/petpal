package com.shop.petpal.controller;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.petpal.admin.domain.EventManage;
import com.shop.petpal.admin.service.EventManageService;

@Controller
public class EventController {
    @Autowired
    private EventManageService service;

    @GetMapping("/event/list")
    public String list(
            @RequestParam(value = "page", defaultValue = "1") int current_page,
            @RequestParam(defaultValue = "subject" ,name = "schType") String schType,
            @RequestParam(defaultValue = "" ,name = "kwd") String kwd,
            Model model) throws Exception {

        int size = 10;
        int total_page = 0;
        int dataCount = 0;

        if (kwd.length() != 0) {
            kwd = URLDecoder.decode(kwd, "utf-8");
        }

        Map<String, Object> map = new HashMap<>();
        map.put("schType", schType);
        map.put("kwd", kwd);

        dataCount = service.dataCount(map);
        if (dataCount != 0) {
            total_page = (int) Math.ceil((double) dataCount / size);
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

        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("size", size);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", getPaging(current_page, total_page, "/events"));

        return "/event/list";
    }

    private String getPaging(int current_page, int total_page, String url) {
        StringBuilder sb = new StringBuilder();
        int numPerBlock = 5; 
        int currentPageSetup;
        int n, page;
        if (current_page == 0) return "";
        currentPageSetup = (current_page / numPerBlock) * numPerBlock;
        if (current_page % numPerBlock == 0) {
            currentPageSetup = currentPageSetup - numPerBlock;
        }
        n = current_page - numPerBlock;
        if (total_page > numPerBlock && currentPageSetup > 0) {
            sb.append("<a href='" + url + "?page=" + n + "'>이전</a>&nbsp;");
        }
        page = currentPageSetup + 1;
        while (page <= total_page && page <= (currentPageSetup + numPerBlock)) {
            if (page == current_page) {
                sb.append("<span>" + page + "</span>&nbsp;");
            } else {
                sb.append("<a href='" + url + "?page=" + page + "'>" + page + "</a>&nbsp;");
            }
            page++;
        }
        n = current_page + numPerBlock;
        if (total_page - currentPageSetup > numPerBlock) {
            sb.append("<a href='" + url + "?page=" + n + "'>다음</a>&nbsp;");
        }
        return sb.toString();
    }
}
