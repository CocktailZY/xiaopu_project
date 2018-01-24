package com.zy.service;

import java.util.HashMap;
import java.util.List;

import com.zy.model.GoodMessage;

public interface GoodMessageService {
	public List<GoodMessage> list(HashMap<String,Object> map);
	public GoodMessage getById(int id);
	public void update(GoodMessage dto);
	public int delete(int id);
	public GoodMessage save(GoodMessage dto);
}
