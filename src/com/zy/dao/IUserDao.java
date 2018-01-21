package com.zy.dao;

import java.util.List;

import com.zy.model.Users;


public interface IUserDao{
	/**
	 * 增加用户信息
	 * @param dto
	 * @throws Exception
	 */
	public void save(Users dto);
	/**
	 * 修改用户信息
	 * @param dto
	 * @throws Exception
	 */
	public void update(Users dto);
	/**
	 * 删除用户信息
	 * @param dto
	 * @throws Exception
	 */
	public void delete(Users dto);
	/**
	 * 根据id查询用户信息
	 * @param id
	 * @return
	 */
	public Users get(int id);
	/**
	 * 查询用户信息
	 * @return
	 */
	public List<Users> list(Users dto);
	
	public List<Users> getByRoleId(int roleId);
	
	public Users login(String username,String password);
	
	public Users loginMessage(String username);
	
	public int count(String hql);
	
	public List<Users> listPage(String hql, int pageNum, int row);
}
