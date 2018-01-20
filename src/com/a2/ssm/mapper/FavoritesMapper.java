package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Favorites;


/**
 * @author zy
 * FavoritesMapper
 */
public interface FavoritesMapper {

	public List<Favorites> list();
	public Favorites getById(int id);
	public void update(Favorites dto);
	public void delete(int id);
	public void save(Favorites dto);
	
}
