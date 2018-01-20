package com.a2.ssm.model;

public class CloseShop {
    private Integer csId;

    private String csContent;

    private Integer csState;

    private Integer csUserid;

    public Integer getCsId() {
        return csId;
    }

    public void setCsId(Integer csId) {
        this.csId = csId;
    }

    public String getCsContent() {
        return csContent;
    }

    public void setCsContent(String csContent) {
        this.csContent = csContent == null ? null : csContent.trim();
    }

    public Integer getCsState() {
        return csState;
    }

    public void setCsState(Integer csState) {
        this.csState = csState;
    }

    public Integer getCsUserid() {
        return csUserid;
    }

    public void setCsUserid(Integer csUserid) {
        this.csUserid = csUserid;
    }
}