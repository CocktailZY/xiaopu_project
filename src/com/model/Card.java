package com.model;

import java.io.Serializable;

public class Card implements Serializable{
	//序列化
	private static final long serialVersionUID = 1550118886245783572L;
	//停车卡ID
	private Integer cId;
	//停车卡号
	private String cNumber;
	//车牌号
	private String cPlatenumber;
	//开始时间
	private String cStarttime;
	//截止时间
	private String cEndtime;
	//余额
	private String cMoney;
	//停车卡类型
	private String cType;
	//停车卡属主
	private String cUser;
	//属主电话
	private String cTel;
	
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public String getcNumber() {
		return cNumber;
	}
	public void setcNumber(String cNumber) {
		this.cNumber = cNumber;
	}
	public String getcPlatenumber() {
		return cPlatenumber;
	}
	public void setcPlatenumber(String cPlatenumber) {
		this.cPlatenumber = cPlatenumber;
	}
	public String getcStarttime() {
		return cStarttime;
	}
	public void setcStarttime(String cStarttime) {
		this.cStarttime = cStarttime;
	}
	public String getcEndtime() {
		return cEndtime;
	}
	public void setcEndtime(String cEndtime) {
		this.cEndtime = cEndtime;
	}
	public String getcMoney() {
		return cMoney;
	}
	public void setcMoney(String cMoney) {
		this.cMoney = cMoney;
	}
	public String getcType() {
		return cType;
	}
	public void setcType(String cType) {
		this.cType = cType;
	}
	public String getcUser() {
		return cUser;
	}
	public void setcUser(String cUser) {
		this.cUser = cUser;
	}
	public String getcTel() {
		return cTel;
	}
	public void setcTel(String cTel) {
		this.cTel = cTel;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	//无参构造
	public Card() {
		super();
	}
	//有参构造
	public Card(Integer cId, String cNumber, String cPlatenumber,
			String cStarttime, String cEndtime, String cMoney, String cType,
			String cUser, String cTel) {
		super();
		this.cId = cId;
		this.cNumber = cNumber;
		this.cPlatenumber = cPlatenumber;
		this.cStarttime = cStarttime;
		this.cEndtime = cEndtime;
		this.cMoney = cMoney;
		this.cType = cType;
		this.cUser = cUser;
		this.cTel = cTel;
	}
	@Override
	public String toString() {
		return "Card [cId=" + cId + ", cNumber=" + cNumber + ", cPlatenumber="
				+ cPlatenumber + ", cStarttime=" + cStarttime + ", cEndtime="
				+ cEndtime + ", cMoney=" + cMoney + ", cType=" + cType
				+ ", cUser=" + cUser + ", cTel=" + cTel + "]";
	}
	
	
}