package com.shop.petpal.service;



import java.util.List;
import java.util.Map;

import com.shop.petpal.domain.Member;
import com.shop.petpal.domain.Mypage2;

public interface Mypage2Service {
	public List<Mypage2> myPointList(long memberNum) throws Exception; // 포인트 리스트
	public int pointDataCount(long memberNum) throws Exception; // 데이터카운트
	public List<Mypage2> myPointListPaged(Map<String, Object> params) throws Exception; // 포인트 날짜 검색
	public int myTotalPoint(long memberNum) throws Exception; // 포인트 합계
	
	public Member findByMember(long memberNum); // 회원번호 가져오기
	public Member findByMember(String email); // 회원이메일 가져오기
	public void updateMember(Member memberDto) throws Exception; // 회원정보 수정
	public void updateMemberPassword(Member memberDto) throws Exception; // 비밀번호 수정
	public boolean isPasswordCheck(String email, String password); // 비밀번호 체크
	
	// 회원 배송지
	public List<Mypage2> selectAllList(long memberNum) throws Exception; // 나의 배송지 리스트
	public void deleteDest(Mypage2 dto) throws Exception; // 배송지 삭제
	public void insertDest(Mypage2 dto) throws Exception; // 배송지 추가
	public void updateDefaultDest(long memberNum) throws Exception; // 나의 모든 배송지 1(일반배송지)로 바꿈
	public void updateDest(Mypage2 dto) throws Exception; // 배송지 수정
	
	// 쿠폰 리스트
	public List<Mypage2> selectMemberCoupon(long memberNum) throws Exception; // 나의 쿠폰 리스트
	
	// 펫 정보
	public List<Mypage2> selectMemberPet(long memberNum) throws Exception; // 펫 리스트
	public List<Mypage2> selectBreed(int species) throws Exception; // 품종
	public void insertMemberPet(Mypage2 dto, String pathname)throws Exception; // 펫 추가
	public void updateMemberPet(Mypage2 dto, String pathname)throws Exception; // 펫 수정
	public void deleteMemberPet(Mypage2 dto, String pathname)throws Exception; // 펫 삭제
	public void setInsertRegPet(Mypage2 dto) throws Exception; // 대표동물 추가
	public Long selectRepPet(long memberNum) throws Exception; // 대표동물 검색
	
	
	// 나의 찜
	public List<Mypage2> selectWishListProducts(long memberNum) throws Exception; // 찜 리스트
	public void deleteWishListProducts(Mypage2 dto) throws Exception; // 찜 삭제
	
	// 주문내역
	public List<Mypage2> selectOrderList(long memberNum) throws Exception; // 주문내역
	public List<Mypage2> findByOrderNum(String orderNum) throws Exception; // 상세주문내역
	public void updateDetailState(Mypage2 dto) throws Exception; // 주문확정 업데이트
	public void updateCancel(Mypage2 dto) throws Exception; // 주문 취소
	public void updateChange(Mypage2 dto) throws Exception; // 주문 교환
	public void updateReturn(Mypage2 dto) throws Exception; // 주문 반품
	
	// 취소 교환 반품 리스트
	public List<Mypage2> cancelReturnChangeList(long memberNum) throws Exception;
	
	
	public void insertReview(Mypage2 dto, String pathname) throws Exception; // 리뷰 및 리뷰 파일 insert
	public boolean hasReview(Mypage2 dto)throws Exception; // 내가 작성한 리뷰 찾기
	public List<Mypage2> selectReviewList(long memberNum) throws Exception;
	public int reviewDataCount(long memberNum) throws Exception; 
	public List<Mypage2> myReviewListPaged(Map<String, Object> params) throws Exception;
	
}
