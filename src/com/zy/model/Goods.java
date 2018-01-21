package com.zy.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table
public class Goods implements java.io.Serializable{
	
	private int id;//商品id
	private String goodName;//商品名称
	private String price;//售价
	private int onNum;//上架数量
	private String discount;//折扣
	private int status;//商品状态(上架，未上架)
	private String goodsn;
	@Transient
	public String getGoodsn() {
		return goodsn;
	}
	public void setGoodsn(String goodsn) {
		this.goodsn = goodsn;
	}
	private GoodsType goodType;//商品类型
	private Supplier supplier;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getOnNum() {
		return onNum;
	}
	public void setOnNum(int onNum) {
		this.onNum = onNum;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@ManyToOne(cascade={CascadeType.MERGE})
	@JoinColumn(name="typeId",referencedColumnName="id")
	public GoodsType getGoodType() {
		return goodType;
	}
	public void setGoodType(GoodsType goodType) {
		this.goodType = goodType;
	}
	@ManyToOne(cascade={CascadeType.MERGE})
	@JoinColumn(name="supId",referencedColumnName="id")
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	

}