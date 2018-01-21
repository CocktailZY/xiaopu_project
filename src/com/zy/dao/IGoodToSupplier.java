package com.zy.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.zy.model.GoodToSupplier;
import com.zy.model.Supplier;

public interface IGoodToSupplier {
	/**
	 * 增加供货关系信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(GoodToSupplier dto);
	/**
	 * 修改供货关系信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(GoodToSupplier dto);
	/**
	 * 删除供货关系信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(GoodToSupplier dto);
	/**
	 * 根据id查询供货关系信息
	 * @param id
	 * @return
	 */
	public GoodToSupplier get(int id);
	/**
	 * 查询供货关系信息
	 * @return
	 */
	public List<GoodToSupplier> list(GoodToSupplier dto);
	/**
	 * 根据商品id查询供货商信息
	 * @param id
	 * @return
	 */
	public List<GoodToSupplier> listByGoodId(int id);
	/**
	 * 根据供货商id查询商品信息
	 * @param id
	 * @return
	 */
	public List<GoodToSupplier> listBySupId(int id);
	/**
	 * 查询供货商id
	 * @param jp
	 * @param goodId
	 * @return
	 */
	public GoodToSupplier getByPG(String jp, int goodId);
}
