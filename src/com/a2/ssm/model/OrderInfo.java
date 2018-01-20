package com.a2.ssm.model;

public class OrderInfo {
    private Integer oId;

    private String oStime;

    private Integer oState;

    private String oTotal;

    private String oFtime;

    private Integer oUserid;

    private Integer oShopid;

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public String getoStime() {
        return oStime;
    }

    public void setoStime(String oStime) {
        this.oStime = oStime == null ? null : oStime.trim();
    }

    public Integer getoState() {
        return oState;
    }

    public void setoState(Integer oState) {
        this.oState = oState;
    }

    public String getoTotal() {
        return oTotal;
    }

    public void setoTotal(String oTotal) {
        this.oTotal = oTotal == null ? null : oTotal.trim();
    }

    public String getoFtime() {
        return oFtime;
    }

    public void setoFtime(String oFtime) {
        this.oFtime = oFtime == null ? null : oFtime.trim();
    }

    public Integer getoUserid() {
        return oUserid;
    }

    public void setoUserid(Integer oUserid) {
        this.oUserid = oUserid;
    }

    public Integer getoShopid() {
        return oShopid;
    }

    public void setoShopid(Integer oShopid) {
        this.oShopid = oShopid;
    }
}