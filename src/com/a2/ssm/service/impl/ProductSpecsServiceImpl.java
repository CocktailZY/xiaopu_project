package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.ProductSpecsMapper;
import com.a2.ssm.model.ProductSpecs;
import com.a2.ssm.service.ProductSpecsService;


@Service
@Transactional
public class ProductSpecsServiceImpl implements ProductSpecsService {

	@Resource
	private ProductSpecsMapper productSpecsMapper;

	public List<ProductSpecs> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public ProductSpecs getById(int id) {
		// TODO Auto-generated method stub
		return productSpecsMapper.getById(id);
	}

	public void update(ProductSpecs dto) {
		productSpecsMapper.update(dto);
		
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	public void save(ProductSpecs dto) {
		productSpecsMapper.save(dto);
		
	}

	public List<ProductSpecs> getByProductId(int id) {
		return (List<ProductSpecs>) productSpecsMapper.getByProductId(id);
	}

	public List<ProductSpecs> getByPId(int id) {
		// TODO Auto-generated method stub
		return productSpecsMapper.getByPId(id);
	}

	

}
