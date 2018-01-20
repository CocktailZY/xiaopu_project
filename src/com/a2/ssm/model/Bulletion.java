package com.a2.ssm.model;

public class Bulletion {
    private Integer buId;

    private String buContent;

    private String buStart;

    private String buEnd;

    private Integer buCategory;

    private Integer buState;

    private Integer buShopId;

    public Integer getBuId() {
        return buId;
    }

    public void setBuId(Integer buId) {
        this.buId = buId;
    }

    public String getBuContent() {
        return buContent;
    }

    public void setBuContent(String buContent) {
        this.buContent = buContent == null ? null : buContent.trim();
    }

    public String getBuStart() {
        return buStart;
    }

    public void setBuStart(String buStart) {
        this.buStart = buStart == null ? null : buStart.trim();
    }

    public String getBuEnd() {
        return buEnd;
    }

    public void setBuEnd(String buEnd) {
        this.buEnd = buEnd == null ? null : buEnd.trim();
    }

    public Integer getBuCategory() {
        return buCategory;
    }

    public void setBuCategory(Integer buCategory) {
        this.buCategory = buCategory;
    }

    public Integer getBuState() {
        return buState;
    }

    public void setBuState(Integer buState) {
        this.buState = buState;
    }

    public Integer getBuShopId() {
        return buShopId;
    }

    public void setBuShopid(Integer buShopId) {
        this.buShopId = buShopId;
    }

	@Override
	public String toString() {
		return "Bulletion [buId=" + buId + ", buContent=" + buContent
				+ ", buStart=" + buStart + ", buEnd=" + buEnd + ", buCategory="
				+ buCategory + ", buState=" + buState + ", buShopId="
				+ buShopId + "]";
	}
    
}