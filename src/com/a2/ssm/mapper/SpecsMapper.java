package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Specs;


/**
 * @author zy
 * SpecsMapper
 */
public interface SpecsMapper {

	public List<Specs> list(Specs dto);
	public Specs getById(int id);
	public void update(Specs dto);
	public void delete(int id);
	public void save(Specs dto);
	public List<Specs> getByTsId(int id);
	public List<Specs> getBySpId(int id);
	
}
