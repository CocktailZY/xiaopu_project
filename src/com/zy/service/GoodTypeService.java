package com.zy.service;

import java.util.HashMap;
import java.util.List;

import com.zy.model.ExpandModel;
import com.zy.model.GoodType;

public interface GoodTypeService {
	public List<GoodType> list();
	public GoodType getById(int id);
	public GoodType update(GoodType dto);
	public int delete(int id);
	public GoodType save(GoodType dto);
	
	//-----------------Extend-----------
	public GoodType getByName(String name);
	public List<ExpandModel> addImgClass(List<GoodType> list);
	public List<GoodType> list(HashMap<String,Object> map);
	public List<GoodType> pageListAll(HashMap<String,Object> map);
}
