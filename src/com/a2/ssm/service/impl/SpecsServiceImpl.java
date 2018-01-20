package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.SpecsMapper;
import com.a2.ssm.model.Specs;
import com.a2.ssm.service.SpecsService;

@Service
@Transactional
public class SpecsServiceImpl implements SpecsService {

	@Resource
	private SpecsMapper specsMapper;
	
	public List<Specs> list(Specs dto) {
		List<Specs> list = specsMapper.list(dto);
		return list;
	}

	public Specs getById(int id) {
		return specsMapper.getById(id);
	}

	public void update(Specs dto) {
		specsMapper.update(dto);
	}

	public void delete(int id) {
		specsMapper.delete(id);
	}

	public void save(Specs dto) {
		specsMapper.save(dto);
	}

	public List<Specs> getByTsId(int id) {
		return specsMapper.getByTsId(id);
	}

	public List<Specs> getBySpId(int id) {
		return specsMapper.getBySpId(id);
	}
}
