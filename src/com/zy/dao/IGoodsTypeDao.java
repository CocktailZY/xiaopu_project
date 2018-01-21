package com.zy.dao;

import java.util.List;

import com.zy.model.GoodsType;

public interface IGoodsTypeDao {
	/**
	 * 增加商品类型信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(GoodsType dto);
	/**
	 * 修改商品类型信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(GoodsType dto);
	/**
	 * 删除商品类型信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(GoodsType dto);
	/**
	 * 根据id查询商品类型信息
	 * @param id
	 * @return
	 */
	public GoodsType get(int id);
	/**
	 * 查询商品类型信息
	 * @return
	 */
	public List<GoodsType> list(GoodsType dto);
}
