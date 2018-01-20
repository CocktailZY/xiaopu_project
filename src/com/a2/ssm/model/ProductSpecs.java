package com.a2.ssm.model;

public class ProductSpecs {
	private Integer psId;//ID
	private Integer spId;//规格详情ID
	private String psColor;//商品颜色
	private String psPrice;//商品单价
	private String psNum;//商品数量
	private Integer pId;//商品ID
	private Integer tsId;//规格ID
	
	public Integer getTsId() {
		return tsId;
	}
	public void setTsId(Integer tsId) {
		this.tsId = tsId;
	}
	public Integer getPsId() {
		return psId;
	}
	public void setPsId(Integer psId) {
		this.psId = psId;
	}
	public Integer getSpId() {
		return spId;
	}
	public void setSpId(Integer spId) {
		this.spId = spId;
	}
	public String getPsColor() {
		return psColor;
	}
	public void setPsColor(String psColor) {
		this.psColor = psColor;
	}
	public String getPsPrice() {
		return psPrice;
	}
	public void setPsPrice(String psPrice) {
		this.psPrice = psPrice;
	}
	public String getPsNum() {
		return psNum;
	}
	public void setPsNum(String psNum) {
		this.psNum = psNum;
	}
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	
}
