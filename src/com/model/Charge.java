package com.model;

import java.io.Serializable;

public class Charge implements Serializable{
	//序列化
	private static final long serialVersionUID = 1550118886245783572L;
	//收费规则ID
	private Integer chId;
	//收费规则名称
	private String chName;
	//停车卡类型
	private String chCardtype;
	//单位金额
	private String chUnitprise;
	//时间单位
	private String chUnittime;
	public Integer getChId() {
		return chId;
	}
	public void setChId(Integer chId) {
		this.chId = chId;
	}
	public String getChName() {
		return chName;
	}
	public void setChName(String chName) {
		this.chName = chName;
	}
	public String getChCardtype() {
		return chCardtype;
	}
	public void setChCardtype(String chCardtype) {
		this.chCardtype = chCardtype;
	}
	public String getChUnitprise() {
		return chUnitprise;
	}
	public void setChUnitprise(String chUnitprise) {
		this.chUnitprise = chUnitprise;
	}
	public String getChUnittime() {
		return chUnittime;
	}
	public void setChUnittime(String chUnittime) {
		this.chUnittime = chUnittime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Charge() {
		super();
	}
	public Charge(Integer chId, String chName, String chCardtype,
			String chUnitprise, String chUnittime) {
		super();
		this.chId = chId;
		this.chName = chName;
		this.chCardtype = chCardtype;
		this.chUnitprise = chUnitprise;
		this.chUnittime = chUnittime;
	}
	@Override
	public String toString() {
		return "Charge [chId=" + chId + ", chName=" + chName + ", chCardtype="
				+ chCardtype + ", chUnitprise=" + chUnitprise + ", chUnittime="
				+ chUnittime + "]";
	}
	
	
	
	
}