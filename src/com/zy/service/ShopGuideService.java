package com.zy.service;

import java.util.HashMap;
import java.util.List;

import com.zy.model.GuideExpand;
import com.zy.model.ShopGuide;

public interface ShopGuideService {
	public List<ShopGuide> list();
	public ShopGuide getById(int id);
	public ShopGuide update(ShopGuide dto);
	public int delete(int id);
	public ShopGuide save(ShopGuide dto);
	
	//----------Extend-------------
	public List<GuideExpand> pageListAll(HashMap<String,Object> map);
	public int allReadGuide(ShopGuide dto);
}
