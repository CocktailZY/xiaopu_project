package com.zy.dao;

import java.util.List;

import com.zy.model.Sell;


public interface ISellDao {
	/**
	 * 增加销售单信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Sell dto);
	/**
	 * 修改销售单信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Sell dto);
	/**
	 * 删除销售单信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Sell dto);
	/**
	 * 根据id查询销售单信息
	 * @param id
	 * @return
	 */
	public Sell get(int id);
	/**
	 * 查询销售单信息
	 * @return
	 */
	public List<Sell> list(Sell dto);
	/**
	 * 根据顾客id查询销售单信息
	 * @return
	 */
	public List<Sell> listByCusId(int id);
}
