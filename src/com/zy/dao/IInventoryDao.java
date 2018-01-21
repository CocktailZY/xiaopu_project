package com.zy.dao;

import java.util.List;

import com.zy.model.GoodToSupplier;
import com.zy.model.Inventory;
import com.zy.model.Purchase;

public interface IInventoryDao {
	/**
	 * 增加库存信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Inventory dto);
	/**
	 * 修改库存信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Inventory dto);
	/**
	 * 删除库存信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Inventory dto);
	/**
	 * 根据id查询库存信息
	 * @param id
	 * @return
	 */
	public Inventory get(int id);
	/**
	 * 查询库存信息
	 * @return
	 */
	public List<Inventory> list(Inventory dto);
	
	/**
	 * 根据商品id和仓库id取出库存
	 * @param dto
	 * @return
	 */
	public Inventory listByGoodId(int id,int eId);
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
	public List<Inventory> listPage(String hql,int pageNum,int row);
}
