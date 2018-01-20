package com.a2.ssm.model;

public class Product {
    private Integer pId;

    private String pName;

    private String pContent;//商品描述

    private String pDiscount;//商品折扣

    private String pOntime;//商品上架时间

    private Integer pNew;//商品新品状态

    private Integer pSpecial;//特价状态

    private Integer pOnstate;//商品上架状态

    private Integer pTypeid;//商品类型ID

    private Integer pShopid;//商品店铺ID

    private Integer pPicid;//商品图片ID

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent == null ? null : pContent.trim();
    }

    public String getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(String pDiscount) {
        this.pDiscount = pDiscount == null ? null : pDiscount.trim();
    }

    public String getpOntime() {
        return pOntime;
    }

    public void setpOntime(String pOntime) {
        this.pOntime = pOntime == null ? null : pOntime.trim();
    }

    public Integer getpNew() {
        return pNew;
    }

    public void setpNew(Integer pNew) {
        this.pNew = pNew;
    }

    public Integer getpSpecial() {
        return pSpecial;
    }

    public void setpSpecial(Integer pSpecial) {
        this.pSpecial = pSpecial;
    }

    public Integer getpOnstate() {
        return pOnstate;
    }

    public void setpOnstate(Integer pOnstate) {
        this.pOnstate = pOnstate;
    }

    public Integer getpTypeid() {
        return pTypeid;
    }

    public void setpTypeid(Integer pTypeid) {
        this.pTypeid = pTypeid;
    }

    public Integer getpShopid() {
        return pShopid;
    }

    public void setpShopid(Integer pShopid) {
        this.pShopid = pShopid;
    }

    public Integer getpPicid() {
        return pPicid;
    }

    public void setpPicid(Integer pPicid) {
        this.pPicid = pPicid;
    }
}