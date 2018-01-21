package com.zy.dao;

import java.util.List;

import com.zy.model.Supplier;

public interface ISupplierDao {
	/**
	 * 增加供应商信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Supplier dto);
	/**
	 * 修改供应商信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Supplier dto);
	/**
	 * 删除供应商信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Supplier dto);
	/**
	 * 根据id查询供应商信息
	 * @param id
	 * @return
	 */
	public Supplier get(int id);
	/**
	 * 查询供应商信息
	 * @return
	 */
	public List<Supplier> list(Supplier dto);
	
	
}
