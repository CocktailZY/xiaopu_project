package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.ShopType;


/**
 * @author zy
 * ShopTypeService
 */
public interface ShopTypeService {

	public List<ShopType> list();
	public ShopType getById(int id);
	public void update(ShopType dto);
	public void delete(int id);
	public void save(ShopType dto);
	
	public List<ShopType> typeSel();
	
}
