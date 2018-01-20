package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Address;


/**
 * @author zy
 * AddressService
 */
public interface AddressService {

	public List<Address> list();
	public Address getById(int id);
	public void update(Address dto);
	public void delete(int id);
	public void save(Address dto);
	//根据用户id获取地址信息的list
	public List<Address> getListByUid(int uid);
	
}
