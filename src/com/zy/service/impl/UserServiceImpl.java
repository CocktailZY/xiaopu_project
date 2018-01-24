package com.zy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.mapper.RoleMapper;
import com.zy.mapper.UserMapper;
import com.zy.model.ExpandModel;
import com.zy.model.Good;
import com.zy.model.GoodImg;
import com.zy.model.GoodMessage;
import com.zy.model.GoodType;
import com.zy.model.TableChange;
import com.zy.model.Tip;
import com.zy.model.User;
import com.zy.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	@Resource
	private RoleMapper roleMapper;
	
	
	public List<ExpandModel> list() {
		// TODO Auto-generated method stub
		List<ExpandModel> list = new ArrayList<ExpandModel>();
		List<User> userList = userMapper.listAll();
		
		for(int i = 0 ; i < userList.size(); i++){
			ExpandModel exModel = new ExpandModel();
			exModel.setUserObj(userList.get(i));
			exModel.setRoleObj(roleMapper.getById(userList.get(i).getRoleId()));
			
			exModel.setGoodObj(new Good());
			exModel.setImgClass("");
			exModel.setImgObj(new GoodImg());
			exModel.setMsgObj(new GoodMessage());
			exModel.setTabObj(new TableChange());
			exModel.setTipObj(new Tip());
			exModel.setTypeObj(new GoodType());
			
			list.add(exModel);
		}
		
		return list;
	}

	public User getById(int id) {
		// TODO Auto-generated method stub
		return userMapper.getById(id);
	}

	public User update(User dto) {
		// TODO Auto-generated method stub
		int userid = userMapper.update(dto);
		if(userid == 1){
			return dto;
		}else{
			return null;
		}
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return userMapper.delete(id);
	}

	public User save(User dto) {
		// TODO Auto-generated method stub
		userMapper.save(dto);
		Integer id = dto.getUserId();
		if(null != id+""){
			User user = userMapper.getById(id);
			return user;
		}else{
			return null;
		}
	}

	public User getByUserNameAndPassword(String userName, String password) {
		User user = new User();
		user.setUserName(userName);
		user.setPassWord(password);
		return userMapper.getByUserNameAndPassword(user);
	}

	public String checkUsername(String userName) {
		User user = new User();
		user.setUserName(userName);
		User checkUser = userMapper.checkUsername(user);
		if(null != checkUser){
			return "exist";
		}else{
			return "not_exist";
		}
	}
	
	//----------------------Extend------------------------------------------
	public List<ExpandModel> pageListAll(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		List<ExpandModel> list = new ArrayList<ExpandModel>();
		List<User> userList = userMapper.pageListAll(map);
		
		for(int i = 0 ; i < userList.size(); i++){
			ExpandModel exModel = new ExpandModel();
			exModel.setUserObj(userList.get(i));
			exModel.setRoleObj(roleMapper.getById(userList.get(i).getRoleId()));
			
			exModel.setGoodObj(new Good());
			exModel.setImgClass("");
			exModel.setImgObj(new GoodImg());
			exModel.setMsgObj(new GoodMessage());
			exModel.setTabObj(new TableChange());
			exModel.setTipObj(new Tip());
			exModel.setTypeObj(new GoodType());
			
			list.add(exModel);
		}
		
		return list;
	}

	public User getByUserName(String userName) {
		// TODO Auto-generated method stub
		return userMapper.getByUserName(userName);
	}

}
