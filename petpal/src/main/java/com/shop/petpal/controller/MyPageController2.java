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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.petpal.common.MyUtil;
import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage2;
import com.shop.petpal.domain.SessionInfo;
import com.shop.petpal.service.MemberService;
import com.shop.petpal.service.Mypage2Service;

@Controller
@RequestMapping("/myPage2/*")
public class MyPageController2 {

	@Autowired
	private Mypage2Service service;
	
	@Autowired
	private MemberService memberService;

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
        
        if(info == null) {
        	return "redirect:/member/login";
        }
       

        long memberNum = info.getMemberNum(); // SessionInfo 객체에서 memberNum 가져오기
        String cp = req.getContextPath();

        int size = 10;
        int total_page;
        int dataCount;
        int totalPoint = 0;
        
        dataCount = service.pointDataCount(memberNum);
        total_page = myUtil.pageCount(dataCount, size);
        totalPoint = service.myTotalPoint(memberNum);
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
        model.addAttribute("totalPoint", totalPoint);

        return ".myPage2.mypoint";
    }

	@GetMapping("mypet")
	public String mypetFrom() throws Exception {

		return ".myPage2.mypet";
	}

	@GetMapping("mymodify")
	public String mymodifyFrom(Model model, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
        	return "redirect:/member/login";
        }
		
		// member2에 대한 birth, address1,address2,tel,nickname,userName,postalCode 의 값들을 가져옴
		Member memberDto = service.findByMember(info.getMemberNum());

		// jsp한테 dto의 값을 보냄
		model.addAttribute("dto", memberDto);
		model.addAttribute("info", info);
		return ".myPage2.mymodify";
	}
	
	@PostMapping("userNicknameCheck")
	@ResponseBody
	public Map<String, Object> nickNameCheck(@RequestParam String nickname, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String p = "true";
		Member memberDto = memberService.findByNickName(nickname);
		if (memberDto != null) {
	        // 현재 사용자가 같은 닉네임을 사용 중인 경우
	        if (info.getNickname().equals(memberDto.getNickname())) {
	            p = "true";
	        } else {
	            p = "false";
	           
	        }
	    }

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	@PostMapping("updateMember")
	public String updateMemberSubmit(Member dto, HttpSession session) {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			if (info == null) {
	            // 세션이 만료된 경우 로그인 페이지로 리다이렉트
	            return "redirect:/member/login";
	        }
			// dto에 memberNum 집어넣음
			dto.setMemberNum(info.getMemberNum());
			
			service.updateMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/myPage2/mymodify";
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
