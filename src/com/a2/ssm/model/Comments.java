package com.a2.ssm.model;

public class Comments {
    private Integer commId;

    private String commContent;

    private Integer parentid;

    private Integer commProductid;
    
    private String commTime;
    
    private Integer commUserid;

    private Integer commStar;
    
    private Integer sId;
    
    public Integer getsId() {
		return sId;
	}

	public void setsId(Integer sId) {
		this.sId = sId;
	}

	public Integer getCommStar() {
		return commStar;
	}

	public void setCommStar(Integer commStar) {
		this.commStar = commStar;
	}

	public Integer getCommId() {
        return commId;
    }

    public void setCommId(Integer commId) {
        this.commId = commId;
    }

    public String getCommContent() {
        return commContent;
    }

    public void setCommContent(String commContent) {
        this.commContent = commContent == null ? null : commContent.trim();
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public Integer getCommProductid() {
        return commProductid;
    }

    public void setCommProductid(Integer commProductid) {
        this.commProductid = commProductid;
    }

	public String getCommTime() {
		return commTime;
	}

	public void setCommTime(String commTime) {
		this.commTime = commTime;
	}

	public Integer getCommUserid() {
		return commUserid;
	}

	public void setCommUserid(Integer commUserid) {
		this.commUserid = commUserid;
	}

	@Override
	public String toString() {
		return "Comments [commId=" + commId + ", commContent=" + commContent
				+ ", parentid=" + parentid + ", commProductid=" + commProductid
				+ ", commTime=" + commTime + ", commUserid=" + commUserid + "]";
	}
    
}