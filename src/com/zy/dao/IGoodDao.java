package com.zy.dao;

import java.util.List;

import com.zy.model.Goods;
import com.zy.util.PageBean;


public interface IGoodDao {
	/**
	 * 增加商品信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Goods dto);
	/**
	 * 修改商品信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Goods dto);
	/**
	 * 删除商品信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Goods dto);
	/**
	 * 根据id查询商品信息
	 * @param id
	 * @return
	 */
	public Goods get(int id);
	/**
	 * 查询商品信息
	 * @return
	 */
	public List<Goods> list(Goods dto);
	/**
	 * 查询商品信息
	 * @return
	 */
	public List<Goods> list(Goods dto , PageBean page);
	/**
	 * 根据供货商id查询商品信息
	 * @param id
	 * @return
	 */
	public List<Goods> listBySupId(int id);
	/**
	 * 根据状态查询商品信息
	 * @param id
	 * @return
	 */
	public List<Goods> listByStatus(int status);
	/**
	 * 根据状态查询商品信息
	 * @param id
	 * @return
	 */
	public List<Goods> listPage(int status, PageBean page);
}
