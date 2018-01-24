package com.zy.mapper;

import java.util.HashMap;
import java.util.List;

import com.zy.model.GoodType;

public interface GoodTypeMapper {
	public List<GoodType> list();
	public GoodType getById(int id);
	public int update(GoodType dto);
	public int delete(int id);
	public int save(GoodType dto);
	
	//-----------------Extend-----------
	public GoodType getByName(String name);
	public List<GoodType> listAll(HashMap<String,Object> map);
	public List<GoodType> pageListAll(HashMap<String,Object> map);
}
