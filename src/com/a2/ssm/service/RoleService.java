package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Role;


/**
 * @author zy
 * RoleService
 */
public interface RoleService {

	public List<Role> list();
	public List<Role> listAdmin();
	public Role getById(int id);
	public void update(Role dto);
	public void delete(int id);
	public void save(Role dto);
	
}
