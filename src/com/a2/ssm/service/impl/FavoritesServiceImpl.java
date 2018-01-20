package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.FavoritesMapper;
import com.a2.ssm.model.Favorites;
import com.a2.ssm.service.FavoritesService;

@Service
@Transactional
public class FavoritesServiceImpl implements FavoritesService {

	@Resource
	private FavoritesMapper favoritesMapper;
	
	public List<Favorites> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public Favorites getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Favorites dto) {
		// TODO Auto-generated method stub

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(Favorites dto) {
		// TODO Auto-generated method stub

	}

}
