package com.a2.ssm.model;

public class History {
    private Integer hId;

    private Integer hProductid;

    private Integer hUserid;

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public Integer gethProductid() {
        return hProductid;
    }

    public void sethProductid(Integer hProductid) {
        this.hProductid = hProductid;
    }

    public Integer gethUserid() {
        return hUserid;
    }

    public void sethUserid(Integer hUserid) {
        this.hUserid = hUserid;
    }
}