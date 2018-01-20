package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.History;


/**
 * @author zy
 * HistoryMapper
 */
public interface HistoryMapper {

	public List<History> list();
	public History getById(int id);
	public void update(History dto);
	public void delete(int id);
	public void save(History dto);
	
}
