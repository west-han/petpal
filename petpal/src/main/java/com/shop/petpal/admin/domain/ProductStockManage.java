package com.shop.petpal.admin.domain;

import java.util.List;

public class ProductStockManage {
	private long stockNum;//재고번호
	private long productNum;//상품번호
	private Long detailNum; // 상세번호
	private Long detailNum2;// 상세번호
	private int totalStock; //총계
	
	private List<Long> stockNums;
	private List<Long> detailNums;
	private List<Long> detailNums2;
	private List<Integer> totalStocks;
	
	private String productName;//상품명
	private String optionName;//옵션이름
	private String optionName2;//옵션이름
	private String optionValue; //옵션값
	private String optionValue2; //옵션값
	public long getStockNum() {
		return stockNum;
	}
	public void setStockNum(long stockNum) {
		this.stockNum = stockNum;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public Long getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(Long detailNum) {
		this.detailNum = detailNum;
	}
	public Long getDetailNum2() {
		return detailNum2;
	}
	public void setDetailNum2(Long detailNum2) {
		this.detailNum2 = detailNum2;
	}
	public int getTotalStock() {
		return totalStock;
	}
	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}
	public List<Long> getStockNums() {
		return stockNums;
	}
	public void setStockNums(List<Long> stockNums) {
		this.stockNums = stockNums;
	}
	public List<Long> getDetailNums() {
		return detailNums;
	}
	public void setDetailNums(List<Long> detailNums) {
		this.detailNums = detailNums;
	}
	public List<Long> getDetailNums2() {
		return detailNums2;
	}
	public void setDetailNums2(List<Long> detailNums2) {
		this.detailNums2 = detailNums2;
	}
	public List<Integer> getTotalStocks() {
		return totalStocks;
	}
	public void setTotalStocks(List<Integer> totalStocks) {
		this.totalStocks = totalStocks;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getOptionName2() {
		return optionName2;
	}
	public void setOptionName2(String optionName2) {
		this.optionName2 = optionName2;
	}
	public String getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}
	public String getOptionValue2() {
		return optionValue2;
	}
	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}
	
	
}
