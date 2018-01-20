package com.a2.ssm.model;

public class Images {
    private Integer imId;

    private String imAddress;
    
    private Integer pId;
    
    private Integer commId;
    
    
    public Integer getCommId() {
		return commId;
	}

	public void setCommId(Integer commId) {
		this.commId = commId;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public Integer getImId() {
        return imId;
    }

    public void setImId(Integer imId) {
        this.imId = imId;
    }

    public String getImAddress() {
        return imAddress;
    }

    public void setImAddress(String imAddress) {
        this.imAddress = imAddress == null ? null : imAddress.trim();
    }
}