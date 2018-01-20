package com.a2.ssm.model;

public class RoleUser {
    private Integer id;

    private Integer ruUserid;

    private Integer ruRoleid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRuUserid() {
        return ruUserid;
    }

    public void setRuUserid(Integer ruUserid) {
        this.ruUserid = ruUserid;
    }

    public Integer getRuRoleid() {
        return ruRoleid;
    }

    public void setRuRoleid(Integer ruRoleid) {
        this.ruRoleid = ruRoleid;
    }
}