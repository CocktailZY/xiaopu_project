package com.a2.ssm.model;

public class ShopType {
    private Integer shId;

    private String shName;

    private String shDeposit;

    public Integer getShId() {
        return shId;
    }

    public void setShId(Integer shId) {
        this.shId = shId;
    }

    public String getShName() {
        return shName;
    }

    public void setShName(String shName) {
        this.shName = shName == null ? null : shName.trim();
    }

    public String getShDeposit() {
        return shDeposit;
    }

    public void setShDeposit(String shDeposit) {
        this.shDeposit = shDeposit == null ? null : shDeposit.trim();
    }

	public ShopType(Integer shId, String shName, String shDeposit) {
		super();
		this.shId = shId;
		this.shName = shName;
		this.shDeposit = shDeposit;
	}
	public ShopType() {
		super();
	}
    
}