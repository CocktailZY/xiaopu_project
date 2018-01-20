package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.CloseShopMapper;
import com.a2.ssm.model.CloseShop;
import com.a2.ssm.service.CloseShopService;

@Service
@Transactional
public class CloseShopServiceImpl implements CloseShopService{

	@Resource
	private CloseShopMapper closeShopMapper;
	
	public List<CloseShop> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public CloseShop getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(CloseShop dto) {
		// TODO Auto-generated method stub
		
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	public void save(CloseShop dto) {
		// TODO Auto-generated method stub
		
	}

}
