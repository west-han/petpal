package com.shop.petpal.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.shop.petpal.common.FileManager;
import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage2;
import com.shop.petpal.mapper.MypageMapper2;



@Service
public class Mypage2ServiceImpl implements Mypage2Service {
	
	@Autowired
	private MypageMapper2 mapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<Mypage2> myPointList(long memberNum) {
		List<Mypage2> list = new ArrayList<Mypage2>();
		
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
	public List<Mypage2> myPointListPaged(Map<String, Object> params) {
		List<Mypage2> list = new ArrayList<>();
        
        try {
            list = mapper.myPointListPaged(params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
	}

	@Override
	public void myTotalPoint(long memberNum) throws Exception {
		
		
		try {
			mapper.myTotalPoint(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
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
	public List<Mypage2> selectAllList(long memberNum) throws Exception {
		List<Mypage2> list = null;
		
		try {
			list = mapper.selectAllList(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteDest(Mypage2 dto) throws Exception {
		// TODO 배송지 삭제
		try {
            mapper.deleteDest(dto);
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public void insertDest(Mypage2 dto) throws Exception {
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
	public void updateDest(Mypage2 dto) throws Exception {
		// TODO 배송지 수정
		
		try {
			mapper.updateDest(dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Mypage2> selectMemberCoupon(long memberNum) throws Exception {
		// TODO 나의 쿠폰 리스트
		List<Mypage2> list = null;
		try {
			list = mapper.selectMemberCoupon(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Mypage2> selectMemberPet(long memberNum) throws Exception {
		// TODO 나의 펫 리스트
		List<Mypage2> list = null;
		
		try {
			list = mapper.selectMemberPet(memberNum);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("Error fetching pet list", e);
		}
		
		return list;
	}

	@Override
	public List<Mypage2> selectBreed(int species) throws Exception {
		// TODO 품종
		List<Mypage2> list = null;
		
		try {
			list = mapper.selectBreed(species);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return list;
	}

	@Override
	public void insertMemberPet(Mypage2 dto,String pathname) throws Exception {
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
	public void updateMemberPet(Mypage2 dto, String pathname) throws Exception {
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
	public void deleteMemberPet(Mypage2 dto, String pathname) throws Exception {
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
	public void setInsertRegPet(Mypage2 dto) throws Exception {
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
	public List<Mypage2> selectWishListProducts(long memberNum) throws Exception {
		List<Mypage2> list = null;
		try {
			list = mapper.selectWishListProducts(memberNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public void deleteWishListProducts(Mypage2 dto) throws Exception {
		// TODO 찜삭제
		
		try {
			 mapper.deleteWishListProducts(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Mypage2> selectOrderList(long memberNum) throws Exception {
		// TODO 주문내역
		List<Mypage2> list = null;
		try {
			list = mapper.selectOrderList(memberNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
