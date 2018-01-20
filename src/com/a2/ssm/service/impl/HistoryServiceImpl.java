package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.HistoryMapper;
import com.a2.ssm.model.History;
import com.a2.ssm.service.HistoryService;

@Service
@Transactional
public class HistoryServiceImpl implements HistoryService {

	@Resource
	private HistoryMapper historyMapper;
	
	public List<History> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public History getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(History dto) {
		// TODO Auto-generated method stub

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(History dto) {
		// TODO Auto-generated method stub

	}

}
