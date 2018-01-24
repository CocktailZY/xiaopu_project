package com.zy.model;

import java.io.Serializable;

public class CartExtend implements Serializable{

	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 8106588769118247013L;
	private Good goodObj;
	private User userObj;
	private Cart cartObj;
	public Cart getCartObj() {
		return cartObj;
	}
	public void setCartObj(Cart cartObj) {
		this.cartObj = cartObj;
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
	
}
