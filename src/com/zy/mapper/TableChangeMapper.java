package com.zy.mapper;

import java.util.HashMap;
import java.util.List;

import com.zy.model.TableChange;

public interface TableChangeMapper {
	public List<TableChange> list();
	public TableChange getById(int id);
	public void update(TableChange dto);
	public void delete(int id);
	public int save(TableChange dto);
	
	//---------------------Extend-----------------------------
	public List<TableChange> listAll(HashMap<String,Object> map);
	public List<TableChange> pageListAll(HashMap<String,Object> map);
	public TableChange tableCheck(TableChange dto);
	public List<TableChange> tableGetTime();
	public List<TableChange> likeByTime(HashMap<String,Object> map);
	public List<TableChange> likeByTimeMy(HashMap<String,Object> map);
	public void updateStatus(TableChange dto);
}
