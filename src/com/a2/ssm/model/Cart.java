package com.a2.ssm.model;

public class Cart {
    private Integer cId;

    private String cNum;

    private String cCreatetime;

    private Integer cProductid;

    private Integer cUserid;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcNum() {
        return cNum;
    }

    public void setcNum(String cNum) {
        this.cNum = cNum == null ? null : cNum.trim();
    }

    public String getcCreatetime() {
        return cCreatetime;
    }

    public void setcCreatetime(String cCreatetime) {
        this.cCreatetime = cCreatetime == null ? null : cCreatetime.trim();
    }

    public Integer getcProductid() {
        return cProductid;
    }

    public void setcProductid(Integer cProductid) {
        this.cProductid = cProductid;
    }

    public Integer getcUserid() {
        return cUserid;
    }

    public void setcUserid(Integer cUserid) {
        this.cUserid = cUserid;
    }
}