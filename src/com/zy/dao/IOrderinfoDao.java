package com.zy.dao;

import java.util.List;

import com.zy.model.Order;
import com.zy.model.Orderinfo;

public interface IOrderinfoDao {

	/**
	 * 增加订单详情信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Orderinfo dto);
	/**
	 * 修改订单详情信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Orderinfo dto);
	/**
	 * 删除订单详情信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Orderinfo dto);
	/**
	 * 根据id查询订单详情信息
	 * @param id
	 * @return
	 */
	public Orderinfo get(int id);
	/**
	 * 查询订单详情信息
	 * @return
	 */
	public List<Orderinfo> list(Orderinfo dto);
	/**
	 * 根据orderId查询订单详情信息
	 * @return
	 */
	public List<Orderinfo> listByOrder(int id);
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
	public List<Orderinfo> listPage(String hql,int pageNum,int row);
	
}
	

