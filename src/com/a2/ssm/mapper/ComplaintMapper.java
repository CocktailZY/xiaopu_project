package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Complaint;

/**
 * <p>类名：ComplaintMapper</p>
 * <p>类功能描述：投诉 Dao层</p>
 * @类作者：zy
 * @创建时间：2016-9-5 下午9:05:25
 * @小组：A2小组
 */
public interface ComplaintMapper {

	/**
	 * <p>方法功能描述：显示所有投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:06:25
	 * @参数：@return    
	 * @返回类型：List<Complaint>   
	 * @throws
	 */
	public List<Complaint> list(Complaint dto);
	/**
	 * <p>方法功能描述：根据id查询投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:06:44
	 * @参数：@param id 投诉id
	 * @参数：@return    
	 * @返回类型：Complaint   
	 * @throws
	 */
	public Complaint getById(int id);
	/**
	 * <p>方法功能描述：更新投诉状态</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:07:14
	 * @参数：@param dto  投诉实体对象  
	 * @返回类型：void   
	 * @throws
	 */
	public void update(Complaint dto);
	/**
	 * <p>方法功能描述：逻辑删除投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:07:40
	 * @参数：@param id 投诉id   
	 * @返回类型：void   
	 * @throws
	 */
	public void delete(int id);
	/**
	 * <p>方法功能描述：增加投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:13:53
	 * @参数：@param dto 投诉实体对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void save(Complaint dto);
	
}
