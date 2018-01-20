package com.a2.ssm.model;

public class User {
    private Integer uId;

    private String uName;

    private String uPwd;

    private String uEmail;

    private String uHead;

    private String uCent;

    private Integer uState;

    private String uCode;

    private Integer uRoleid;

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd == null ? null : uPwd.trim();
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail == null ? null : uEmail.trim();
    }

    public String getuHead() {
        return uHead;
    }

    public void setuHead(String uHead) {
        this.uHead = uHead == null ? null : uHead.trim();
    }

    public String getuCent() {
        return uCent;
    }

    public void setuCent(String uCent) {
        this.uCent = uCent == null ? null : uCent.trim();
    }

    public Integer getuState() {
        return uState;
    }

    public void setuState(Integer uState) {
        this.uState = uState;
    }

    public String getuCode() {
        return uCode;
    }

    public void setuCode(String uCode) {
        this.uCode = uCode == null ? null : uCode.trim();
    }

    public Integer getuRoleid() {
        return uRoleid;
    }

    public void setuRoleid(Integer uRoleid) {
        this.uRoleid = uRoleid;
    }

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uName=" + uName + ", uPwd=" + uPwd
				+ ", uEmail=" + uEmail + ", uHead=" + uHead + ", uCent="
				+ uCent + ", uState=" + uState + ", uCode=" + uCode
				+ ", uRoleid=" + uRoleid + "]";
	}
    
}