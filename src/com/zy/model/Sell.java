package com.zy.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * 销售订单
 * @author lenovo
 *
 */
@Entity
@Table
public class Sell implements java.io.Serializable{
	private int id;
	private Customer customer;
	private Users user;
	private int status;
	private String time;
	private String allprice;
	private List<SellInfo> list;
	
	private String goodsn;
	private String nums;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="customerId")
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="userId")
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAllprice() {
		return allprice;
	}
	public void setAllprice(String allprice) {
		this.allprice = allprice;
	}
	@OneToMany(cascade=CascadeType.ALL,mappedBy="sell")
	public List<SellInfo> getList() {
		return list;
	}
	public void setList(List<SellInfo> list) {
		this.list = list;
	}
	@Transient
	public String getGoodsn() {
		return goodsn;
	}
	public void setGoodsn(String goodsn) {
		this.goodsn = goodsn;
	}
	@Transient
	public String getNums() {
		return nums;
	}
	public void setNums(String nums) {
		this.nums = nums;
	}
	
	
	
}