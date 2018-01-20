package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.BrandMapper;
import com.a2.ssm.model.Brand;
import com.a2.ssm.service.BrandService;

@Service
@Transactional
public class BrandServiceImpl implements BrandService {

	@Resource
	private BrandMapper brandMapper;

	public List<Brand> list() {
		// TODO Auto-generated method stub
		return brandMapper.list();
	}

	public Brand getById(int id) {
		// TODO Auto-generated method stub
		return brandMapper.getById(id);
	}

	public void update(Brand dto) {
		// TODO Auto-generated method stub
		
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	public void save(Brand dto) {
		brandMapper.save(dto);
		
	}

	public List<Brand> getByTypeId(int id) {
		// TODO Auto-generated method stub
		return brandMapper.getByTypeId(id);
	}
	

}
