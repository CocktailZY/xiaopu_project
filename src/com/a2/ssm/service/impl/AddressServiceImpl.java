package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.AddressMapper;
import com.a2.ssm.model.Address;
import com.a2.ssm.service.AddressService;

@Service
@Transactional
public class AddressServiceImpl implements AddressService {

	@Resource
	private AddressMapper addressMapper;
	
	public List<Address> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public Address getById(int id) {
		// TODO Auto-generated method stub
		Address addr = addressMapper.getById(id);
		return addr;
	}

	public void update(Address dto) {
		// TODO Auto-generated method stub
		addressMapper.update(dto);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		addressMapper.delete(id);
	}

	public void save(Address dto) {
		// TODO Auto-generated method stub
		addressMapper.save(dto);
	}

	public List<Address> getListByUid(int uid) {
		// TODO Auto-generated method stub
		List<Address> list = addressMapper.getListByUid(uid);
		return list;
	}

}
