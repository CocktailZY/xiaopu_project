package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.RolePowerMapper;
import com.a2.ssm.model.RolePower;
import com.a2.ssm.service.RolePowerService;

@Service
@Transactional
public class RolePowerServiceImpl implements RolePowerService {

	@Resource
	private RolePowerMapper rolePowerMapper;
	
	/**
	 * <p>方法功能描述：查询所有角色权限关系</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午6:56:12
	 * @参数：@return      
	 * @throws
	 */
	public List<RolePower> list() {
		List<RolePower> list = rolePowerMapper.list();
		return list;
	}
	
	/**
	 * <p>方法功能描述：根据角色id查询所有关系</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午6:56:37
	 * @参数：@param roleId 角色id
	 * @参数：@return      
	 * @throws
	 */
	public List<RolePower> listByRoleId(int roleId){
		List<RolePower> list = rolePowerMapper.listByRoleId(roleId);
		return list;
	}

	/**
	 * <p>方法功能描述：根据id查询关系</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午6:57:03
	 * @参数：@param id 关系id
	 * @参数：@return      
	 * @throws
	 */
	public RolePower getById(int id) {
		RolePower rolePower = rolePowerMapper.getById(id);
		return rolePower;
	}

	/**
	 * <p>方法功能描述：更新关系</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午7:02:50
	 * @参数：@param dto 关系对象     
	 * @throws
	 */
	public void update(RolePower dto) {
		rolePowerMapper.update(dto);
	}

	/**
	 * <p>方法功能描述：删除关系</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午7:03:10
	 * @参数：@param id 关系id     
	 * @throws
	 */
	public void delete(int id) {
		rolePowerMapper.delete(id);
	}

	/**
	 * <p>方法功能描述：增加关系</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午7:03:28
	 * @参数：@param dto 关系对象     
	 * @throws
	 */
	public void save(RolePower dto) {
		rolePowerMapper.save(dto);
	}

}
