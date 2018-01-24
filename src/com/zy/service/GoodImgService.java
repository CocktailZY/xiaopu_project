package com.zy.service;

import java.util.List;

import com.zy.model.GoodImg;

public interface GoodImgService {
	public List<GoodImg> list();
	public GoodImg getById(int id);
	public void update(GoodImg dto);
	public void delete(int id);
	public void save(GoodImg dto);
	
	//-----------Extend---------------
	public List<GoodImg> listByGoodId(int id);
}
