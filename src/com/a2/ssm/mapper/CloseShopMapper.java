package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.CloseShop;


/**
 * @author zy
 * CloseShopMapper
 */
public interface CloseShopMapper {

	public List<CloseShop> list();
	public CloseShop getById(int id);
	public void update(CloseShop dto);
	public void delete(int id);
	public void save(CloseShop dto);
	
}
