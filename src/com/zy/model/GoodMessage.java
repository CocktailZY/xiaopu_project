package com.zy.model;

import java.io.Serializable;

public class GoodMessage implements Serializable{

	/**
	 *  序列化
	 */
	private static final long serialVersionUID = -7631953807068480349L;
	
	private Integer msgId;//留言id
	
	private Integer parentMsgId;//父留言id
	
	private String msgContent;//留言信息
	
	private String insertTime;//插入时间
	
	private Integer goodId;//商品id
	
	private Integer userId;//所属用户id
	
	private String mark;//未读标志

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

	public Integer getMsgId() {
		return msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	public Integer getParentMsgId() {
		return parentMsgId;
	}

	public void setParentMsgId(Integer parentMsgId) {
		this.parentMsgId = parentMsgId;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(String insertTime) {
		this.insertTime = insertTime;
	}

	public Integer getGoodId() {
		return goodId;
	}

	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}

	@Override
	public String toString() {
		return "GoodMessage [msgId=" + msgId + ", parentMsgId=" + parentMsgId
				+ ", msgContent=" + msgContent + ", insertTime=" + insertTime
				+ ", goodId=" + goodId + "]";
	}
	
}
