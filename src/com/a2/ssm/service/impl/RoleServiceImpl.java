package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.RoleMapper;
import com.a2.ssm.model.Role;
import com.a2.ssm.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Resource
	private RoleMapper roleMapper;
	
	/**
	 * <p>方法功能描述：查询所有角色</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午3:10:09
	 * @参数：@return      
	 * @throws
	 */
	public List<Role> list() {
		List<Role> list = roleMapper.list();
		return list;
	}

	/**
	 * <p>方法功能描述：通过角色id查询单条角色信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午3:10:26
	 * @参数：@param id
	 * @参数：@return      
	 * @throws
	 */
	public Role getById(int roId) {
		Role dto = roleMapper.getById(roId);
		return dto;
	}

	/**
	 * <p>方法功能描述：更新角色信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午3:10:45
	 * @参数：@param dto      
	 * @throws
	 */
	public void update(Role dto) {
		roleMapper.update(dto);
	}

	/**
	 * <p>方法功能描述：删除角色</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午3:10:59
	 * @参数：@param id      
	 * @throws
	 */
	public void delete(int id) {
		roleMapper.delete(id);
	}

	/**
	 * <p>方法功能描述：增加角色</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午3:11:28
	 * @参数：@param dto      
	 * @throws
	 */
	public void save(Role dto) {
		roleMapper.save(dto);
	}

	/**
	 * <p>方法功能描述：查询所有管理员角色</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-18 下午1:28:20
	 * @参数：@return      
	 * @throws
	 */
	public List<Role> listAdmin() {
		List<Role> list = roleMapper.listAdmin();
		return list;
	}

}
