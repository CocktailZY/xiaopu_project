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

/**
 * 订单
 * @author lenovo
 *
 */
@Entity
@Table(name="orderinfo")
public class Order implements java.io.Serializable{
	private int id;
	private Users user;
	private int status;
	private OrderType orderType;
	private String orderTime;
	private String count;
	private List<Orderinfo> orderinfo;
	private String price;//计算售价
	private String num;
	private String name;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="orderTypeId")
	public OrderType getOrderType() {
		return orderType;
	}
	public void setOrderType(OrderType orderType) {
		this.orderType = orderType;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="userId")
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	@Transient
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@OneToMany(cascade=CascadeType.ALL,mappedBy="order")
	public List<Orderinfo> getOrderinfo() {
		return orderinfo;
	}
	public void setOrderinfo(List<Orderinfo> orderinfo) {
		this.orderinfo = orderinfo;
	}
	@Transient
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Transient
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	@Transient
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}

