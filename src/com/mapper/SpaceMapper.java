package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Record;
import com.model.Space;

/**
 * <p>类名：SpaceMapper</p>
 * <p>类功能描述：车位的mapper</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午4:28:22
 */
public interface SpaceMapper {
	
	/**
	 * <p>方法功能描述：查询返回所有空余状态的车位数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-4-28 下午4:28:30
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer getFreeCount();

	/**
	 * <p>方法功能描述：查询所有占用的车位数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-4-28 下午4:28:33
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer getCarCount();

	/**
	 * <p>方法功能描述：查询小型车车位剩余数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-2 上午11:58:57
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer smallSpaceCount();

	/**
	 * <p>方法功能描述：查询中型车车位剩余数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-2 上午11:59:00
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer mediumSpaceCount();

	/**
	 * <p>方法功能描述：查询大型车车位剩余数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-2 上午11:59:03
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer largeSpaceCount();

	/**
	 * <p>方法功能描述：查询空余小车位的list</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-8 下午12:57:51
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> freeSmallSpaceList();


	/**
	 * @param space 
	 * <p>方法功能描述：修改对应车位的状态</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-8 下午3:05:36
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateSpaceSmallState(Integer smallspace);

	/**
	 * <p>方法功能描述：修改对应车位的车牌号</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-8 下午4:21:39
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateSpaceSmallPlatenumber(Record dto);

	/**
	 * <p>方法功能描述：查询空余中型车位list</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-8 下午4:36:05
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> freeMediumSpaceList();

	/**
	 * <p>方法功能描述：修改中型车位状态</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-8 下午5:25:55
	 * @参数：@param mediumspace    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateSpaceMediumState(Integer mediumspace);

	/**
	 * <p>方法功能描述：修改中型车位车牌号</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-8 下午5:26:34
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateSpaceMediumPlatenumber(Record dto);

	/**
	 * <p>方法功能描述：查询空余大型车位list</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-8 下午7:44:43
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> freeLargeSpaceList();

	/**
	 * <p>方法功能描述：修改大型车位状态</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-8 下午7:45:28
	 * @参数：@param largespace    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateSpaceLargeState(Integer largespace);

	/**
	 * <p>方法功能描述：修改大型车位车牌号</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-8 下午7:45:47
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateSpaceLargePlatenumber(Record dto);

	/**
	 * <p>方法功能描述：查询所有车位数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-9 上午9:05:49
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer getAllSpaceCount();

	/**
	 * <p>方法功能描述：未租用未占用的小车位数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-9 上午9:25:46
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer freeHireSmallCount();

	/**
	 * <p>方法功能描述：未租用未占用的中车位数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-9 上午9:25:51
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer freeHireMediumCount();

	/**
	 * <p>方法功能描述：未租用未占用的大车位数</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-9 上午9:25:54
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer freeHireLargeCount();

	/**
	 * <p>方法功能描述：获取所有车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-15 下午11:09:07
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> allSpaceList();

	/**
	 * <p>方法功能描述：删除对应区块的车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午8:43:52
	 * @参数：@param zId    
	 * @返回类型：void   
	 * @throws
	 */
	public void deleteSpaceByZone(String zName);

	/**
	 * <p>方法功能描述：查询编号列表</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午10:24:39
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<String> allNumberList(Space dto);

	/**
	 * <p>方法功能描述：添加车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-16 下午11:02:18
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void addSpace(Space dto);

	/**
	 * <p>方法功能描述：删除车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 上午12:49:30
	 * @参数：@param sId    
	 * @返回类型：void   
	 * @throws
	 */
	public void deleteSpace(Integer sId);

	/**
	 * @param zName 
	 * <p>方法功能描述：查询属于区块的车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午10:05:27
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> selectSpaceByZone(String zName);

	/**
	 * <p>方法功能描述：查询所有车位属于区块的list</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午10:25:46
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> allZoneNameList();

	/**
	 * <p>方法功能描述：查询空余车位</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午11:47:40
	 * @参数：@return    
	 * @返回类型：List<Space>   
	 * @throws
	 */
	public List<Space> allFreeList();

	/**
	 * <p>方法功能描述：会员入场修改车位状态</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 上午12:03:44
	 * @参数：@param dc    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateUserState(Space dc);

	/**
	 * <p>方法功能描述：更新离场车位信息</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:38:33
	 * @参数：@param platenumber    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateLeave(String platenumber);
}
