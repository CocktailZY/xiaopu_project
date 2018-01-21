package com.zy.dao;

import java.util.List;

import com.zy.model.Car;

public interface ICarDao {
	/**
	 * 增加购物车信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Car dto);
	/**
	 * 修改购物车信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Car dto);
	/**
	 * 删除购物车信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Car dto);
	/**
	 * 根据id查询购物车信息
	 * @param id
	 * @return
	 */
	public Car get(int id);
	/**
	 * 查询购物车信息
	 * @return
	 */
	public List<Car> list(Car dto);
	
	/**
	 * 通过用户id查找
	 * @param userId
	 * @return
	 */
	public List<Car> listByUserId(int userId);
	
	/**
	 * 通过客户id查找
	 * @param userId
	 * @return
	 */
	public List<Car> listByCusId(int cusId);
}
