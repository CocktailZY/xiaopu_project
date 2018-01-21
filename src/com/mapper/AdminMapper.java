package com.mapper;

import com.model.Admin;

/**
 * <p>类名：AdminMapper</p>
 * <p>类功能描述：管理员mapper</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午4:14:28
 */
public interface AdminMapper {
	
	/**
	 * <p>方法功能描述：通过输入的管理员信息查询登录</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-4-28 上午11:50:23
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：Admin   
	 * @throws
	 */
	public Admin getByName(Admin dto);

	public void changePwd(Admin admin);



}
