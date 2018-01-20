package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Images;


/**
 * @author zy
 * ImagesService
 */
public interface ImagesService {

	public List<Images> list();
	public Images getById(int id);
	public void update(Images dto);
	public void delete(int id);
	public void save(Images dto);
	public List<Images> getByPId(int pid);
	public List<Images> getByCommId(int commid);
	
}
