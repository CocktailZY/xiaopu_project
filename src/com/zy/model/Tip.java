package com.zy.model;

import java.io.Serializable;

public class Tip implements Serializable{

	/**
	 *  序列化
	 */
	private static final long serialVersionUID = -9069521758801337706L;

	private Integer tipId;//消息id
	
	private Integer goodId;//商品id
	
	private Integer userId;//用户id
	
	private Integer fromId;//消息来源用户id
	
	private String type;//消息类型
	
	private String createTime;//创建时间
	
	private String mark;//未读标记

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public Integer getTipId() {
		return tipId;
	}

	public void setTipId(Integer tipId) {
		this.tipId = tipId;
	}

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getFromId() {
		return fromId;
	}

	public void setFromId(Integer fromId) {
		this.fromId = fromId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Tip [tipId=" + tipId + ", goodId=" + goodId + ", userId="
				+ userId + ", fromId=" + fromId + ", type=" + type
				+ ", createTime=" + createTime + "]";
	}
	
}
