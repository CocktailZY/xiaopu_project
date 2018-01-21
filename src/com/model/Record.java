package com.model;

import java.io.Serializable;

public class Record implements Serializable{
	//序列化
	private static final long serialVersionUID = 1550118886245783572L;
	//记录ID
	private Integer rId;
	//车牌号
	private String rPlatenumber;
	//用户类型
	private String rCardtype;
	//驾驶人
	private String rUser;
	//停靠车位
	private String rParking;
	//开始时间
	private String rStarttime;
	//截止时间
	private String rEndtime;
	//金额
	private String rPrise;
	//支付状态
	private String rPriseType;
	
	public String getrPriseType() {
		return rPriseType;
	}
	public void setrPriseType(String rPriseType) {
		this.rPriseType = rPriseType;
	}
	public Integer getrId() {
		return rId;
	}
	public void setrId(Integer rId) {
		this.rId = rId;
	}
	public String getrPlatenumber() {
		return rPlatenumber;
	}
	public void setrPlatenumber(String rPlatenumber) {
		this.rPlatenumber = rPlatenumber;
	}
	public String getrCardtype() {
		return rCardtype;
	}
	public void setrCardtype(String rCardtype) {
		this.rCardtype = rCardtype;
	}
	public String getrUser() {
		return rUser;
	}
	public void setrUser(String rUser) {
		this.rUser = rUser;
	}
	public String getrParking() {
		return rParking;
	}
	public void setrParking(String rParking) {
		this.rParking = rParking;
	}
	public String getrStarttime() {
		return rStarttime;
	}
	public void setrStarttime(String rStarttime) {
		this.rStarttime = rStarttime;
	}
	public String getrEndtime() {
		return rEndtime;
	}
	public void setrEndtime(String rEndtime) {
		this.rEndtime = rEndtime;
	}
	public String getrPrise() {
		return rPrise;
	}
	public void setrPrise(String rPrise) {
		this.rPrise = rPrise;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	//无参构造
	public Record() {
		super();
	}
	//有参构造
	public Record(Integer rId, String rPlatenumber, String rCardtype,
			String rUser, String rParking, String rStarttime, String rEndtime,
			String rPrise, String rPriseType) {
		super();
		this.rId = rId;
		this.rPlatenumber = rPlatenumber;
		this.rCardtype = rCardtype;
		this.rUser = rUser;
		this.rParking = rParking;
		this.rStarttime = rStarttime;
		this.rEndtime = rEndtime;
		this.rPrise = rPrise;
		this.rPriseType = rPriseType;
	}
	@Override
	public String toString() {
		return "Record [rId=" + rId + ", rPlatenumber=" + rPlatenumber
				+ ", rCardtype=" + rCardtype + ", rUser=" + rUser
				+ ", rParking=" + rParking + ", rStarttime=" + rStarttime
				+ ", rEndtime=" + rEndtime + ", rPrise=" + rPrise
				+ ", rPriseType=" + rPriseType + "]";
	}
	
}