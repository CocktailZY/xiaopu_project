package com.a2.ssm.model;

public class Brand {
    private Integer bId;

    private String bName;
    
    private Integer ptId;

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName == null ? null : bName.trim();
    }

	public Integer getPtId() {
		return ptId;
	}

	public void setPtId(Integer ptId) {
		this.ptId = ptId;
	}
    
}