package com.zy.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.mapper.RoleMapper;
import com.zy.model.Role;
import com.zy.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Resource
	private RoleMapper roleMapper;
	
	public List<Role> list() {
		// TODO Auto-generated method stub
		return roleMapper.listAll();
	}

	public Role getById(int id) {
		// TODO Auto-generated method stub
		return roleMapper.getById(id);
	}

	public Role update(Role dto) {
		// TODO Auto-generated method stub
		int mark = roleMapper.update(dto);
		if(mark == 1){
			return dto;
		}else{
			return null;
		}
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return roleMapper.delete(id);
		
		
	}

	public Role save(Role dto) {
		// TODO Auto-generated method stub
		int mark = roleMapper.save(dto);
		if(mark == 1){
			return dto;
		}else{
			return null;
		}
		
	}

	//-------------------Extend-------------------------------------
	public List<Role> pageListAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Role> roleList = roleMapper.pageListAll(map);
		return roleList;
	}

}
