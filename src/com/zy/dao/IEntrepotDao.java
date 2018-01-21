package com.zy.dao;

import java.util.List;

import com.zy.model.Entrepot;

public interface IEntrepotDao {
	/**
	 * 增加仓库信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Entrepot dto);
	/**
	 * 修改仓库信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Entrepot dto);
	/**
	 * 删除仓库信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Entrepot dto);
	/**
	 * 根据id查询仓库信息
	 * @param id
	 * @return
	 */
	public Entrepot get(int id);
	/**
	 * 查询仓库信息
	 * @return
	 */
	public List<Entrepot> list(Entrepot dto);
}
