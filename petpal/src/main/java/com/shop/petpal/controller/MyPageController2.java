package com.shop.petpal.controller;


import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.petpal.common.MyUtil;
import com.shop.petpal.domain.Mypage2;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.Mypage2Service;

@Controller
@RequestMapping("/myPage2/*")
public class MyPageController2 {

	@Autowired
	private Mypage2Service service;

	@Autowired
	private MyUtil myUtil;

	@GetMapping("orderlist")
	public String orderlistForm() throws Exception {

		return ".myPage2.orderlist";
	}

	@GetMapping("cancel-return-change")
	public String ancelreturnchangeForm() throws Exception {

		return ".myPage2.cancel-return-change";
	}

	@GetMapping("mycoupon")
	public String mycouponForm() throws Exception {

		return ".myPage2.mycoupon";
	}

	@GetMapping("mypoint")
    public String mypointFrom(HttpSession session,
                              @RequestParam(value = "page", defaultValue = "1") int current_page,
                              @RequestParam(defaultValue = "") String startDate,
                              @RequestParam(defaultValue = "") String endDate,
                              HttpServletRequest req,
                              Model model) throws Exception {
        // 마이페이지 포인트리스트
        SessionInfo info = (SessionInfo) session.getAttribute("member");

       

        long memberNum = info.getMemberNum(); // SessionInfo 객체에서 memberNum 가져오기
        String cp = req.getContextPath();

        int size = 10;
        int total_page;
        int dataCount;

        dataCount = service.pointDataCount(memberNum);
        total_page = myUtil.pageCount(dataCount, size);

        if (total_page < current_page) {
            current_page = total_page;
        }

        int offset = (current_page - 1) * size;
        if (offset < 0) offset = 0;

        Map<String, Object> map = new HashMap<>();
        map.put("memberNum", memberNum);
        map.put("offset", offset);
        map.put("size", size);

        if (!startDate.isEmpty() && !endDate.isEmpty()) {
            map.put("startDate", startDate);
            map.put("endDate", endDate);
        }

        List<Mypage2> list = service.myPointListPaged(map);

        String query = "";
        String listUrl = cp + "/mypoint";
        String articleUrl = cp + "/mypoint?page=" + current_page;

        if (!startDate.isEmpty() && !endDate.isEmpty()) {
            query = "startDate=" + URLEncoder.encode(startDate, "utf-8") + "&endDate=" + URLEncoder.encode(endDate, "utf-8");
            listUrl = cp + "/mypoint?" + query;
            articleUrl = cp + "/mypoint?page=" + current_page + "&" + query;
        }

        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("size", size);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        return ".myPage2.mypoint";
    }

	@GetMapping("mypet")
	public String mypetFrom() throws Exception {

		return ".myPage2.mypet";
	}

	@GetMapping("mymodify")
	public String mymodifyFrom() throws Exception {

		return ".myPage2.mymodify";
	}

	@GetMapping("likelist")
	public String likelistFrom() throws Exception {

		return ".myPage2.likelist";
	}

	@GetMapping("myreview")
	public String myreviewForm() throws Exception {

		return ".myPage2.myreview";
	}

}
