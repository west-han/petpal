package com.shop.petpal.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage2;

public interface MypageMapper2 {
	// 포인트 리스트
	public List<Mypage2> myPointList(long memberNum) throws SQLException;
	public int pointDataCount(long memberNum) throws SQLException;
	public List<Mypage2> myPointListPaged(Map<String, Object> params) throws SQLException;
	public int myTotalPoint(long memberNum) throws SQLException;
	
	// 회원정보 수정
	public Member findByMemberNum(long memberNum); // 회원정보 가져오기
	public Member findByMemberEmail(String email); // 회원정보 가져오기
	public void updateMember(Member memberDto) throws SQLException; // 회원정보 수정
	public void updateMemberPassword(Member memberDto) throws SQLException; // 비밀번호 수정
	
	// 회원 배송지
	public List<Mypage2> selectAllList(long memberNum) throws SQLException; // 나의 배송지 리스트
	public int deleteDest(Mypage2 dto) throws SQLException; // 배송지 삭제
	public void insertDest(Mypage2 dto) throws SQLException; // 배송지 추가
	public int updateDefaultDest(long memberNum) throws SQLException; // 나의 모든 배송지 1(일반배송지)로 바꿈
	public void updateDest(Mypage2 dto) throws SQLException; // 배송지 수정
	
	// 쿠폰 리스트
	public List<Mypage2> selectMemberCoupon(long memberNum) throws SQLException; //나의 쿠폰 리스트
	
	// 펫 정보
	public List<Mypage2> selectMemberPet(long memberNum) throws SQLException; // 펫 정보
	public List<Mypage2> selectBreed(int species) throws SQLException; // 품종
	public void insertMemberPet(Mypage2 dto)throws SQLException; // 펫 추가
	public void updateMemberPet(Mypage2 dto)throws SQLException; // 펫 수정
	public void deleteMemberPet(Mypage2 dto)throws SQLException; // 펫 삭제
	public void deleteRegPet(long memberNum) throws SQLException; // 대표동물 모두 삭제
	public void insertRegPet(Mypage2 dto) throws SQLException; // 대표동물 추가
	public Long selectRepPet(long memberNum) throws SQLException; // 대표동물 검색
	
	
	// 찜 정보
	public List<Mypage2> selectWishListProducts(long memberNum) throws SQLException; // 나의 찜 리스트
	public void deleteWishListProducts(Mypage2 dto) throws SQLException; // 찜 삭제
	
	
	// 주문내역
	public List<Mypage2> selectOrderList(long memberNum) throws SQLException; // 나의 주문 내역
	public List<Mypage2> findByOrderNum(String orderNum) throws SQLException; // 상세주문내역
	public void updateDetailState(Mypage2 dto) throws SQLException; // 주문 확정 update
	public void insertPoint(Mypage2 dto) throws SQLException; // 주문 확정시 포인트 지급
	public void insertReview(Mypage2 dto) throws SQLException; // 리뷰 작성
	public void insertReviewFile(Mypage2 dto)throws SQLException; // 리뷰 파일
	public void updateCancel(Mypage2 dto) throws SQLException;// 주문 취소
	public void updateChange(Mypage2 dto) throws SQLException;// 주문 반품
	public void updateReturn(Mypage2 dto) throws SQLException;// 주문 환불
	
	// 취소 반품 교환 리스트
	public List<Mypage2> cancelReturnChangeList(long memberNum) throws SQLException;
	
	// 리뷰
	public Mypage2 findByReview(Mypage2 dto) throws SQLException; // 내가 작성한 리뷰 찾기
	public List<Mypage2> selectReviewList(long memberNum) throws SQLException; // 내가 작성한 리뷰 리스트
	public int reviewDataCount(long memberNum) throws SQLException; // 페이징 데이터 카운트
	public List<Mypage2> myReviewListPaged(Map<String, Object> params) throws SQLException;
	
}
