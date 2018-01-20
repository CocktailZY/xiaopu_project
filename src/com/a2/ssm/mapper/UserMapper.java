package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.User;


/**
 * <p>类名：UserMapper</p>
 * <p>类功能描述:User Dao层Mapper接口</p>：
 * @类作者：zy
 * @创建时间：2016-8-29 下午2:38:19
 * @小组：A2小组
 */
public interface UserMapper {
	/**
	 * <p>方法功能描述：前台查询所有用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-29 下午8:01:29
	 * @参数：@return    
	 * @返回类型：List<User>   
	 * @throws
	 */
	public List<User> list(int uState);
	/**
	 * <p>方法功能描述：后台查询所有用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-29 下午8:02:10
	 * @参数：@return    
	 * @返回类型：List<User>   
	 * @throws
	 */
	public List<User> listAll();
	/**
	 * <p>方法功能描述：按角色查询用户信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-14 下午4:03:47
	 * @参数：@return    
	 * @返回类型：List<User>   
	 * @throws
	 */
	public List<User> getByRole(int roleId);
	/**
	 * <p>方法功能描述：根据id查询用户</p>
	 * @方法作者：lenovo
	 * @创建时间：2016-8-29 下午8:03:02
	 * @参数：@param id
	 * @参数：@return    
	 * @返回类型：User   
	 * @throws
	 */
	public User getById(int id);
	/**
	 * <p>方法功能描述：根据用户名和密码查询用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-29 下午8:03:15
	 * @参数：用户名  @param uName 
	 * @参数：密码  @param uPwd 
	 * @参数：@return    
	 * @返回类型：User   
	 * @throws
	 */
	public User getByName(User dto);
	/**
	 * <p>方法功能描述：更新用户信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-29 下午8:04:43
	 * @参数：用户对象  @param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void update(User dto);
	/**
	 * <p>方法功能描述：更新管理员信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-17 下午7:46:55
	 * @参数：@param dto  用户对象  
	 * @返回类型：void   
	 * @throws
	 */
	public void updateAdmin(User dto);
	/**
	 * <p>方法功能描述：激活管理员</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-18 下午2:21:48
	 * @参数：@param dto 用户对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void jhAdmin(User dto);
	/**
	 * <p>方法功能描述：逻辑删除用户，物理修改用户状态</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-29 下午8:05:08
	 * @参数：用户id @param id    
	 * @返回类型：void   
	 * @throws
	 */
	public void delete(int id);
	/**
	 * <p>方法功能描述：增加用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-29 下午8:06:12
	 * @参数：用户对象  @param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void save(User dto);
	/**
	 * <p>方法功能描述：新增管理员</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-17 下午7:33:13
	 * @参数：@param dto 用户对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void saveAdmin(User dto);
	
	/*-------------------lx--------------------*/
	/**
	 * <p>方法功能描述：根据用户名查询用户</p>
	 * @方法作者：lx
	 * @创建时间：2016-8-31 下午4:24:44
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：User   
	 * @throws
	 */
	public User findByName(User dto);
	
	/**
	 * <p>方法功能描述：根据激活码查询用户</p>
	 * @方法作者：lx
	 * @创建时间：2016-9-1 下午4:43:03
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：User   
	 * @throws
	 */
	public User getByCode(User dto);
	/**
	 * <p>方法功能描述：查询所有非管理员用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 上午9:19:25
	 * @参数：@return    
	 * @返回类型：List<User>   
	 * @throws
	 */
	public List<User> listByRole();
	/**
	 * <p>方法功能描述：查询所有管理员</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 上午9:27:30
	 * @参数：@return    
	 * @返回类型：List<User>   
	 * @throws
	 */
	public List<User> listByAdminRole();
}
