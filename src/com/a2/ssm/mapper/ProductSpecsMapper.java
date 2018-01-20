package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.ProductSpecs;

public interface ProductSpecsMapper {
	public List<ProductSpecs> list();
	public ProductSpecs getById(int id);
	public List<ProductSpecs> getByProductId(int id);
	public void update(ProductSpecs dto);
	public void delete(int id);
	public void save(ProductSpecs dto);
	public List<ProductSpecs> getByPId(int id);
}
