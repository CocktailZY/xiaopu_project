package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.mapper.AdminMapper;
import com.model.Admin;
import com.service.AdminService;

/**
 * <p>类名：AdminServiceImpl</p>
 * <p>类功能描述：管理员的serviceImpl</p>
 * @类作者：renguangqi
 * @创建时间：2018-3-2 上午9:30:27
 */
@Service
@Transactional
public class AdminServiceImpl implements AdminService {

	@Resource
	private AdminMapper adminMapper;

	public Admin login(Admin dto) {
		Admin admin = adminMapper.getByName(dto);
		if(admin!=null){
			return admin;
		}else{
			return null;
		}
	}

	public void changePwd(Admin admin) {
		adminMapper.changePwd(admin);
	}


}
