package com.zy.dao;

import java.util.List;

import com.zy.model.Customer;


public interface ICustomerDao {
	/**
	 * 增加顾客信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Customer dto);
	/**
	 * 修改顾客信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Customer dto);
	/**
	 * 删除顾客信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Customer dto);
	/**
	 * 根据id查询顾客信息
	 * @param id
	 * @return
	 */
	public Customer get(int id);
	/**
	 * 查询顾客信息
	 * @return
	 */
	public List<Customer> list(Customer dto);
	
}
