package com.zy.mapper;

import java.util.HashMap;
import java.util.List;

import com.zy.model.ShopGuide;
import com.zy.model.TableChange;
import com.zy.model.Tip;

public interface TipMapper {
	public List<Tip> listAll(HashMap<String,Object> map);
	public Tip getById(int id);
	public void update(Tip dto);
	public void delete(int id);
	public void save(Tip dto);
	
	//---------------------Extend-----------------------------
	public List<Tip> tipGetTime();
	public List<Tip> likeByTime(HashMap<String,Object> map);
	public int allReadGuide(Tip dto);
}
