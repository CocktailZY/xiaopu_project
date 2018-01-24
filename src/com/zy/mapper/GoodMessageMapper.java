package com.zy.mapper;

import java.util.HashMap;
import java.util.List;

import com.zy.model.GoodMessage;

public interface GoodMessageMapper {
	public List<GoodMessage> listAll(HashMap<String,Object> map);
	public GoodMessage getById(int id);
	public void update(GoodMessage dto);
	public int delete(int id);
	public int save(GoodMessage dto);
	
	//-----------------Extend------------------
	public List<GoodMessage> getByGoodId(HashMap<String,Object> map);
}
