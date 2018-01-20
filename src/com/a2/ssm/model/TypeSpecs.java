package com.a2.ssm.model;

public class TypeSpecs {
    private Integer tsId;

    private String tsTitle;

    private Integer tsProducttypeid;

    public Integer getTsId() {
        return tsId;
    }

    public void setTsId(Integer tsId) {
        this.tsId = tsId;
    }

    public String getTsTitle() {
        return tsTitle;
    }

    public void setTsTitle(String tsTitle) {
        this.tsTitle = tsTitle == null ? null : tsTitle.trim();
    }

    public Integer getTsProducttypeid() {
        return tsProducttypeid;
    }

    public void setTsProducttypeid(Integer tsProducttypeid) {
        this.tsProducttypeid = tsProducttypeid;
    }
}