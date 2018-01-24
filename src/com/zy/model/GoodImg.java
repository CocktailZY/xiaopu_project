package com.zy.model;

import java.io.Serializable;

public class GoodImg implements Serializable{

	/**
	 *  序列化
	 */
	private static final long serialVersionUID = -7354674261249066298L;

	private Integer imgId;//图片id
	
	private String imgUrl;//图片地址
	
	private Integer goodId;//商品id

	public Integer getImgId() {
		return imgId;
	}

	public void setImgId(Integer imgId) {
		this.imgId = imgId;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GoodImg [imgId=" + imgId + ", imgUrl=" + imgUrl + ", goodId="
				+ goodId + "]";
	}
	
	
}
