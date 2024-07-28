package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage;
import com.shop.petpal.domain.Order;

@Mapper
public interface MyPageMapper {
	public void insertCart(Order dto) throws SQLException;
	public void updateCart(Order dto) throws SQLException;
	public Order findByCartId(Map<String, Object> map);
	public List<Order> listCart(Long memberNum);
	public void deleteCart(Map<String, Object> map) throws SQLException;
	
	
	// 포인트 리스트
	public List<Mypage> myPointList(long memberNum) throws SQLException;
	public int pointDataCount(long memberNum) throws SQLException;
	public List<Mypage> myPointListPaged(Map<String, Object> params) throws SQLException;
	public int myTotalPoint(long memberNum) throws SQLException;
	
	// 회원정보 수정
	public Member findByMemberNum(long memberNum); // 회원정보 가져오기
	public Member findByMemberEmail(String email); // 회원정보 가져오기
	public void updateMember(Member memberDto) throws SQLException; // 회원정보 수정
	public void updateMemberPassword(Member memberDto) throws SQLException; // 비밀번호 수정
	
	// 회원 배송지
	public List<Mypage> selectAllList(long memberNum) throws SQLException; // 나의 배송지 리스트
	public int deleteDest(Mypage dto) throws SQLException; // 배송지 삭제
	public void insertDest(Mypage dto) throws SQLException; // 배송지 추가
	public int updateDefaultDest(long memberNum) throws SQLException; // 나의 모든 배송지 1(일반배송지)로 바꿈
	public void updateDest(Mypage dto) throws SQLException; // 배송지 수정
	
	// 쿠폰 리스트
	public List<Mypage> selectMemberCoupon(long memberNum) throws SQLException; //나의 쿠폰 리스트
	
	// 펫 정보
	public List<Mypage> selectMemberPet(long memberNum) throws SQLException; // 펫 정보
	public List<Mypage> selectBreed(int species) throws SQLException; // 품종
	public void insertMemberPet(Mypage dto)throws SQLException; // 펫 추가
	public void updateMemberPet(Mypage dto)throws SQLException; // 펫 수정
	public void deleteMemberPet(Mypage dto)throws SQLException; // 펫 삭제
	public void deleteRegPet(long memberNum) throws SQLException; // 대표동물 모두 삭제
	public void insertRegPet(Mypage dto) throws SQLException; // 대표동물 추가
	public Long selectRepPet(long memberNum) throws SQLException; // 대표동물 검색
	
	
	// 찜 정보
	public List<Mypage> selectWishListProducts(long memberNum) throws SQLException; // 나의 찜 리스트
	public void deleteWishListProducts(Mypage dto) throws SQLException; // 찜 삭제
	
	
	// 주문내역
	public List<Mypage> selectOrderList(long memberNum) throws SQLException; // 나의 주문 내역
	public List<Mypage> findByOrderNum(String orderNum) throws SQLException; // 상세주문내역
	public void updateDetailState(Mypage dto) throws SQLException; // 주문 확정 update
	public void insertPoint(Mypage dto) throws SQLException; // 주문 확정시 포인트 지급
	public void insertReview(Mypage dto) throws SQLException; // 리뷰 작성
	public void insertReviewFile(Mypage dto)throws SQLException; // 리뷰 파일
	public void updateCancel(Mypage dto) throws SQLException;// 주문 취소
	public void updateChange(Mypage dto) throws SQLException;// 주문 반품
	public void updateReturn(Mypage dto) throws SQLException;// 주문 환불
	
	// 취소 반품 교환 리스트
	public List<Mypage> cancelReturnChangeList(long memberNum) throws SQLException;
	
	// 리뷰
	public Mypage findByReview(Mypage dto) throws SQLException; // 내가 작성한 리뷰 찾기
	public List<Mypage> selectReviewList(long memberNum) throws SQLException; // 내가 작성한 리뷰 리스트
	public int reviewDataCount(long memberNum) throws SQLException; // 페이징 데이터 카운트
	public List<Mypage> myReviewListPaged(Map<String, Object> params) throws SQLException;
}
