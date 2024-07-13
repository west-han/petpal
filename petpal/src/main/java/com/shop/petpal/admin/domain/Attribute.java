package com.shop.petpal.admin.domain;

public class Attribute {
	private long attributeNum;
	private String attributeName;
	private int categoryNum;
	private long attrDtlNum;
	private String attrDtlName;

	public long getAttributeNum() {
		return attributeNum;
	}

	public void setAttributeNum(long attributeNum) {
		this.attributeNum = attributeNum;
	}

	public String getAttributeName() {
		return attributeName;
	}

	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public long getAttrDtlNum() {
		return attrDtlNum;
	}

	public void setAttrDtlNum(long attrDtlNum) {
		this.attrDtlNum = attrDtlNum;
	}

	public String getAttrDtlName() {
		return attrDtlName;
	}

	public void setAttrDtlName(String attrDtlName) {
		this.attrDtlName = attrDtlName;
	}

}
