package com.shop.petpal.common;

public class OrderState {
	// 주문상태 정보
	public static final String[] ORDERSTATEINFO = 
		{"결제대기", "결제완료", "발송처리", "배송시작", "배송중", "배송완료", "판매취소"};

	// 주문상세상태 정보(관리자)
	public static final String[] DETAILSTATEMANAGER = 
		{"구매확정대기", "구매확정", "자동구매확정",
			"판매취소",
			"주문취소요청", "주문취소완료",
			"교환요청", "교환접수", "교환발송완료", "교환불가",
			"반품요청","반품접수","반품완료","반품불가",
			"기타"};
	 
	// 주문상세상태 정보(구매자)
	public static final String[] DETAILSTATEINFO = 
		{"구매확정대기", "구매확정", "자동구매확정",
			"주문취소",
			"주문취소요청", "주문취소",
			"교환요청", "교환접수", "교환완료", "구매",
			"반품요청","반품접수","반품완료","구매",
			"기타"};
}