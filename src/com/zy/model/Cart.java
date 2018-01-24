package com.zy.model;

import java.io.Serializable;

public class Cart implements Serializable{

	/**
	 *  序列化
	 */
	private static final long serialVersionUID = 5442292976883148002L;
	
	private Integer id;//id
	
	private Integer num;//数量
	
	private String total;//总计
	
	private Integer goodId;//商品id
	
	private Integer userId;//登录人用户

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
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

	@Override
	public String toString() {
		return "Cart [id=" + id + ", num=" + num + ", total=" + total
				+ ", goodId=" + goodId + ", userId=" + userId + "]";
	}
	
	

}
