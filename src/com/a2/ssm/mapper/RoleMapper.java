package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Role;


/**
 * @author zy
 * RoleMapper
 */
public interface RoleMapper {

	public List<Role> list();
	public List<Role> listAdmin();
	public Role getById(int id);
	public void update(Role dto);
	public void delete(int id);
	public void save(Role dto);
	
}
