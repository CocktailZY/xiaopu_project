package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.TypeSpecs;


/**
 * @author zy
 * TypeSpecsMapper
 */
public interface TypeSpecsMapper {

	public List<TypeSpecs> list(TypeSpecs dto);
	public TypeSpecs getById(int id);
	public void update(TypeSpecs dto);
	public void delete(int id);
	public void save(TypeSpecs dto);
	public List<TypeSpecs> getByTypeId(int id);
	
}
