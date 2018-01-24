package com.zy.service;

import java.util.HashMap;
import java.util.List;

import com.zy.model.ExpandModel;
import com.zy.model.User;

public interface UserService {
	public List<ExpandModel> list();
	public User getById(int id);
	public User getByUserNameAndPassword(String userName , String password);
	public String checkUsername(String userName);
	public User update(User dto);
	public int delete(int id);
	public User save(User dto);
	//-------------------------Extend-------------------------
	public List<ExpandModel> pageListAll(HashMap<String,Object> map);
	public User getByUserName(String userName);
}
