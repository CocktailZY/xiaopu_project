package com.zy.model;

import java.io.Serializable;

public class ShopGuide implements Serializable{

	/**
	 *  序列化
	 */
	private static final long serialVersionUID = 3250489477179743742L;

	private Integer guideId;//指南id
	
	private String guideContent;//指南内容
	
	private Integer status;//审核状态
	
	private Integer userId;//用户id
	
	private Integer goodId;//商品id
	
	private String mark;//展示状态

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getGuideId() {
		return guideId;
	}

	public void setGuideId(Integer guideId) {
		this.guideId = guideId;
	}

	public String getGuideContent() {
		return guideContent;
	}

	public void setGuideContent(String guideContent) {
		this.guideContent = guideContent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ShopGuide [guideId=" + guideId + ", guideContent="
				+ guideContent + "]";
	}
	
}
