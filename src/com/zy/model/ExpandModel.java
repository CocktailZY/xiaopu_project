package com.zy.model;

import java.io.Serializable;


public class ExpandModel implements Serializable{
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 411114110484867438L;

	private Good goodObj;//商品对象
	
	private GoodType typeObj;//商品类型对象
	
	private GoodImg imgObj;//商品图片对象

	private String imgClass;//类型图标
	
	private GoodMessage msgObj;//留言对象
	
	private User userObj;//用户对象
	
	private Tip tipObj;//消息对象
	
	private TableChange tabObj;//交易单对象
	
	private Role roleObj;//角色对象
	
	
	public GoodImg getImgObj() {
		return imgObj;
	}

	public void setImgObj(GoodImg imgObj) {
		this.imgObj = imgObj;
	}

	public Role getRoleObj() {
		return roleObj;
	}

	public void setRoleObj(Role roleObj) {
		this.roleObj = roleObj;
	}

	public TableChange getTabObj() {
		return tabObj;
	}

	public void setTabObj(TableChange tabObj) {
		this.tabObj = tabObj;
	}

	public Tip getTipObj() {
		return tipObj;
	}

	public void setTipObj(Tip tipObj) {
		this.tipObj = tipObj;
	}

	public Good getGoodObj() {
		return goodObj;
	}

	public void setGoodObj(Good goodObj) {
		this.goodObj = goodObj;
	}

	public User getUserObj() {
		return userObj;
	}

	public void setUserObj(User userObj) {
		this.userObj = userObj;
	}

	public GoodMessage getMsgObj() {
		return msgObj;
	}

	public void setMsgObj(GoodMessage msgObj) {
		this.msgObj = msgObj;
	}

	public GoodType getTypeObj() {
		return typeObj;
	}

	public void setTypeObj(GoodType typeObj) {
		this.typeObj = typeObj;
	}

	public String getImgClass() {
		return imgClass;
	}

	public void setImgClass(String imgClass) {
		this.imgClass = imgClass;
	}


}
