package com.a2.ssm.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.UserMapper;
import com.a2.ssm.model.User;
import com.a2.ssm.service.UserService;
import com.a2.ssm.util.MailUtils;

/**
 * <p>类名：UserService</p>
 * <p>类功能描述：User service层实现类</p>：
 * @类作者：zy
 * @创建时间：2018-8-29 下午7:33:59
 * @小组：A2小组
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	
	public List<User> list(int uState) {
		List<User> list = userMapper.list(uState);
		return list;
	}
	
	public List<User> listAll(){
		List<User> list = userMapper.listAll();
		return list;
	}

	public User getById(int id) {
		User user = userMapper.getById(id);
		return user;
	}

	public void update(User dto) {
		userMapper.update(dto);
	}

	public void delete(int id) {
		userMapper.delete(id);
	}

	public User login(User dto) {
		User user = userMapper.getByName(dto);
		if(user!=null){
			return user;
		}else{
			return null;
		}
		
	}

	public User getByName(User dto) {
		
		return userMapper.getByName(dto);
	}
	/*------------------------------lx-----------------------------------------------------*/
	
	/**
	 * <p>方法功能描述：普通用户注册</p>
	 * @方法作者：lx
	 * @创建时间：2018-9-14 上午11:14:03
	 * @参数：@param dto      
	 * @throws
	 */
	public void save(User dto) {
		//制作激活码
		String code = UUID.randomUUID().toString().replace("-", "") + UUID.randomUUID().toString().replace("-", "");
		dto.setuCode(code);
		dto.setuRoleid(2);//2是买家
		dto.setuHead("");
		userMapper.save(dto);
		//将激活码发送到用户注册的邮箱
		MailUtils.sendMail(dto.getuEmail(), code);
	}
	
	/**
	 * <p>方法功能描述：管理员注册</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-17 下午7:27:50
	 * @参数：@param dto 用户对象
	 * @返回类型：void   
	 * @throws
	 */
	public void saveAdmin(User dto){
		String code = UUID.randomUUID().toString().replace("-", "") + UUID.randomUUID().toString().replace("-", "");
		dto.setuCode(code);
		userMapper.saveAdmin(dto);
	}
	
	public User findByName(User dto) {
		return userMapper.findByName(dto);
	}

	public User getByCode(User dto) {
		return userMapper.getByCode(dto);
	}

	public List<User> listByRole() {
		List<User> list = userMapper.listByRole();
		return list;
	}

	public List<User> listByAdminRole() {
		List<User> list = userMapper.listByAdminRole();
		return list;
	}

	public List<User> getByRole(int roleId) {
		List<User> list = userMapper.getByRole(roleId);
		return list;
	}

	/**
	 * <p>方法功能描述：更新管理员对象</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-17 下午7:47:36
	 * @参数：@param dto 用户对象     
	 * @throws
	 */
	public void updateAdmin(User dto) {
		userMapper.updateAdmin(dto);
	}

	public void jhAdmin(User dto) {
		userMapper.jhAdmin(dto);
	}
	
}
