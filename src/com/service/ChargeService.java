package com.service;

import java.util.List;

import com.model.Charge;

/**
 * <p>类名：ChargeService</p>
 * <p>类功能描述：收费规则的service</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午5:01:50
 */
public interface ChargeService {
	

	/**
	 * <p>方法功能描述：添加收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-7 下午8:41:36
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void addCharge(Charge dto);

	/**
	 * <p>方法功能描述：删除收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-7 下午8:52:16
	 * @参数：@param cId    
	 * @返回类型：void   
	 * @throws
	 */
	public void deleteCharge(Integer chId);

	/**
	 * <p>方法功能描述：查询临时卡收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-13 上午9:54:00
	 * @参数：@return    
	 * @返回类型：List<Charge>   
	 * @throws
	 */
	public List<Charge> allInterimList();

	/**
	 * <p>方法功能描述：查询会员卡收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-13 上午9:54:20
	 * @参数：@return    
	 * @返回类型：List<Charge>   
	 * @throws
	 */
	public List<Charge> allMemberList();

	/**
	 * <p>方法功能描述：查询全部收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-13 下午9:37:06
	 * @参数：@return    
	 * @返回类型：List<Charge>   
	 * @throws
	 */
	public List<Charge> allChargeList();

	/**
	 * <p>方法功能描述：会员按小时收费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午8:18:50
	 * @参数：@return    
	 * @返回类型：Charge   
	 * @throws
	 */
	public Charge userHourCharge();

	/**
	 * <p>方法功能描述：会员按天收费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午8:25:46
	 * @参数：@return    
	 * @返回类型：Charge   
	 * @throws
	 */
	public Charge userDayCharge();

	/**
	 * <p>方法功能描述：临时按小时收费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:23:55
	 * @参数：@return    
	 * @返回类型：Charge   
	 * @throws
	 */
	public Charge tempHourCharge();

	/**
	 * <p>方法功能描述：临时按天收费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:24:13
	 * @参数：@return    
	 * @返回类型：Charge   
	 * @throws
	 */
	public Charge tempDayCharge();
	
}
