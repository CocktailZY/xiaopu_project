package com.zy.dao;

import java.util.List;

import com.zy.model.Purchase;
import com.zy.model.Role;

/**
 * 采购单接口
 * @author lenovo
 *
 */
public interface IPurchaseDao {
	
	/**
	 * 增加采购单信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Purchase dto);
	/**
	 * 修改采购单信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Purchase dto);
	/**
	 * 删除采购单信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Purchase dto);
	/**
	 * 根据id查询采购单信息
	 * @param id
	 * @return
	 */
	public Purchase get(int id);
	/**
	 * 根据商品id查询采购信息
	 * @param id
	 * @return
	 */
	public Purchase getByGoodId(int id);
	/**
	 * 根据商品id和用户id查询
	 * @param goodId
	 * @param userId
	 * @return
	 */
	public Purchase getByGUId(int goodId,int userId);
	/**
	 * 查询采购单信息
	 * @return
	 */
	public List<Purchase> list(Purchase dto);
	
	/**
	 * 根据进货员id查询库存信息
	 * @param id
	 * @return
	 */
	public List<Purchase> listByUserId(int id);
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
	public List<Purchase> listPage(String hql,int pageNum,int row);
}
