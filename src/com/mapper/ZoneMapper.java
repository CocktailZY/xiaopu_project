package com.mapper;

import java.util.List;


import com.model.Zone;

public interface ZoneMapper {

	/**
	 * <p>方法功能描述：查询所有区块名称</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-15 下午8:43:29
	 * @参数：@return    
	 * @返回类型：List<Zone>   
	 * @throws
	 */
	List<Zone> allZoneList();

	/**
	 * <p>方法功能描述：添加区块</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午8:21:13
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	void addZone(Zone dto);

	/**
	 * <p>方法功能描述：删除区块</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午8:41:04
	 * @参数：@param zId    
	 * @返回类型：void   
	 * @throws
	 */
	void deleteZone(Integer zId);

	/**
	 * <p>方法功能描述：查询区块名称</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午9:34:17
	 * @参数：@param zId
	 * @参数：@return    
	 * @返回类型：Zone   
	 * @throws
	 */
	String selectZoneById(Integer zId);

}
