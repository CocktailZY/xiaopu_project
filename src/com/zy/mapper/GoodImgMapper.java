package com.zy.mapper;

import java.util.List;

import com.zy.model.GoodImg;

public interface GoodImgMapper {
	public List<GoodImg> listAll();
	public GoodImg getById(int id);
	public void update(GoodImg dto);
	public void delete(int id);
	public void save(GoodImg dto);
	
	//-----------Extend---------------
	public List<GoodImg> listByGoodId(int id);
}
