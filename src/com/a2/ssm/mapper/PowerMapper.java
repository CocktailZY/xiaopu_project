package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Power;


/**
 * <p>类名：PowerMapper</p>
 * <p>类功能描述：权限 Dao层接口</p>：
 * @类作者：zy
 * @创建时间：2016-9-5 下午4:33:47
 * @小组：A2小组
 */
public interface PowerMapper {

	/**
	 * <p>方法功能描述：查询所有权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:25:50
	 * @参数：@return    
	 * @返回类型：List<Power>   
	 * @throws
	 */
	public List<Power> list();
	/**
	 * <p>方法功能描述：查询所有一级权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:26:04
	 * @参数：@return    
	 * @返回类型：List<Power>   
	 * @throws
	 */
	public List<Power> listParentPower();
	/**
	 * <p>方法功能描述：通过id查询一级权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:26:19
	 * @参数：@param id 权限id
	 * @参数：@return    
	 * @返回类型：Power   
	 * @throws
	 */
	public Power getById(int id);
	/**
	 * <p>方法功能描述：通过id查询所有权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:26:46
	 * @参数：@param id 权限id
	 * @参数：@return    
	 * @返回类型：Power   
	 * @throws
	 */
	public Power getAllById(int id);
	/**
	 * <p>方法功能描述：根据一级权限id查询其二级权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:27:07
	 * @参数：@param dto 权限对象
	 * @参数：@return    
	 * @返回类型：List<Power>   
	 * @throws
	 */
	public List<Power> listChildPower(Power dto);
	/**
	 * <p>方法功能描述：更新权限信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:27:37
	 * @参数：@param dto 权限对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void update(Power dto);
	/**
	 * <p>方法功能描述：根据id删除权限</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:28:01
	 * @参数：@param id 权限id  
	 * @返回类型：void   
	 * @throws
	 */
	public void delete(int id);
	/**
	 * <p>方法功能描述：增加权限信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午4:28:22
	 * @参数：@param dto 权限对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void save(Power dto);
	
}
