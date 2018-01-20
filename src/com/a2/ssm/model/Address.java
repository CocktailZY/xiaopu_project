package com.a2.ssm.model;

public class Address {
	private Integer addId;

	private String addTel;

	private String addName;

	private String address;

	private Integer addUserid;
	
	private Integer addState;

	public Integer getAddId() {
		return addId;
	}

	public void setAddId(Integer addId) {
		this.addId = addId;
	}

	public String getAddTel() {
		return addTel;
	}

	public void setAddTel(String addTel) {
		this.addTel = addTel == null ? null : addTel.trim();
	}

	public String getAddName() {
		return addName;
	}

	public void setAddName(String addName) {
		this.addName = addName == null ? null : addName.trim();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public Integer getAddUserid() {
		return addUserid;
	}

	public void setAddUserid(Integer addUserid) {
		this.addUserid = addUserid;
	}

	public Integer getAddState() {
		return addState;
	}

	public void setAddState(Integer addState) {
		this.addState = addState;
	}

	@Override
	public String toString() {
		return "Address [addId=" + addId + ", addTel=" + addTel + ", addName="
				+ addName + ", address=" + address + ", addUserid=" + addUserid
				+ ", addState=" + addState + "]";
	}

	
}