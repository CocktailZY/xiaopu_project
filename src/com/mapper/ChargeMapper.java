package com.mapper;

import java.util.List;

import com.model.Charge;

/**
 * <p>类名：ChargeMapper</p>
 * <p>类功能描述：收费规则的Mapper</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午4:16:05
 */
public interface ChargeMapper {
	
	/**
	 * <p>方法功能描述：查询返回所有收费规则的list</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-4-28 下午4:16:22
	 * @参数：@return    
	 * @返回类型：List<Charge>   
	 * @throws
	 */
	public List<Charge> allChargeList();

	/**
	 * <p>方法功能描述：添加收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-7 下午8:42:19
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void addCharge(Charge dto);

	/**
	 * <p>方法功能描述：删除收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-7 下午8:53:05
	 * @参数：@param cId    
	 * @返回类型：void   
	 * @throws
	 */
	public void deleteCharge(Integer chId);

	/**
	 * <p>方法功能描述：查询临时卡收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-13 上午10:05:29
	 * @参数：@return    
	 * @返回类型：List<Charge>   
	 * @throws
	 */
	public List<Charge> allInterimList();

	/**
	 * <p>方法功能描述：查询会员卡收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-13 上午10:05:44
	 * @参数：@return    
	 * @返回类型：List<Charge>   
	 * @throws
	 */
	public List<Charge> allMemberList();

	/**
	 * <p>方法功能描述：会员按小时收费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午8:19:31
	 * @参数：@return    
	 * @返回类型：Charge   
	 * @throws
	 */
	public Charge userHourCharge();

	/**
	 * <p>方法功能描述：用户按天收费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午8:26:26
	 * @参数：@return    
	 * @返回类型：Charge   
	 * @throws
	 */
	public Charge userDayCharge();

	/**
	 * <p>方法功能描述：临时按小时收费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:25:16
	 * @参数：@return    
	 * @返回类型：Charge   
	 * @throws
	 */
	public Charge tempHourCharge();

	/**
	 * <p>方法功能描述：临时按天收费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:25:28
	 * @参数：@return    
	 * @返回类型：Charge   
	 * @throws
	 */
	public Charge tempDayCharge();
}
