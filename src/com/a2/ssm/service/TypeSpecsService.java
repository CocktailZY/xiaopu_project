package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.TypeSpecs;


/**
 * <p>类名：TypeSpecsService</p>
 * <p>类功能描述：类型规格service层接口类</p>
 * @类作者：zy
 * @创建时间：2018-9-9 下午7:52:21
 * @小组：A2小组
 */
public interface TypeSpecsService {

	/**
	 * <p>方法功能描述：查询所有类型规格</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-9 下午7:53:12
	 * @参数：@param dto 类型规格对象
	 * @参数：@return    
	 * @返回类型：List<TypeSpecs>   
	 * @throws
	 */
	public List<TypeSpecs> list(TypeSpecs dto);
	/**
	 * <p>方法功能描述：根据id查询类型规格</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午11:00:49
	 * @参数：@param id 类型规格id
	 * @参数：@return    
	 * @返回类型：TypeSpecs   
	 * @throws
	 */
	public TypeSpecs getById(int id);
	/**
	 * <p>方法功能描述：更新类型规格</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午11:01:13
	 * @参数：@param dto 类型规格对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void update(TypeSpecs dto);
	/**
	 * <p>方法功能描述：删除类型规格</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午11:01:31
	 * @参数：@param id  类型规格id  
	 * @返回类型：void   
	 * @throws
	 */
	public void delete(int id);
	/**
	 * <p>方法功能描述：新增类型规格</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午11:01:50
	 * @参数：@param dto  类型规格对象  
	 * @返回类型：void   
	 * @throws
	 */
	public void save(TypeSpecs dto);
	/**
	 * <p>方法功能描述：通过类型查询类型规格</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午11:02:06
	 * @参数：@param id 类型id
	 * @参数：@return    
	 * @返回类型：List<TypeSpecs>   
	 * @throws
	 */
	public List<TypeSpecs> getByTypeId(int id);
	
}
