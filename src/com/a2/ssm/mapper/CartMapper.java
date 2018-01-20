package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Cart;


/**
 * @author sz
 * CartMapper
 */
public interface CartMapper {

	public List<Cart> list();
	public List<Cart> getById(int id);
	public void update(Cart dto);
	public void delete(int id);
	public void save(Cart dto);
}
