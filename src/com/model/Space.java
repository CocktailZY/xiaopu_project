package com.model;

import java.io.Serializable;

public class Space implements Serializable{
	//序列化
	private static final long serialVersionUID = 1550118886245783572L;
	//车位ID
	private Integer sId;
	//所属区块
	private String sZone;
	//停靠车牌号
	private String sPlatenumber;
	//车位状态
	private String sState;
	//车位编号
	private Integer sNumber;
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
	public String getsZone() {
		return sZone;
	}
	public void setsZone(String sZone) {
		this.sZone = sZone;
	}
	public String getsPlatenumber() {
		return sPlatenumber;
	}
	public void setsPlatenumber(String sPlatenumber) {
		this.sPlatenumber = sPlatenumber;
	}
	public String getsState() {
		return sState;
	}
	public void setsState(String sState) {
		this.sState = sState;
	}
	public Integer getsNumber() {
		return sNumber;
	}
	public void setsNumber(Integer sNumber) {
		this.sNumber = sNumber;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Space(Integer sId, String sZone, String sPlatenumber, String sState,
			Integer sNumber) {
		super();
		this.sId = sId;
		this.sZone = sZone;
		this.sPlatenumber = sPlatenumber;
		this.sState = sState;
		this.sNumber = sNumber;
	}
	public Space() {
		super();
	}
	@Override
	public String toString() {
		return "Space [sId=" + sId + ", sZone=" + sZone + ", sPlatenumber="
				+ sPlatenumber + ", sState=" + sState + ", sNumber=" + sNumber
				+ "]";
	}
	
	
	
}