package com.zy.service;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;

import com.zy.model.Cart;

public interface CartService {
	public List<Cart> listAll();
	public Cart getById(int id);
	public int update(Cart dto);
	public int delete(int id);
	public Cart save(Cart dto);
	
	//-----------Extend---------------
	public JSONArray listByUserId(HashMap<String,Object> map);
}
