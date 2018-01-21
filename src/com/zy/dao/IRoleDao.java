package com.zy.dao;

import java.util.List;

import com.zy.model.Order;
import com.zy.model.Role;
import com.zy.model.Users;

public interface IRoleDao {
	/**
	 * 增加角色信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Role dto);
	/**
	 * 修改角色信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Role dto);
	/**
	 * 删除角色信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Role dto);
	/**
	 * 根据id查询角色信息
	 * @param id
	 * @return
	 */
	public Role get(int id);
	/**
	 * 查询角色信息
	 * @return
	 */
	public List<Role> list(Role dto);
	/**
	 * 分页查询总记录数
	 * @param hql
	 * @return
	 */
	public int count(String hql);
	/**
	 * 分页查询
	 * @param hql
	 * @param pageNum
	 * @param row
	 * @return
	 */
	public List<Role> listPage(String hql,int pageNum,int row);
}
