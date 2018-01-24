package com.zy.model;

import java.io.Serializable;

public class GuideExpand implements Serializable{

	/**
	 *  序列号
	 */
	private static final long serialVersionUID = -8942909902779253052L;

	private Good goodObj;
	private ShopGuide guideObj;
	public Good getGoodObj() {
		return goodObj;
	}
	public void setGoodObj(Good goodObj) {
		this.goodObj = goodObj;
	}
	public ShopGuide getGuideObj() {
		return guideObj;
	}
	public void setGuideObj(ShopGuide guideObj) {
		this.guideObj = guideObj;
	}
	
}
