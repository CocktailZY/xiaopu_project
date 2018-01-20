package com.a2.ssm.model;

public class Complaint {
    private Integer coId;//投诉id

    private String coTitle;//投诉标题

    private String coContent;//投诉内容

    private String coUsername;//被投诉人用户名
    
    private String coCreattime;//投诉创建时间

    private Integer coState;//投诉状态

    private Integer coUserid;//投诉人id
    
    public Integer getCoId() {
        return coId;
    }

    public void setCoId(Integer coId) {
        this.coId = coId;
    }

    public String getCoTitle() {
        return coTitle;
    }

    public void setCoTitle(String coTitle) {
        this.coTitle = coTitle == null ? null : coTitle.trim();
    }

    public String getCoContent() {
        return coContent;
    }

    public void setCoContent(String coContent) {
        this.coContent = coContent == null ? null : coContent.trim();
    }

    public String getCoUsername() {
        return coUsername;
    }

    public void setCoUsername(String coUsername) {
        this.coUsername = coUsername == null ? null : coUsername.trim();
    }

    public Integer getCoState() {
        return coState;
    }

    public void setCoState(Integer coState) {
        this.coState = coState;
    }

    public Integer getCoUserid() {
        return coUserid;
    }

    public void setCoUserid(Integer coUserid) {
        this.coUserid = coUserid;
    }

	public String getCoCreattime() {
		return coCreattime;
	}

	public void setCoCreattime(String coCreattime) {
		this.coCreattime = coCreattime;
	}

	
    
}