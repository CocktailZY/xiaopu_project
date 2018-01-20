package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.History;


/**
 * @author zy
 * HistoryService
 */
public interface HistoryService {

	public List<History> list();
	public History getById(int id);
	public void update(History dto);
	public void delete(int id);
	public void save(History dto);
	
}
