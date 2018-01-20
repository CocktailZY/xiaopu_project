package com.a2.ssm.service;

import java.util.List;
import com.a2.ssm.model.User;


/**
 * <p>类名：UserService</p>
 * <p>类功能描述：用户Service层接口</p>
 * @类作者：zy
 * @创建时间：2016-9-13 上午9:12:32
 * @小组：A2小组
 */
public interface UserService {
	/**
	 * <p>方法功能描述：查询所有已激活用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 上午9:13:49
	 * @参数：@param uState 状态
	 * @参数：@return    
	 * @返回类型：List<User>   
	 * @throws
	 */
	public List<User> list(int uState);
	/**
	 * <p>方法功能描述：查询全部用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 上午9:14:30
	 * @参数：@return    
	 * @返回类型：List<User>   
	 * @throws
	 */
	public List<User> listAll();
	/**
	 * <p>方法功能描述：根据角色查询用户信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-14 下午4:04:45
	 * @参数：@return    
	 * @返回类型：List<User>   
	 * @throws
	 */
	public List<User> getByRole(int roleId);
	/**
	 * <p>方法功能描述：根据id查询用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 上午9:14:47
	 * @参数：@param id 用户id
	 * @参数：@return    
	 * @返回类型：User   
	 * @throws
	 */
	public User getById(int id);
	/**
	 * <p>方法功能描述：根据用户名和密码查询当前用户是否存在</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 上午9:15:16
	 * @参数：@param dto 用户对象
	 * @参数：@return    
	 * @返回类型：User   
	 * @throws
	 */
	public User getByName(User dto);
	/**
	 * <p>方法功能描述：只根据用户名查找用户(验证用户名是否重复)</p>
	 * @方法作者：lx
	 * @创建时间：2016-9-13 上午9:16:06
	 * @参数：@param dto 用户对象
	 * @参数：@return    
	 * @返回类型：User   
	 * @throws
	 */
	public User findByName(User dto);
	/**
	 * <p>方法功能描述：根据激活码查找用户(验证激活码)</p>
	 * @方法作者：lx
	 * @创建时间：2016-9-13 上午9:16:26
	 * @参数：@param dto 用户对象
	 * @参数：@return    
	 * @返回类型：User   
	 * @throws
	 */
	public User getByCode(User dto);
	/**
	 * <p>方法功能描述：更新用户信息</p>
	 * @方法作者：lx
	 * @创建时间：2016-9-13 上午9:16:56
	 * @参数：@param dto 用户对象   
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
	 * <p>方法功能描述：逻辑删除用户(修改用户状态为未激活)</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 上午9:17:13
	 * @参数：@param id    
	 * @返回类型：void   
	 * @throws
	 */
	public void delete(int id);
	/**
	 * <p>方法功能描述：新增用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 上午9:17:41
	 * @参数：@param dto 用户对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void save(User dto);
	/**
	 * <p>方法功能描述：新增管理员</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-17 下午7:32:09
	 * @参数：@param dto 用户对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void saveAdmin(User dto);
	/**
	 * <p>方法功能描述：用户登录</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 上午9:17:53
	 * @参数：@param dto 用户对象
	 * @参数：@return    
	 * @返回类型：User   
	 * @throws
	 */
	public User login(User dto);
	
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
