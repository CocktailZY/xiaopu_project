package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.RolePower;


/**
 * @author zy
 * RolePowerMapper
 */
public interface RolePowerMapper {

	public List<RolePower> list();
	public List<RolePower> listByRoleId(int roleId);
	public RolePower getById(int id);
	public void update(RolePower dto);
	public void delete(int id);
	public void save(RolePower dto);
	
}
