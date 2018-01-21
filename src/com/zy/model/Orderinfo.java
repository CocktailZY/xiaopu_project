package com.zy.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 订单详情表
 * @author lenovo
 *
 */
@Entity
@Table(name = "orderdetil")
public class Orderinfo implements java.io.Serializable{

	private int id;// 订单详情编号
	private Goods goods;// 商品对象
	private Order order;// 订单对象
	private String count;// 购买数量
	private String jprice;//商品进价
	private Supplier supplier;//供货商

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "goodId")
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "orderId")
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getJprice() {
		return jprice;
	}

	public void setJprice(String jprice) {
		this.jprice = jprice;
	}
	@OneToOne
	@JoinColumn(name = "supId")
	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	
	
}
