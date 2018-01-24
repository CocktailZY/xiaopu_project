package com.zy.mapper;

import java.util.HashMap;
import java.util.List;

import com.zy.model.Role;

public interface RoleMapper {
	public List<Role> listAll();
	public Role getById(int id);
	public int update(Role dto);
	public int delete(int id);
	public int save(Role dto);
	//-------------Extend--------------
	public List<Role> pageListAll(HashMap<String, Object> map);
}
