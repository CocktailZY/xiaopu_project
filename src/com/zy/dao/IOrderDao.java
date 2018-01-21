package com.zy.dao;

import java.util.List;

import com.zy.model.Order;
import com.zy.util.PageUtil;

public interface IOrderDao {
	/**
	 * 增加订单信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Order dto);
	/**
	 * 修改订单信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Order dto);
	/**
	 * 删除订单信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Order dto);
	/**
	 * 根据id查询订单信息
	 * @param id
	 * @return
	 */
	public Order get(int id);
	/**
	 * 查询订单信息
	 * @return
	 */
	public List<Order> list(Order dto);
	/**
	 * 根据订单类型查询
	 * @param id
	 * @return
	 */
	public List<Order> listByTypeId(int id,int userId);
	/**
	 * 根据订单类型查询
	 * @param id
	 * @return
	 */
	public List<Order> listByType(int id);
	
	/**
	 * 分页查询总记录数
	 * @param hql
	 * @return
	 */
	public int count(String hql);
	/**
	 * 分页查询
	 * @param hql
	 * @param pageNum
	 * @param row
	 * @return
	 */
	public List<Order> listPage(String hql,int pageNum,int row);
}
