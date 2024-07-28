package com.shop.petpal.controller;


import java.io.File;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String orderlistForm(HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
        	return "redirect:/member/login";
        }
		
		try {
			List<Mypage2> list = service.selectOrderList(info.getMemberNum());
			
			
			
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".myPage2.orderlist";
	}
	
	
	@PostMapping("updateCancel")
	public String updateCancel(Mypage2 dto) throws Exception {
		// TODO : 취소
		try {
			service.updateCancel(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/myPage2/orderlist";
	}
	@PostMapping("updateChange")
	public String updateChange(Mypage2 dto) throws Exception {
		// TODO : 교환
		try {
			service.updateChange(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/myPage2/orderlist";
	}
	
	@PostMapping("updateReturn")
	public String updateReturn(Mypage2 dto) throws Exception {
		// TODO : 반품
		try {
			service.updateReturn(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/myPage2/orderlist";
	}
	
	
	
	
	
	@GetMapping("findByReview")
	@ResponseBody
	public Map<String, Object> findByReview(@RequestParam(name = "orderDetailNum") long orderDetailNum,
	                                        @RequestParam(name = "productNum") long productNum,
	                                        HttpSession session) throws Exception {
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    if (info == null) {
	        throw new Exception("로그인이 필요합니다.");
	    }

	    Map<String, Object> result = new HashMap<>();
	    Mypage2 dto = new Mypage2();
	    dto.setOrderDetailNum(orderDetailNum);
	    dto.setProductNum(productNum);
	    dto.setMemberNum(info.getMemberNum());

	    boolean hasReview = service.hasReview(dto);
	    result.put("hasReview", hasReview);

	    return result;
	}
	@PostMapping("updateDetailState")
	public String updateDetailState(HttpSession session, Mypage2 dto) throws Exception{
		// TODO 구매확정
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
        	return "redirect:/member/login";
        }
		long memberNum = info.getMemberNum();
		
		try {
			dto.setMemberNum(memberNum);
			service.updateDetailState(dto); // update와 포인트insert 총 2개 사용중
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/myPage2/orderlist";
	}
	
	@PostMapping("writeReview")
	public String insertReview(HttpSession session, Mypage2 dto) throws Exception{
		// TODO 리뷰작성
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String root = session.getServletContext().getRealPath("/");
        String path = root + "uploads" + File.separator + "reviewPhoto";
        
		
		if(info == null) {
        	return "redirect:/member/login";
        }
		
		dto.setMemberNum(info.getMemberNum());
		try {
			service.insertReview(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/myPage2/orderlist";
	}
	
	@GetMapping("orderDetail")
    public String getOrderDetail(@RequestParam("orderNum") String orderNum, Model model,
    		HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
        	return "redirect:/member/login";
        }
		try {
			List<Mypage2> orderDetails = service.findByOrderNum(orderNum);
			model.addAttribute("orderDetails", orderDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
       
        return ".myPage2.orderDetail"; 
    }
	
	
	

	@GetMapping("cancel-return-change")
	public String ancelreturnchangeForm(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
	    if (info == null) {
	        return "redirect:/member/login";
	    }
	    
	    long memberNum = info.getMemberNum();
		try {
			List<Mypage2> list = service.cancelReturnChangeList(memberNum);
			
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".myPage2.cancel-return-change";
	}

	@GetMapping("mycoupon")
	public String mycouponForm(HttpSession session,
			 Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
        	return "redirect:/member/login";
        }
		
		try {
			 List<Mypage2> list = service.selectMemberCoupon(info.getMemberNum());
			 
			 model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
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
        String listUrl = cp + "/myPage2/mypoint";
       

        if (!startDate.isEmpty() && !endDate.isEmpty()) {
            query = "startDate=" + URLEncoder.encode(startDate, "utf-8") + "&endDate=" + URLEncoder.encode(endDate, "utf-8");
            listUrl = cp + "/myPage2/mypoint?" + query;
           
        }

        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        
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
	public String mypetFrom(Model model,
			 HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if(info == null) {
        	return "redirect:/member/login";
        }
		
		try {
			List<Mypage2> list = service.selectMemberPet(info.getMemberNum());
			Long representativePetNum = service.selectRepPet(info.getMemberNum());
		    // 현재 대표 동물 정보 조회
		    service.selectRepPet(info.getMemberNum());
			
			model.addAttribute("list", list);
			model.addAttribute("representativePetNum", representativePetNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

		return ".myPage2.mypet";
	}
	
	
	@PostMapping("insertMemberPet")
    public String insertPetFrom(Mypage2 dto, HttpSession session) throws Exception {
        String root = session.getServletContext().getRealPath("/");
        String path = root + "uploads" + File.separator + "petPhotos";

        SessionInfo info = (SessionInfo) session.getAttribute("member");

        try {
            dto.setMemberNum(info.getMemberNum());
            service.insertMemberPet(dto, path);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/myPage2/mypet";
    }
	
	@PostMapping("updateMemberPet")
	public String updateMemberPet(Mypage2 dto, HttpSession session) throws Exception {
	    String root = session.getServletContext().getRealPath("/");
	    String path = root + "uploads" + File.separator + "petPhotos";
	    
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    try {
	    	dto.setMemberNum(info.getMemberNum());
	        service.updateMemberPet(dto, path);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return "redirect:/myPage2/mypet";
	}
	
	@PostMapping("deleteMemberPet")
	public String deleteMemberPet(Mypage2 dto, HttpSession session) throws Exception{
		String root = session.getServletContext().getRealPath("/");
	    String path = root + "uploads" + File.separator + "petPhotos";
	    
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
			dto.setMemberNum(info.getMemberNum());
			service.deleteMemberPet(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/myPage2/mypet";
	}
	
	@PostMapping("/setInsertRegPet")
	@ResponseBody
	public Map<String, String> setInsertRegPet(Mypage2 dto, HttpSession session) {
	    Map<String, String> response = new HashMap<>();
	    try {
	        SessionInfo info = (SessionInfo) session.getAttribute("member");
	        dto.setMemberNum(info.getMemberNum());

	        service.setInsertRegPet(dto);
	        response.put("message", "대표 동물이 설정되었습니다.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("message", "대표 동물 설정에 실패했습니다.");
	    }
	    return response;
	}
	
	
	@GetMapping("breed")
    @ResponseBody
    public List<Mypage2> getBreedBySpecies(@RequestParam("petSpecies") int species) throws Exception {
        return service.selectBreed(species);
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
	
	@PostMapping("updatePassWord")
	public String updatePassWordSubmit(Member memberDto,
			final RedirectAttributes reAttr,
				HttpSession session,
				 @RequestParam("password") String currentPassword,
			     @RequestParam("newPassword1") String newPassword,
			     @RequestParam("newPassword2") String confirmPassword){
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		memberDto.setMemberNum(info.getMemberNum());
		// 현재 비밀번호 확인
	    if (!service.isPasswordCheck(info.getEmail(), currentPassword)) {
	        reAttr.addFlashAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
	        return "redirect:/myPage2/mymodify";
	    }
		
		if (!newPassword.equals(confirmPassword)) {
	        reAttr.addFlashAttribute("message", "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
	        return "redirect:/myPage2/mymodify";
	    }
		
		
		try {
			memberDto.setEmail(info.getEmail());
			memberDto.setPassword(newPassword); // 새 비밀번호 설정
			service.updateMemberPassword(memberDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append(info.getNickname() + "님의 비밀번호가 정상적으로 변경되었습니다.");
		
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/myPage2/mymodify";
	}

	@GetMapping("likelist")
	public String likelistFrom(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if (info == null) {
            return "redirect:/member/login";
        }
		
		try {
			 List<Mypage2> wishList = service.selectWishListProducts(info.getMemberNum());
			 
			 model.addAttribute("wishList", wishList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".myPage2.likelist";
	}
	
	@PostMapping("deleteWishList")
	public String deleteWishList(Mypage2 dto, HttpSession session) {
	    SessionInfo info = (SessionInfo) session.getAttribute("member");

	    if (info == null) {
	        return "redirect:/member/login";
	    }

	    try {
	        dto.setMemberNum(info.getMemberNum());
	        service.deleteWishListProducts(dto);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return "redirect:/myPage2/likelist";
	}

	@GetMapping("myreview")
	public String myreviewForm(@RequestParam(value = "page", defaultValue = "1") int current_page,
            @RequestParam(defaultValue = "") String startDate,
            @RequestParam(defaultValue = "") String endDate,
            HttpServletRequest req,
            HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		
	    if (info == null) {
	        return "redirect:/member/login";
	    }
	    
	    long memberNum = info.getMemberNum();
	    String cp = req.getContextPath();
		
	    int size = 3;
        int total_page;
        int dataCount;
        
	    
        dataCount = service.reviewDataCount(memberNum);
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
        
		// List<Mypage2> reviews = service.selectReviewList(info.getMemberNum());
        
        List<Mypage2> reviews = service.myReviewListPaged(map);
        
        
        String query = "";
        String listUrl = cp + "/myPage2/myreview";
        
        if (!startDate.isEmpty() && !endDate.isEmpty()) {
            query = "startDate=" + URLEncoder.encode(startDate, "utf-8") + "&endDate=" + URLEncoder.encode(endDate, "utf-8");
            listUrl = cp + "/myPage2/myreview?" + query;
           
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
        
        
        model.addAttribute("reviews", reviews);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("size", size);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        
		return ".myPage2.myreview";
	}
	
	@GetMapping("myaddress")
	public String myaddressForm(HttpSession session,
			Model model) throws Exception{
		
		try {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		if(info == null) {
			return "redirect:/member/login";
		}
			
		List<Mypage2> list = service.selectAllList(info.getMemberNum());
			
		model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ".myPage2.myaddress";
	}
	
	@PostMapping("addAddress")
    public String addAddress(Mypage2 dto, HttpSession session,
                             @RequestParam(defaultValue = "1") int defaultDest) throws Exception {
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        dto.setMemberNum(info.getMemberNum());
        dto.setDefaultDest(defaultDest); // 기본 배송지 설정 값을 DTO에 설정
        
        if(defaultDest == 1) {
        	service.insertDest(dto);// 일반 배송지
        }else if(defaultDest == 0) {
        	service.updateDefaultDest(info.getMemberNum()); // 모든 배송지를 일반 배송지로 바꿈
        	service.insertDest(dto); // 기본 배송지
        }
        

        return "redirect:/myPage2/myaddress";
    }
	
	@PostMapping("deleteAddress")
    public String deleteAddress(@RequestParam long destNum, HttpSession session) throws Exception {
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        Mypage2 dto = new Mypage2();
        dto.setMemberNum(info.getMemberNum());
        dto.setDestNum(destNum);
        service.deleteDest(dto);
        return "redirect:/myPage2/myaddress";
    }
	
	@PostMapping("updateAddress")
	public String updateAddress(Mypage2 dto,
			@RequestParam long destNum,
			HttpSession session,
			@RequestParam(defaultValue = "1") int defaultDest) throws Exception{
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setMemberNum(info.getMemberNum());
		dto.setDestNum(destNum);
		dto.setDefaultDest(defaultDest);
		
		if(defaultDest == 1) {
			service.updateDest(dto);
		}else if(defaultDest == 0) {
			service.updateDefaultDest(info.getMemberNum());
			service.updateDest(dto);
		}
		
		return "redirect:/myPage2/myaddress";
	}
	
	
	
	

}
