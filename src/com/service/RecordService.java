package com.service;

import java.util.List;

import com.model.Record;
import com.model.Space;

/**
 * <p>类名：RecordService</p>
 * <p>类功能描述：出入记录的service</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午5:14:49
 */
public interface RecordService {
	
	/**
	 * <p>方法功能描述：查询所有车辆出入记录</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-4-28 下午5:15:42
	 * @参数：@return    
	 * @返回类型：List<Record>   
	 * @throws
	 */
	public List<Record> recordList();

	
	/**
	 * <p>方法功能描述：会员入场</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 上午12:15:20
	 * @参数：@param record    
	 * @返回类型：void   
	 * @throws
	 */
	public void userEnter(Record record);

	/**
	 * <p>方法功能描述：按照用户名查询出入记录</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午2:25:00
	 * @参数：@param selectString
	 * @参数：@return    
	 * @返回类型：List<Record>   
	 * @throws
	 */
	public List<Record> selectUserList(String selectString);

	/**
	 * <p>方法功能描述：按照车牌号查询出入记录</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午2:25:20
	 * @参数：@param selectString
	 * @参数：@return    
	 * @返回类型：List<Record>   
	 * @throws
	 */
	public List<Record> selectPlatenumberList(String selectString);

	/**
	 * <p>方法功能描述：离场查询记录</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午8:06:17
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：Record   
	 * @throws
	 */
	public List<Record> selectRecordByPlatenumber(Record dto);

	/**
	 * <p>方法功能描述：保存用户线上未支付</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午8:49:08
	 * @参数：    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateUserLessRecord(Record dto);

	/**
	 * <p>方法功能描述：用户付费成功</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:01:24
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateUserOkRecord(Record dto);

	/**
	 * <p>方法功能描述：保存临时记录</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:24:34
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateTempRecord(Record dto);


}
