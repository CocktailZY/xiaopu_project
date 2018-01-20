package com.a2.ssm.model;

public class OrderDetail {
    private Integer odId;

    private String odNum;

    private String odTotal;

    private Integer odOrderid;

    private Integer odProductid;
    
    private Integer psId;
    
    private Integer commState;
    



	public Integer getCommState() {
		return commState;
	}

	public void setCommState(Integer commState) {
		this.commState = commState;
	}

	public Integer getPsId() {
		return psId;
	}

	public void setPsId(Integer psId) {
		this.psId = psId;
	}

	public Integer getOdId() {
        return odId;
    }

    public void setOdId(Integer odId) {
        this.odId = odId;
    }

    public String getOdNum() {
        return odNum;
    }

    public void setOdNum(String odNum) {
        this.odNum = odNum == null ? null : odNum.trim();
    }

    public String getOdTotal() {
        return odTotal;
    }

    public void setOdTotal(String odTotal) {
        this.odTotal = odTotal == null ? null : odTotal.trim();
    }

    public Integer getOdOrderid() {
        return odOrderid;
    }

    public void setOdOrderid(Integer odOrderid) {
        this.odOrderid = odOrderid;
    }

    public Integer getOdProductid() {
        return odProductid;
    }

    public void setOdProductid(Integer odProductid) {
        this.odProductid = odProductid;
    }
}