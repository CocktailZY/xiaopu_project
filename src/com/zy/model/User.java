package com.zy.model;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 *  序列化
	 */
	private static final long serialVersionUID = -5702140499922630428L;

	private Integer userId;//用户id
	
	private String userName;//用户名
	
	private String passWord;//密码
	
	private String headImg;//头像地址
	
	private String phone;//手机号
	
	private Integer roleId;//角色id

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", passWord=" + passWord + ", headImg=" + headImg
				+ ", phone=" + phone + ", roleId=" + roleId + "]";
	}
	
	
}
