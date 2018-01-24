package com.zy.model;

import java.io.Serializable;

public class GoodType implements Serializable{

	/**
	 *  序列化
	 */
	private static final long serialVersionUID = 60195038624447394L;

	private Integer goodTypeId;//类型id
	
	private String goodTypeName;//类型名称

	public Integer getGoodTypeId() {
		return goodTypeId;
	}

	public void setGoodTypeId(Integer goodTypeId) {
		this.goodTypeId = goodTypeId;
	}

	public String getGoodTypeName() {
		return goodTypeName;
	}

	public void setGoodTypeName(String goodTypeName) {
		this.goodTypeName = goodTypeName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GoodType [goodTypeId=" + goodTypeId + ", goodTypeName="
				+ goodTypeName + "]";
	}
	
}
