package com.zy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.mapper.GoodImgMapper;
import com.zy.model.GoodImg;
import com.zy.service.GoodImgService;

@Service
@Transactional
public class GoodImgServiceImpl implements GoodImgService {
	
	@Resource
	private GoodImgMapper goodImgMapper;

	public List<GoodImg> list() {
		// TODO Auto-generated method stub
		return goodImgMapper.listAll();
	}

	public GoodImg getById(int id) {
		// TODO Auto-generated method stub
		return goodImgMapper.getById(id);
	}

	public void update(GoodImg dto) {
		// TODO Auto-generated method stub
		goodImgMapper.update(dto);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		goodImgMapper.delete(id);

	}

	public void save(GoodImg dto) {
		// TODO Auto-generated method stub
		goodImgMapper.save(dto);
	}

	public List<GoodImg> listByGoodId(int id) {
		// TODO Auto-generated method stub
		return goodImgMapper.listByGoodId(id);
	}

}
