package com.service;

import java.util.List;

import com.model.Zone;

/**
 * <p>类名：ChargeService</p>
 * <p>类功能描述：收费规则的service</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午5:01:50
 */
public interface ZoneService {

	/**
	 * <p>方法功能描述：查询所有区块名称</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-15 下午8:40:49
	 * @参数：@return    
	 * @返回类型：List<Zone>   
	 * @throws
	 */
	List<Zone> allZoneList();

	/**
	 * <p>方法功能描述：添加区块</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午8:19:50
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	void addZone(Zone dto);

	/**
	 * <p>方法功能描述：删除区块</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午8:38:28
	 * @参数：@param zId    
	 * @返回类型：void   
	 * @throws
	 */
	void deleteZone(Integer zId);

	/**
	 * <p>方法功能描述：查询区块名称</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午9:28:13
	 * @参数：@param zId
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	String selectZoneById(Integer zId);


	
	
	
}
