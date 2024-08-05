package com.shop.petpal.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.petpal.common.FileManager;
import com.shop.petpal.common.OrderState;
import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage;
import com.shop.petpal.domain.Order;
import com.shop.petpal.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertCart(Order dto) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNum", dto.getMemberNum());
		
		try {
			for(int i = 0; i < dto.getStockNums().size(); i++) {
				dto.setProductNum(dto.getProductNums().get(i));
				dto.setStockNum(dto.getStockNums().get(i));
				dto.setAmount(dto.getBuyAmounts().get(i));
				
				map.put("stockNum", dto.getStockNums().get(i));
				if(mapper.findByCartId(map) == null) {
					mapper.insertCart(dto);
				} else {
					mapper.updateCart(dto);
				}
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Order> listCart(Long memberNum) {
		List<Order> list = null;
		
		try {
			list = mapper.listCart(memberNum);
			
			for(Order dto : list) {
				dto.setPriceDiscount((dto.getPriceOrig() - dto.getDiscountAmount())); // 할인전체금액
				dto.setPricePay(dto.getPriceDiscount() * dto.getAmount()); // 해당 상품의 전체 가격
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteCart(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateCart(Order dto) throws Exception {
		try {
			mapper.updateCart(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Mypage> myPointList(long memberNum) {
		List<Mypage> list = new ArrayList<Mypage>();
		
		try {
			list = mapper.myPointList(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int pointDataCount(long memberNum) {
		int count = 0;
        
        try {
            count = mapper.pointDataCount(memberNum);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return count;
	}

	@Override
	public List<Mypage> myPointListPaged(Map<String, Object> params) {
		List<Mypage> list = new ArrayList<>();
        
        try {
            list = mapper.myPointListPaged(params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
	}

	@Override
	public int myTotalPoint(long memberNum) throws Exception {
		int totalPoint = 0;
		
		try {
			totalPoint = mapper.myTotalPoint(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return totalPoint;
	}

	@Override
	public Member findByMember(long memberNum) {
		Member memberDto = null;
		
		try {
			memberDto = mapper.findByMemberNum(memberNum);
			if(memberDto != null) {
				if(memberDto.getTel() != null) {
					String[] s = memberDto.getTel().split("-");
					memberDto.setTel1(s[0]);
					memberDto.setTel2(s[1]);
					memberDto.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDto;
	}
	@Override
	public Member findByMember(String email) {
		Member memberDto = null;
		
		try {
			memberDto = mapper.findByMemberEmail(email);
			if(memberDto != null) {
				if(memberDto.getTel() != null) {
					String[] s = memberDto.getTel().split("-");
					memberDto.setTel1(s[0]);
					memberDto.setTel2(s[1]);
					memberDto.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDto;
	}

	@Override
	public void updateMember(Member memberDto) throws Exception {
		try {
			if (memberDto.getTel1().length() != 0 && memberDto.getTel2().length() != 0 && memberDto.getTel3().length() != 0) {
				memberDto.setTel(memberDto.getTel1() + "-" + memberDto.getTel2() + "-" + memberDto.getTel3());
			}
			mapper.updateMember(memberDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMemberPassword(Member memberDto) throws Exception {
		try {
			
			boolean bPwdUpdate = ! isPasswordCheck(memberDto.getEmail(), memberDto.getPassword());
			if(bPwdUpdate) {
				String encPwd = bcryptEncoder.encode(memberDto.getPassword());
				memberDto.setPassword(encPwd);
				mapper.updateMemberPassword(memberDto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public boolean isPasswordCheck(String email, String password) {
		Member memberDto = findByMember(email);
		
		if(memberDto == null) {
			return false;
		}
		return bcryptEncoder.matches(password, memberDto.getPassword());
	}

	@Override
	public List<Mypage> selectAllList(long memberNum) throws Exception {
		List<Mypage> list = null;
		
		try {
			list = mapper.selectAllList(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteDest(Mypage dto) throws Exception {
		// TODO 배송지 삭제
		try {
            mapper.deleteDest(dto);
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public void insertDest(Mypage dto) throws Exception {
		// TODO 배송지 추가
		
		try {
			mapper.insertDest(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateDefaultDest(long memberNum) throws Exception {
		// TODO 모든 배송지 1(일반 배송지)로 변경
		
		try {
			mapper.updateDefaultDest(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateDest(Mypage dto) throws Exception {
		// TODO 배송지 수정
		
		try {
			mapper.updateDest(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Mypage> selectMemberCoupon(long memberNum) throws Exception {
		// TODO 나의 쿠폰 리스트
		List<Mypage> list = null;
		try {
			list = mapper.selectMemberCoupon(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mypage> selectMemberPet(long memberNum) throws Exception {
		// TODO 나의 펫 리스트
		List<Mypage> list = null;
		
		try {
			list = mapper.selectMemberPet(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("Error fetching pet list", e);
		}
		
		return list;
	}

	@Override
	public List<Mypage> selectBreed(int species) throws Exception {
		// TODO 품종
		List<Mypage> list = null;
		
		try {
			list = mapper.selectBreed(species);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return list;
	}

	@Override
	public void insertMemberPet(Mypage dto,String pathname) throws Exception {
		// TODO 펫추가
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setPetPhoto(saveFilename);
			}
			mapper.insertMemberPet(dto);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateMemberPet(Mypage dto, String pathname) throws Exception {
	    try {
	        String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
	        if (saveFilename != null) {
	            // 이전 파일 지우기
	            if (dto.getPetPhoto() != null && dto.getPetPhoto().length() != 0) {
	                try {
	                    fileManager.doFileDelete(dto.getPetPhoto(), pathname);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	            dto.setPetPhoto(saveFilename);
	        }
	        mapper.updateMemberPet(dto);
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

	@Override
	public void deleteMemberPet(Mypage dto, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			
			 mapper.deleteMemberPet(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
			
	}

	@Override
	public void setInsertRegPet(Mypage dto) throws Exception {
		// TODO 대표 펫 삭제 후 대표 펫 추가
		try {
			mapper.deleteRegPet(dto.getMemberNum()); // 대표동물 삭제
            
            mapper.insertRegPet(dto);// 새로운 대표 동물 추가
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		}
		
	}

	@Override
	public Long selectRepPet(long memberNum) throws Exception {
	    try {
	        return mapper.selectRepPet(memberNum);
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

	@Override
	public List<Mypage> selectWishListProducts(long memberNum) throws Exception {
		List<Mypage> list = null;
		try {
			list = mapper.selectWishListProducts(memberNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public void deleteWishListProducts(Mypage dto) throws Exception {
		// TODO 찜삭제
		
		try {
			 mapper.deleteWishListProducts(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Mypage> selectOrderList(long memberNum) throws Exception {
		// TODO 주문내역
		List<Mypage> list = null;
		try {
			list = mapper.selectOrderList(memberNum);
			for (Mypage mypage2 : list) {
				mypage2.setDetailStateMemo(OrderState.DETAILSTATEINFO[mypage2.getDetailState()]);
				mypage2.setOrderStateMemo(OrderState.ORDERSTATEINFO[mypage2.getOrderState()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mypage> findByOrderNum(String orderNum) throws Exception {

		List<Mypage> list = null;
		try {
			list = mapper.findByOrderNum(orderNum);
			for (Mypage mypage2 : list) {
				mypage2.setDetailStateMemo(OrderState.DETAILSTATEINFO[mypage2.getDetailState()]);
				mypage2.setOrderStateMemo(OrderState.ORDERSTATEINFO[mypage2.getOrderState()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateDetailState(Mypage dto) throws Exception {
		try {
			mapper.updateDetailState(dto); // orderDetailNum을 기준으로 주문확정(1) 상태로 업데이트
			mapper.insertPoint(dto); // savePoint 기준으로 포인트 지급
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertReview(Mypage dto, String pathname) throws Exception {
	    try {
	    	mapper.insertReview(dto);
	        List<MultipartFile> files = dto.getSelectFiles();
	        if (files != null && !files.isEmpty()) {
	            for (MultipartFile file : files) {
	                String saveFilename = fileManager.doFileUpload(file, pathname);
	                if (saveFilename == null) {
	                    continue;
	                }
	                
	                dto.setReviewFileName(saveFilename);
	                mapper.insertReviewFile(dto);
	            }
	        }
	        
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e;
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

	public boolean hasReview(Mypage dto) throws Exception {
        try {
            Mypage review = mapper.findByReview(dto);
            return review != null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

	@Override
	public List<Mypage> selectReviewList(long memberNum) throws Exception {
		List<Mypage> list = null;
		try {
			list = mapper.selectReviewList(memberNum);
			for (Mypage review : list) {
	            if (review.getReviewFileName() != null) {
	                review.setReviewFileNameList(Arrays.asList(review.getReviewFileName().split(", ")));
	            }
	        }
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
		
	}

	@Override
	public int reviewDataCount(long memberNum) throws Exception {
		// TODO 리뷰 페이징 처리 데이터 갯수
		int dataCount = 0;
		try {
			dataCount = mapper.reviewDataCount(memberNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dataCount;
	}

	@Override
	public List<Mypage> myReviewListPaged(Map<String, Object> params) throws Exception {
		List<Mypage> list = new ArrayList<>();
        
        try {
            list = mapper.myReviewListPaged(params);
            for (Mypage review : list) {
	            if (review.getReviewFileName() != null) {
	                review.setReviewFileNameList(Arrays.asList(review.getReviewFileName().split(", ")));
	            }
	        }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
	}

	@Override
	public void updateCancel(Mypage dto) throws Exception {
		// TODO 주문 취소
		
		try {
			mapper.updateCancel(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateChange(Mypage dto) throws Exception {
		// TODO 주문 교환
		try {
			mapper.updateChange(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateReturn(Mypage dto) throws Exception {
		// TODO 주문 반품
		
		try {
			mapper.updateReturn(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Mypage> cancelReturnChangeList(long memberNum) throws Exception {
		List<Mypage> list = null;
		try {
			list = mapper.cancelReturnChangeList(memberNum);
			for (Mypage mypage2 : list) {
				mypage2.setDetailStateMemo(OrderState.DETAILSTATEINFO[mypage2.getDetailState()]);
				mypage2.setOrderStateMemo(OrderState.ORDERSTATEINFO[mypage2.getOrderState()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return list;
	}
	
}
