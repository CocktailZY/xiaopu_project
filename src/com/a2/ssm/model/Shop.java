package com.a2.ssm.model;

public class Shop {
    private Integer sId;

    private String sName;

    private Integer sState;

    private Integer sShoptypeid;

    private Integer sUserid;
    
    private Integer sCredit;
    
    private Integer sGrade;

	public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public Integer getsCredit() {
		return sCredit;
	}

	public void setsCredit(Integer sCredit) {
		this.sCredit = sCredit;
	}

	public Integer getsGrade() {
		return sGrade;
	}

	public void setsGrade(Integer sGrade) {
		this.sGrade = sGrade;
	}

	public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public Integer getsState() {
        return sState;
    }

    public void setsState(Integer sState) {
        this.sState = sState;
    }

    public Integer getsShoptypeid() {
        return sShoptypeid;
    }

    public void setsShoptypeid(Integer sShoptypeid) {
        this.sShoptypeid = sShoptypeid;
    }

    public Integer getsUserid() {
        return sUserid;
    }

    public void setsUserid(Integer sUserid) {
        this.sUserid = sUserid;
    }


	public Shop(Integer sId, String sName, Integer sState, Integer sShoptypeid,
			Integer sUserid, Integer sCredit, Integer sGrade) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.sState = sState;
		this.sShoptypeid = sShoptypeid;
		this.sUserid = sUserid;
		this.sCredit = sCredit;
		this.sGrade = sGrade;
	}

	public Shop() {
		// TODO Auto-generated constructor stub
	}
}