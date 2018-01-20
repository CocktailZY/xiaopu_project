package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.PowerMapper;
import com.a2.ssm.model.Power;
import com.a2.ssm.service.PowerService;

@Service
@Transactional
public class PowerServiceImpl implements PowerService {

	@Resource
	private PowerMapper powerMapper;
	
	/**
	 * <p>方法功能描述：查询所有权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 上午11:25:29
	 * @参数：@return      
	 * @throws
	 */
	public List<Power> list() {
		List<Power> list = powerMapper.list();
		return list;
	}

	/**
	 * <p>方法功能描述：根据id获取权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 上午11:25:48
	 * @参数：@param id 权限id
	 * @参数：@return      
	 * @throws
	 */
	public Power getById(int id) {
		Power power = powerMapper.getById(id);
		return power;
	}
	
	/**
	 * <p>方法功能描述：根据父权限id查询子权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:28:59
	 * @参数：@param dto 权限对象
	 * @参数：@return      
	 * @throws
	 */
	public List<Power> listChildPower(Power dto){
		List<Power> list = powerMapper.listChildPower(dto);
		return list;
	}

	/**
	 * <p>方法功能描述：更新权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 上午11:46:04
	 * @参数：@param dto  权限对象    
	 * @throws
	 */
	public void update(Power dto) {
		powerMapper.update(dto);
	}

	/**
	 * <p>方法功能描述：根据id删除权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 上午11:46:41
	 * @参数：@param id      
	 * @throws
	 */
	public void delete(int id) {
		powerMapper.delete(id);
	}

	/**
	 * <p>方法功能描述：增加权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 上午11:47:31
	 * @参数：@param dto      
	 * @throws
	 */
	public void save(Power dto) {
		powerMapper.save(dto);
	}

	/**
	 * <p>方法功能描述：查询所有父权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午6:39:03
	 * @参数：@return      
	 * @throws
	 */
	public List<Power> listParentPower() {
		List<Power> list = powerMapper.listParentPower();
		return list;
	}

	/**
	 * <p>方法功能描述：根据id查询所有权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:29:38
	 * @参数：@param id 权限id
	 * @参数：@return      
	 * @throws
	 */
	public Power getAllById(int id) {
		Power power = powerMapper.getAllById(id);
		return power;
	}

}
