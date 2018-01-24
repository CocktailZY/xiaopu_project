package com.zy.mapper;

import java.util.HashMap;
import java.util.List;

import com.zy.model.Role;
import com.zy.model.ShopGuide;

public interface ShopGuideMapper {
	public List<ShopGuide> listAll();
	public ShopGuide getById(int id);
	public int update(ShopGuide dto);
	public int delete(int id);
	public int save(ShopGuide dto);
	//-------------Extend--------------
	public List<ShopGuide> pageListAll(HashMap<String, Object> map);
	public int allReadGuide(ShopGuide dto);
}
