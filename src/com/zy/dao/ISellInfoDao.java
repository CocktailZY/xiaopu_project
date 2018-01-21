package com.zy.dao;

import java.util.List;

import com.zy.model.SellInfo;

public interface ISellInfoDao {
	/**
	 * 增加销售详情信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(SellInfo dto);
	/**
	 * 修改销售详情信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(SellInfo dto);
	/**
	 * 删除销售详情信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(SellInfo dto);
	/**
	 * 根据id查询销售详情信息
	 * @param id
	 * @return
	 */
	public SellInfo get(int id);
	/**
	 * 查询销售详情信息
	 * @return
	 */
	public List<SellInfo> list(SellInfo dto);
	/**
	 * 根据销售单id查询销售详情信息
	 * @return
	 */
	public List<SellInfo> listBySellId(int id);

}
