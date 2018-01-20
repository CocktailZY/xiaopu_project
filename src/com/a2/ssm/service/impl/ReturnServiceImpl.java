package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.ReturnMapper;
import com.a2.ssm.model.Return;
import com.a2.ssm.service.ReturnService;

@Service
@Transactional
public class ReturnServiceImpl implements ReturnService {

	@Resource
	private ReturnMapper returnMapper;
	
	public List<Return> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public Return getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Return dto) {
		// TODO Auto-generated method stub

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(Return dto) {
		// TODO Auto-generated method stub

	}

}
