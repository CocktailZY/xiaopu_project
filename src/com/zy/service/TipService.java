package com.zy.service;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;

import com.zy.model.ExpandModel;
import com.zy.model.ShopGuide;
import com.zy.model.TableChange;
import com.zy.model.Tip;

public interface TipService {
	public List<ExpandModel> list(HashMap<String,Object> map);
	public Tip getById(int id);
	public void update(Tip dto);
	public void delete(int id);
	public void save(Tip dto);
	
	//---------------------Extend-----------------------------
	public JSONArray tableGetTime(HashMap<String,Object> map);
	public int allReadGuide(Tip dto);
}
