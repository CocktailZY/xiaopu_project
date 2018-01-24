package com.zy.model;

import java.io.Serializable;

public class Role implements Serializable{

	/**
	 *  序列化
	 */
	private static final long serialVersionUID = 3495190735119786644L;

	private Integer roleId;//角色id
	
	private String roleName;//角色名称

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + "]";
	}
	
}
