package com.zy.model;

import java.io.Serializable;

public class TableChange implements Serializable{

	/**
	 *  序列化
	 */
	private static final long serialVersionUID = -3511939235544316284L;

	private Integer tableId;//交易单id
	
	private Integer fromId;//买家id
	
	private Integer goodId;//商品id
	
	private Integer userId;//卖家id
	
	private String orderTime;//下单时间
	
	private String finishTime;//完成时间
	
	private Integer status;//订单状态 0待确认 1已确认 2已完成
	
	private String mark;//未读标记

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public Integer getTableId() {
		return tableId;
	}

	public void setTableId(Integer tableId) {
		this.tableId = tableId;
	}

	public Integer getFromId() {
		return fromId;
	}

	public void setFromId(Integer fromId) {
		this.fromId = fromId;
	}

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "TableChange [tableId=" + tableId + ", fromId=" + fromId
				+ ", goodId=" + goodId + ", orderTime=" + orderTime
				+ ", finishTime=" + finishTime + ", status=" + status + "]";
	}
	
}
