package com.service;

import com.model.Admin;

/**
 * <p>类名：AdminService</p>
 * <p>类功能描述：管理员的service</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午4:57:14
 */
public interface AdminService {
	
	/**
	 * <p>方法功能描述：管理员登录</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-4-28 下午4:58:25
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：Admin   
	 * @throws
	 */
	public Admin login(Admin dto);

	

	/**
	 * <p>方法功能描述：修改管理员密码</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-3 下午7:13:31
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void changePwd(Admin admin);

}
