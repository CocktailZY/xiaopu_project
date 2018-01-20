package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.ShopTypeMapper;
import com.a2.ssm.model.ShopType;
import com.a2.ssm.service.ShopTypeService;

@Service
@Transactional
public class ShopTypeServiceImpl implements ShopTypeService {

	@Resource
	private ShopTypeMapper shopTypeMapper;
	
	public List<ShopType> typeSel(){
		List<ShopType> list = shopTypeMapper.typeSel();
		return list;
	}
	
	
	public List<ShopType> list() {
		// TODO Auto-generated method stub
		return shopTypeMapper.list();
	}

	public ShopType getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(ShopType dto) {
		// TODO Auto-generated method stub

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(ShopType dto) {
		// TODO Auto-generated method stub

	}

}
