package com.shop.petpal.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductManage {
	private long productNum;
	private String productName;
	private int productClass; // NOTE: 일반(0) 특가(1)
	private int price;
	private int discountRate;
	private int discountAmount;
	private int deliveryCharge;
	// NOTE: 상품 소개 글
	private String content;
	private String thumbnail;
	// NOTE: 판매준비(0), 판매중(1), 품절(2), 판매중단(3)
	private int productStatus;
	private String regDate;
	private String modifyDate;
	// NOTE: 종류 - 강아지(1), 고양이(2)
	private int species;
	// NOTE: 원산지
	private String origin;
	private String brand;
	private String manufacturer;

	
	// NOTE: 클라이언트가 전송한 파일을 컨트롤러에서 받기 위한 필드
	private MultipartFile thumbnailFile;

	private int categoryNum;
	private String categoryName;
	private int parentCategory;

	// NOTE: 상품 상세 이미지
	private long fileNum;
	private String filename;
	private List<MultipartFile> addFiles;

	private int optionCount;

	private Long optionNum;
	private String optionName;
	private Long parentOption;

	private Long optionNum2;
	private String optionName2;

	private Long detailNum;
	private String optionValue;
	private List<Long> detailNums;
	private List<String> optionValues;

	private Long detailNum2;
	private String optionValue2;
	private List<Long> detailNums2;
	private List<String> optionValues2;
	
	List<Long> attrDtlNums;

	public long getProductNum() {
		return productNum;
	}

	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductClass() {
		return productClass;
	}

	public void setProductClass(int productClass) {
		this.productClass = productClass;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	
	public int getDiscountAmount() {
		return discountAmount;
	}
	
	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
	}

	public int getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(int productStatus) {
		this.productStatus = productStatus;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getSpecies() {
		return species;
	}

	public void setSpecies(int species) {
		this.species = species;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(int parentCategory) {
		this.parentCategory = parentCategory;
	}

	public long getFileNum() {
		return fileNum;
	}

	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}

	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}

	public int getOptionCount() {
		return optionCount;
	}

	public void setOptionCount(int optionCount) {
		this.optionCount = optionCount;
	}

	public Long getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(Long optionNum) {
		this.optionNum = optionNum;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public Long getParentOption() {
		return parentOption;
	}

	public void setParentOption(Long parentOption) {
		this.parentOption = parentOption;
	}

	public Long getOptionNum2() {
		return optionNum2;
	}

	public void setOptionNum2(Long optionNum2) {
		this.optionNum2 = optionNum2;
	}

	public String getOptionName2() {
		return optionName2;
	}

	public void setOptionName2(String optionName2) {
		this.optionName2 = optionName2;
	}

	public Long getDetailNum() {
		return detailNum;
	}

	public void setDetailNum(Long detailNum) {
		this.detailNum = detailNum;
	}

	public String getOptionValue() {
		return optionValue;
	}

	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}

	public List<Long> getDetailNums() {
		return detailNums;
	}

	public void setDetailNums(List<Long> detailNums) {
		this.detailNums = detailNums;
	}

	public List<String> getOptionValues() {
		return optionValues;
	}

	public void setOptionValues(List<String> optionValues) {
		this.optionValues = optionValues;
	}

	public Long getDetailNum2() {
		return detailNum2;
	}

	public void setDetailNum2(Long detailNum2) {
		this.detailNum2 = detailNum2;
	}

	public String getOptionValue2() {
		return optionValue2;
	}

	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}

	public List<Long> getDetailNums2() {
		return detailNums2;
	}

	public void setDetailNums2(List<Long> detailNums2) {
		this.detailNums2 = detailNums2;
	}

	public List<String> getOptionValues2() {
		return optionValues2;
	}

	public void setOptionValues2(List<String> optionValues2) {
		this.optionValues2 = optionValues2;
	}

	public List<Long> getAttrDtlNums() {
		return attrDtlNums;
	}

	public void setAttrDtlNums(List<Long> attrDtlNums) {
		this.attrDtlNums = attrDtlNums;
	}
	
}
