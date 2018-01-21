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
@Entity
@Table
public class Inventory implements java.io.Serializable{
	private int id;
	private Goods goods;
	private Entrepot entrepot;
	private String num;
	private int status;
	private String jprice;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="goodId")
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="entrepotId")
	public Entrepot getEntrepot() {
		return entrepot;
	}
	public void setEntrepot(Entrepot entrepot) {
		this.entrepot = entrepot;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getJprice() {
		return jprice;
	}
	public void setJprice(String jprice) {
		this.jprice = jprice;
	}
	
	
}

