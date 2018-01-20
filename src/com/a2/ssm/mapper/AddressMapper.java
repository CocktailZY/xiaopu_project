package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Address;


/**
 * @author zy
 * AddressMapper
 */
public interface AddressMapper {

	public List<Address> list();
	public Address getById(int id);
	public void update(Address dto);
	public void delete(int id);
	public void save(Address dto);
	public List<Address> getListByUid(int uid);
	
}
