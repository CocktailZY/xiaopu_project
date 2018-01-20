package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Favorites;


/**
 * @author zy
 * FavoritesService
 */
public interface FavoritesService {

	public List<Favorites> list();
	public Favorites getById(int id);
	public void update(Favorites dto);
	public void delete(int id);
	public void save(Favorites dto);
	
}
