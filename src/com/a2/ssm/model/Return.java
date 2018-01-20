package com.a2.ssm.model;

public class Return {
    private Integer reId;

    private String reReason;

    private String reContent;

    private Integer reState;

    private String reDate;

    private Integer reOrderdetailid;

    public Integer getReId() {
        return reId;
    }

    public void setReId(Integer reId) {
        this.reId = reId;
    }

    public String getReReason() {
        return reReason;
    }

    public void setReReason(String reReason) {
        this.reReason = reReason == null ? null : reReason.trim();
    }

    public String getReContent() {
        return reContent;
    }

    public void setReContent(String reContent) {
        this.reContent = reContent == null ? null : reContent.trim();
    }

    public Integer getReState() {
        return reState;
    }

    public void setReState(Integer reState) {
        this.reState = reState;
    }

    public String getReDate() {
        return reDate;
    }

    public void setReDate(String reDate) {
        this.reDate = reDate == null ? null : reDate.trim();
    }

    public Integer getReOrderdetailid() {
        return reOrderdetailid;
    }

    public void setReOrderdetailid(Integer reOrderdetailid) {
        this.reOrderdetailid = reOrderdetailid;
    }
}