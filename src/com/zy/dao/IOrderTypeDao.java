package com.zy.dao;

import java.util.List;

import com.zy.model.OrderType;


public interface IOrderTypeDao {

	/**
	 * 增加订单类型信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(OrderType dto);
	/**
	 * 修改订单类型信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(OrderType dto);
	/**
	 * 删除订单类型信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(OrderType dto);
	/**
	 * 根据id查询订单类型信息
	 * @param id
	 * @return
	 */
	public OrderType get(int id);
	/**
	 * 查询订单类型信息
	 * @return
	 */
	public List<OrderType> list(OrderType dto);
	
}
