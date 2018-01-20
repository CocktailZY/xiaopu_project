package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Complaint;

/**
 * <p>类名：ComplaintService</p>
 * @类功能描述：投诉Service层
 * @类作者：zy
 * @创建时间：2016-9-5 下午9:23:52
 * @小组：A2小组
 */
public interface ComplaintService {
	/**
	 * <p>方法功能描述：显示所有投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:26:57
	 * @参数：@return    
	 * @返回类型：List<Complaint>   
	 * @throws
	 */
	public List<Complaint> list(Complaint dto);
	/**
	 * <p>方法功能描述：通过id查询投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:21:13
	 * @参数：@param id 投诉id
	 * @参数：@return      
	 * @throws
	 */
	public Complaint getById(int id);
	/**
	 * <p>方法功能描述：更新投诉状态</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:21:34
	 * @参数：@param dto 投诉实体对象     
	 * @throws
	 */
	public void update(Complaint dto);

	/**
	 * <p>方法功能描述：逻辑删除</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:22:14
	 * @参数：@param id 投诉id     
	 * @throws
	 */
	public void delete(int id);
	/**
	 * <p>方法功能描述：新增投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:26:27
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void save(Complaint dto);
	
}
