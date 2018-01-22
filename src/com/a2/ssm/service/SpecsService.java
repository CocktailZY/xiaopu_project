package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Specs;


/**
 * <p>类名：SpecsService</p>
 * <p>类功能描述：规格详情Service层接口</p>
 * @类作者：zy
 * @创建时间：2018-9-12 上午10:53:51
 * @小组：A2小组
 */
public interface SpecsService {
	/**
	 * <p>方法功能描述：查询所有Specs</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午10:54:52
	 * @参数：@param dto Specs对象
	 * @参数：@return    
	 * @返回类型：List<Specs>   
	 * @throws
	 */
	public List<Specs> list(Specs dto);
	/**
	 * <p>方法功能描述：根据id查询Specs信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午10:56:59
	 * @参数：@param id 规格详情id
	 * @参数：@return    
	 * @返回类型：Specs   
	 * @throws
	 */

	public Specs getById(int id);
	/**
	 * <p>方法功能描述：更新Specs信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午10:57:33
	 * @参数：@param dto 规格详情对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void update(Specs dto);
	/**
	 * <p>方法功能描述：删除Specs信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午10:58:40
	 * @参数：@param id 规格详情id   
	 * @返回类型：void   
	 * @throws
	 */
	public void delete(int id);
	/**
	 * <p>方法功能描述：新增Specs信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午10:59:31
	 * @参数：@param dto  规格详情对象  
	 * @返回类型：void   
	 * @throws
	 */
	public void save(Specs dto);
	/**
	 * <p>方法功能描述：根据规格类型id查询Specs信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午10:59:51
	 * @参数：@param id 规格类型id
	 * @参数：@return    
	 * @返回类型：List<Specs>   
	 * @throws
	 */
	public List<Specs> getByTsId(int id);
	public List<Specs> getBySpId(int id);
}
