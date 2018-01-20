package com.a2.ssm.model;

public class Role {
    private Integer roId;

    private String roName;

    public Integer getRoId() {
        return roId;
    }

    public void setRoId(Integer roId) {
        this.roId = roId;
    }

    public String getRoName() {
        return roName;
    }

    public void setRoName(String roName) {
        this.roName = roName == null ? null : roName.trim();
    }
}