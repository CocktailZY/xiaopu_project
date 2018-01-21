package com.service;

import java.util.List;

import com.model.Record;
import com.model.Space;

/**
 * <p>类名：SpaceService</p>
 * <p>类功能描述：车位的service</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午5:17:38
 */
public interface SpaceService {
	
	/**
	 * <p>方法功能描述：查询状态为空闲的车位总数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-4-28 下午5:18:13
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer getFreeCount();

	/**
	 * <p>方法功能描述：查询状态为占用的车位总数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-4-28 下午5:19:41
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer getCarCount();

	/**
	 * <p>方法功能描述：查询全部车位数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-9 上午9:03:59
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer getAllSpaceCount();

	public List<Space> allSpaceList();

	/**
	 * <p>方法功能描述：删除区块删除车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午8:40:28
	 * @参数：@param zId    
	 * @返回类型：void   
	 * @throws
	 */
	public void deleteSpaceByZone(String zName);

	/**
	 * <p>方法功能描述：查询编号列表</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午10:24:00
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<String> allNumberList(Space dto);

	/**
	 * <p>方法功能描述：添加车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午11:01:29
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void addSpace(Space dto);

	/**
	 * <p>方法功能描述：删除车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 上午12:48:52
	 * @参数：@param sId    
	 * @返回类型：void   
	 * @throws
	 */
	public void deleteSpace(Integer sId);

	/**
	 * <p>方法功能描述：查询属于区块的车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午10:04:10
	 * @参数：@param zName
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> selectSpaceByZone(String zName);

	/**
	 * <p>方法功能描述：查询所有车位属于区块的list</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午10:24:59
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> allZoneNameList();

	/**
	 * <p>方法功能描述：查询空余车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午11:47:04
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> allFreeList();

	/**
	 * <p>方法功能描述：会员入场修改车位状态</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 上午12:02:59
	 * @参数：@param dc    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateUserState(Space dc);

	/**
	 * <p>方法功能描述：离场更新车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:37:46
	 * @参数：@param platenumber    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateLeave(String platenumber);
	
}
