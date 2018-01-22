package com.a2.ssm.model;

import java.util.List;

import com.a2.ssm.util.Page;

/**
 * 
 * <p>类名：General</p>
 * <p>类功能描述：通用实体类</p>
 * @类作者：luchuan
 * @创建时间：2018-9-2 上午11:16:57
 * @小组：A2小组
 */
public class General {
	private Product product;//商品 id 折扣  名称
	private Specs specs;//规格 价钱
	private ProductSpecs productSpecs;//商品对应规格
	private ProductType productType;//商品类型
	private Brand brand;//品牌
	private Images images;//商品图片 图片
	private List<Images> imagesList;//商品图片
	private TypeSpecs typeSpecs;//类型_规格
	private Page page;
	private String pic;//主页类型的图片
	private String color;//主页类型颜色
	private Shop shop;//店铺
	private Cart cart;//购物车
	private OrderInfo orderInfo;//订单
	private OrderDetail orderDetail;//订单详情
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public OrderInfo getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}
	public OrderDetail getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Specs getSpecs() {
		return specs;
	}
	public void setSpecs(Specs specs) {
		this.specs = specs;
	}
	public ProductSpecs getProductSpecs() {
		return productSpecs;
	}
	public void setProductSpecs(ProductSpecs productSpecs) {
		this.productSpecs = productSpecs;
	}
	public ProductType getProductType() {
		return productType;
	}
	public void setProductType(ProductType productType) {
		this.productType = productType;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Images getImages() {
		return images;
	}
	public void setImages(Images images) {
		this.images = images;
	}
	public List<Images> getImagesList() {
		return imagesList;
	}
	public void setImagesList(List<Images> imagesList) {
		this.imagesList = imagesList;
	}
	public TypeSpecs getTypeSpecs() {
		return typeSpecs;
	}
	public void setTypeSpecs(TypeSpecs typeSpecs) {
		this.typeSpecs = typeSpecs;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}

	
}
