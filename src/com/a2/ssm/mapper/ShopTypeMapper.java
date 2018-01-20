package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.ShopType;


/**
 * @author zy
 * ShopTypeMapper
 */
public interface ShopTypeMapper {

	public List<ShopType> list();
	public ShopType getById(int id);
	public void update(ShopType dto);
	public void delete(int id);
	public void save(ShopType dto);
	public List<ShopType> typeSel();
}
