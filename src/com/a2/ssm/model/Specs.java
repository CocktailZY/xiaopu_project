package com.a2.ssm.model;

public class Specs {
    private Integer spId;

    private String spFications;
    
    private Integer tsId;
    
    

    public Integer getTsId() {
		return tsId;
	}

	public void setTsId(Integer tsId) {
		this.tsId = tsId;
	}

	public Integer getSpId() {
        return spId;
    }

    public void setSpId(Integer spId) {
        this.spId = spId;
    }


    public String getSpFications() {
        return spFications;
    }

    public void setSpFications(String spFications) {
        this.spFications = spFications == null ? null : spFications.trim();
    }

}