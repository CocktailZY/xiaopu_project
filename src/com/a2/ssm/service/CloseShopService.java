package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.CloseShop;


/**
 * @author zy
 * CloseShopService
 */
public interface CloseShopService {

	public List<CloseShop> list();
	public CloseShop getById(int id);
	public void update(CloseShop dto);
	public void delete(int id);
	public void save(CloseShop dto);
	
}
