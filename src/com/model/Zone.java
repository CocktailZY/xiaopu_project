package com.model;

import java.io.Serializable;

public class Zone implements Serializable{
	//序列化
	private static final long serialVersionUID = 1550118886245783572L;
	//区块ID
	private Integer zId;
	//区块名称
	private String zName;
	
	public Integer getzId() {
		return zId;
	}

	public void setzId(Integer zId) {
		this.zId = zId;
	}

	public String getzName() {
		return zName;
	}

	public void setzName(String zName) {
		this.zName = zName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	//无参构造
	public Zone() {
		super();
	}
	//有参构造
	public Zone(Integer zId, String zName) {
		super();
		this.zId = zId;
		this.zName = zName;
	}

	@Override
	public String toString() {
		return "Zone [zId=" + zId + ", zName=" + zName + "]";
	}
	
}