package com.zy.service;

import java.util.HashMap;
import java.util.List;

import com.zy.model.Role;

public interface RoleService {
	public List<Role> list();
	public Role getById(int id);
	public Role update(Role dto);
	public int delete(int id);
	public Role save(Role dto);
	
	//----------Extend-------------
	public List<Role> pageListAll(HashMap<String,Object> map);
}
