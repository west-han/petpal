package com.shop.petpal.domain;

public enum MemberState {
	ACTIVE(0, "활성"), PASSWORD_LOCKED(1, "패스워드 5회 이상 틀림");
	
	private int stateCode;
	private String memo;
	
	private MemberState(int stateCode, String memo) {
		this.stateCode = stateCode;
		this.memo = memo;
	}

	public int getStateCode() {
		return stateCode;
	}

	public String getMemo() {
		return memo;
	}
	
	public MemberState checkState(int code) {
		for (MemberState state : MemberState.values()) {
			if (state.getStateCode() == code) {
				return state;
			}
		}
		
		return null;
	}
}
