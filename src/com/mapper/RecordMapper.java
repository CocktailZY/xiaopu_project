package com.mapper;

import java.util.List;

import com.model.Record;
import com.model.Space;

/**
 * <p>类名：RecordMapper</p>
 * <p>类功能描述：车辆出入记录的mapper</p>
 * @类作者：renguangqi
 * @创建时间：renguangqi-4-28 下午4:25:05
 */
public interface RecordMapper {
	
	/**
	 * <p>方法功能描述：查询返回所有的进出记录的list</p>
	 * @方法作者：renguangqi
	 * @创建时间：renguangqi-4-28 下午4:26:29
	 * @参数：@return    
	 * @返回类型：List<Record>   
	 * @throws
	 */
	public List<Record> recordList();


	/**
	 * <p>方法功能描述：会员入场</p>
	 * @方法作者：renguangqi
	 * @创建时间：renguangqi-5-19 上午12:16:17
	 * @参数：@param record    
	 * @返回类型：void   
	 * @throws
	 */
	public void userEnter(Record record);

	/**
	 * <p>方法功能描述：按照用户名查询出入记录</p>
	 * @方法作者：renguangqi
	 * @创建时间：renguangqi-5-19 下午2:27:15
	 * @参数：@return    
	 * @返回类型：List<Record>   
	 * @throws
	 */
	public List<Record> selectUserList(String selectString);

	/**
	 * <p>方法功能描述：按照车牌号查询出入记录</p>
	 * @方法作者：renguangqi
	 * @创建时间：renguangqi-5-19 下午2:27:58
	 * @参数：@param selectString
	 * @参数：@return    
	 * @返回类型：List<Record>   
	 * @throws
	 */
	public List<Record> selectPlatenumberList(String selectString);

	/**
	 * <p>方法功能描述：离场查询记录</p>
	 * @方法作者：renguangqi
	 * @创建时间：renguangqi-5-19 下午8:07:24
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：Record   
	 * @throws
	 */
	public List<Record> selectRecordByPlatenumber(Record dto);

	/**
	 * <p>方法功能描述：用户线上未支付记录</p>
	 * @方法作者：renguangqi
	 * @创建时间：renguangqi-5-19 下午8:50:34
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateUserLessRecord(Record dto);

	/**
	 * <p>方法功能描述：用户线上支付成功</p>
	 * @方法作者：renguangqi
	 * @创建时间：renguangqi-5-19 下午10:05:27
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateUserOkRecord(Record dto);

	/**
	 * <p>方法功能描述：临时保存</p>
	 * @方法作者：renguangqi
	 * @创建时间：renguangqi-5-19 下午10:26:04
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateTempRecord(Record dto);
}
