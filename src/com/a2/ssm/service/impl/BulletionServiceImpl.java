package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.BulletionMapper;
import com.a2.ssm.model.Bulletion;
import com.a2.ssm.model.Shop;
import com.a2.ssm.service.BulletionService;

@Service
@Transactional
public class BulletionServiceImpl implements BulletionService {

	@Resource
	private BulletionMapper bulletionMapper;
	
	public List<Bulletion> list(Bulletion dto) {
		List<Bulletion> list = bulletionMapper.list(dto);
		return list;
	}

	public Bulletion getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Bulletion dto) {
		// TODO Auto-generated method stub

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(Bulletion dto) {
		// TODO Auto-generated method stub

	}

	
//-----------------------------------------------------------//	
	
	public List<Bulletion> shopList() {
		List<Bulletion> shopList = bulletionMapper.shopList();
		return shopList;
	}

	public List<Bulletion> mallList() {
		List<Bulletion> mallList = bulletionMapper.mallList();
		return mallList;
	}

	public List<Bulletion> allList() {
		List<Bulletion> allList = bulletionMapper.allList();
		return allList;
	}

	public void updateToRelease(Bulletion dto) {
		bulletionMapper.updateToRelease(dto);
	}

	public void updateToDelete(Bulletion dto) {
		bulletionMapper.updateToDelete(dto);
	}

	public void updateMall(Bulletion dto) {
		bulletionMapper.updateMall(dto);
	}

	public void addMall(Bulletion dto) {
		bulletionMapper.addMall(dto);
	}

	public void deleteBulletion(Integer buId) {
		bulletionMapper.deleteBulletion(buId);
	}

}
