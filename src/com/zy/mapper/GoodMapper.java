package com.zy.mapper;

import java.util.HashMap;
import java.util.List;

import com.zy.model.Good;

public interface GoodMapper {
	public List<Good> listAll(HashMap<String,Object> map);
	public Good getById(int id);
	public int update(Good dto);
	public int delete(int id);
	public int save(Good dto);
	
	//-------------------Extend------------------------
	public List<Good> mohuList(HashMap<String,Object> map);
}
