package com.zy.mapper;

import java.util.HashMap;
import java.util.List;

import com.zy.model.Cart;

public interface CartMapper {
	public List<Cart> listAll();
	public Cart getById(int id);
	public int update(Cart dto);
	public int delete(int id);
	public int save(Cart dto);
	
	//-----------Extend---------------
	public List<Cart> listByUserId(HashMap<String,Object> map);
	public Cart getByGoodId(int id);
}
