package com.zy.mapper;

import java.util.HashMap;
import java.util.List;

import com.zy.model.User;

public interface UserMapper {
	public List<User> listAll();
	public User getById(int id);
	public User getByUserNameAndPassword(User user);
	public User checkUsername(User user);
	public int update(User dto);
	public int delete(int id);
	public int save(User dto);
	//-------------------------Extend-------------------------
	public List<User> pageListAll(HashMap<String,Object> map);
	public User getByUserName(String userName);
}
