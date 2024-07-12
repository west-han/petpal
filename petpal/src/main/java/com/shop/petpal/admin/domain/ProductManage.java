package com.shop.petpal.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductManage {
	private long productNum;
	private String productName;
	private int productClass;
	private int price;
	private int discountRate;
	private int deliveryCharge;
	private String productDesc;
	private String thumbnail;
	private int productStatus;
	private String regDate;
	private String modifyDate;
	private int species;
	private String origin;
	private String brand;
	private String manufacturer;

	private MultipartFile thumbnailFile;

	private long categoryNum;
	private String categoryName;
	private long parentNum;

	private long imageNum;
	private String imageName;
	private List<MultipartFile> addImages;

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
	private List<MultipartFile> addFiles;
	private int optionCount;

	public int getOptionCount() {
		return optionCount;
	}

	public void setOptionCount(int optionCount) {
		this.optionCount = optionCount;
	}

	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}

	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
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

	private int totalStock;

	public int getTotalStock() {
		return totalStock;
	}

	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}

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

	public int getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
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

	public long getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public long getParentNum() {
		return parentNum;
	}

	public void setParentNum(long parentNum) {
		this.parentNum = parentNum;
	}

	public long getImageNum() {
		return imageNum;
	}

	public void setImageNum(long imageNum) {
		this.imageNum = imageNum;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public List<MultipartFile> getAddImages() {
		return addImages;
	}

	public void setAddImages(List<MultipartFile> addImages) {
		this.addImages = addImages;
	}

	
}
