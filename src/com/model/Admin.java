package com.model;

import java.io.Serializable;

public class Admin implements Serializable{
	//序列化
	private static final long serialVersionUID = 1550118886245783572L;
	//管理员ID
	private Integer aId;
	//管理员名
	private String aName;
	//管理员密码
	private String aPwd;

	
	public Integer getaId() {
		return aId;
	}

	public void setaId(Integer aId) {
		this.aId = aId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaPwd() {
		return aPwd;
	}

	public void setaPwd(String aPwd) {
		this.aPwd = aPwd;
	}

	//无参构造方法
	public Admin() {
		super();
	}

	//有参构造方法
	public Admin(Integer aId, String aName, String aPwd) {
		super();
		this.aId = aId;
		this.aName = aName;
		this.aPwd = aPwd;
	}

	@Override
	public String toString() {
		return "Admin [aId=" + aId + ", aName=" + aName + ", aPwd=" + aPwd
				+ "]";
	}	
}