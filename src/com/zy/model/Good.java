package com.zy.model;

import java.io.Serializable;

public class Good implements Serializable{
	
	/**
	 *  序列化
	 */
	private static final long serialVersionUID = -6104349866192534942L;

	private Integer goodId;//商品id
	
	private String goodName;//商品名称
	
	private String price;//价格
	
	private String content;//描述
	
	private String onTime;//上架时间
	
	private Integer status;//商品状态 1在售 0已售
	
	private Integer goodTypeId;//商品类型id
	
	private Integer userId;//买家id

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOnTime() {
		return onTime;
	}

	public void setOnTime(String onTime) {
		this.onTime = onTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getGoodTypeId() {
		return goodTypeId;
	}

	public void setGoodTypeId(Integer goodTypeId) {
		this.goodTypeId = goodTypeId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Good [goodId=" + goodId + ", goodName=" + goodName + ", price="
				+ price + ", content=" + content + ", onTime=" + onTime
				+ ", status=" + status + ", goodTypeId=" + goodTypeId
				+ ", userId=" + userId + "]";
	}
	
	

}
