package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Brand;


/**
 * @author zy
 * BrandMapper
 */
public interface BrandMapper {

	public List<Brand> list();
	public Brand getById(int id);
	public void update(Brand dto);
	public void delete(int id);
	public void save(Brand dto);
	public List<Brand> getByTypeId(int id);
	
}
