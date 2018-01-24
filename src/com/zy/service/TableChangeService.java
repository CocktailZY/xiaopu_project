package com.zy.service;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;

import com.zy.model.ExpandModel;
import com.zy.model.TableChange;

public interface TableChangeService {
	public List<TableChange> list();
	public TableChange getById(int id);
	public void update(TableChange dto);
	public void delete(int id);
	public TableChange save(TableChange dto);
	
	//---------------------Extend-----------------------------
	public List<ExpandModel> list(HashMap<String,Object> map);
	public String tableCheck(TableChange dto);
	public JSONArray tableGetTime(HashMap<String,Object> map);
	public JSONArray tableGetTimeMy(HashMap<String,Object> map);
	public void updateStatus(TableChange dto);
	public void  cansleStatus(TableChange dto);
	public JSONArray tableComplete(HashMap<String,Object> map);
	public TableChange saveCart(String ids,String userid);
}
