package com.service;

import java.util.List;

import com.model.Card;

/**
 * <p>类名：ChargeService</p>
 * <p>类功能描述：收费规则的service</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午5:01:50
 */
public interface CardService {

	/**
	 * <p>方法功能描述：查询所有会员卡信息</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午2:25:28
	 * @参数：@return    
	 * @返回类型：List<Card>   
	 * @throws
	 */
	List<Card> allCardList();

	/**
	 * <p>方法功能描述：添加会员卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:05:40
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	void addCard(Card dto);

	/**
	 * <p>方法功能描述：根据会员卡号查询余额</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:21:49
	 * @参数：@param cNumber
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	String selectMoneyBycNumber(String cNumber);

	/**
	 * <p>方法功能描述：充值</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:26:09
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	void addMoney(Card dto);

	/**
	 * <p>方法功能描述：删除会员卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:34:23
	 * @参数：@param cId    
	 * @返回类型：void   
	 * @throws
	 */
	void deleteCard(Integer cId);

	/**
	 * <p>方法功能描述：修改会员卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:41:26
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	void updateCard(Card dto);

	/**
	 * @param selectString 
	 * <p>方法功能描述：卡号查询会员卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:53:42
	 * @参数：@return    
	 * @返回类型：List<Card>   
	 * @throws
	 */
	List<Card> selectNumberList(String selectString);

	/**
	 * <p>方法功能描述：用户名查询</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午10:03:48
	 * @参数：@param selectString
	 * @参数：@return    
	 * @返回类型：List<Card>   
	 * @throws
	 */
	List<Card> selectUserList(String selectString);

	/**
	 * <p>方法功能描述：车牌号查询</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午10:04:06
	 * @参数：@param selectString
	 * @参数：@return    
	 * @返回类型：List<Card>   
	 * @throws
	 */
	List<Card> selectPlatenumberList(String selectString);

	/**
	 * <p>方法功能描述：根据车牌号查询会员卡信息</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午6:22:17
	 * @参数：@param userPlatenumber
	 * @参数：@return    
	 * @返回类型：Card   
	 * @throws
	 */
	Card selectByPlatenumber(String userPlatenumber);

	/**
	 * <p>方法功能描述：退款</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午9:54:23
	 * @参数：@param cNumber    
	 * @返回类型：void   
	 * @throws
	 */
	void reduceMoney(String cNumber);

	/**
	 * <p>方法功能描述：用户入场修改卡信息</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 上午12:10:52
	 * @参数：@param card    
	 * @返回类型：void   
	 * @throws
	 */
	void updateUserEnter(Card card);

	/**
	 * <p>方法功能描述：临时卡入场生成随机卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 上午11:55:12
	 * @参数：@param card
	 * @返回类型：void
	 * @throws
	 */
	void addTempCard(Card card);

	/**
	 * <p>方法功能描述：用户扣费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:01:49
	 * @参数：@param lessMoney    
	 * @返回类型：void   
	 * @throws
	 */
	void updateUserMoney(Card userCard);

	/**
	 * <p>方法功能描述：删除临时卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:33:24
	 * @参数：@param getrPlatenumber    
	 * @返回类型：void   
	 * @throws
	 */
	void deleteTemp(String getrPlatenumber);
	
	
	
}
