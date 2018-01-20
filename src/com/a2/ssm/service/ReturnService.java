package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Return;


/**
 * @author zy
 * ReturnService
 */
public interface ReturnService {

	public List<Return> list();
	public Return getById(int id);
	public void update(Return dto);
	public void delete(int id);
	public void save(Return dto);
	
}
