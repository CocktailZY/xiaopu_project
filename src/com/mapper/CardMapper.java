package com.mapper;

import java.util.List;

import com.model.Card;

public interface CardMapper {

	/**
	 * <p>方法功能描述：查询所有会员卡信息</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午2:27:09
	 * @参数：@return    
	 * @返回类型：List<Card>   
	 * @throws
	 */
	List<Card> allCardList();

	/**
	 * <p>方法功能描述：添加会员卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:06:18
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	void addCard(Card dto);

	/**
	 * <p>方法功能描述：根据会员卡号查询余额</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:23:54
	 * @参数：@param cNumber
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	String selectMoneyBycNumber(String cNumber);

	/**
	 * <p>方法功能描述：充值</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:26:45
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	void addMoney(Card dto);

	/**
	 * <p>方法功能描述：删除会员卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:34:59
	 * @参数：@param cId    
	 * @返回类型：void   
	 * @throws
	 */
	void deleteCard(Integer cId);

	/**
	 * <p>方法功能描述：修改会员卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:42:00
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	void updateCard(Card dto);

	/**
	 * @param selectString 
	 * <p>方法功能描述：按卡号查询会员卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午9:54:33
	 * @参数：@return    
	 * @返回类型：List<Card>   
	 * @throws
	 */
	List<Card> selectNumberList(String selectString);

	/**
	 * <p>方法功能描述：用户查询</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午10:05:13
	 * @参数：@param selectString
	 * @参数：@return    
	 * @返回类型：List<Card>   
	 * @throws
	 */
	List<Card> selectUserList(String selectString);

	/**
	 * <p>方法功能描述：车牌号查询</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-17 下午10:05:22
	 * @参数：@param selectString
	 * @参数：@return    
	 * @返回类型：List<Card>   
	 * @throws
	 */
	List<Card> selectPlatenumberList(String selectString);

	/**
	 * <p>方法功能描述：根据车牌号查询会员卡信息</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午6:23:59
	 * @参数：@param userPlatenumber
	 * @参数：@return    
	 * @返回类型：Card   
	 * @throws
	 */
	Card selectByPlatenumber(String userPlatenumber);

	/**
	 * <p>方法功能描述：退款</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-18 下午9:55:06
	 * @参数：@param cNumber    
	 * @返回类型：void   
	 * @throws
	 */
	void reduceMoney(String cNumber);

	/**
	 * <p>方法功能描述：会员入场修改卡信息</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 上午12:11:39
	 * @参数：@param card    
	 * @返回类型：void   
	 * @throws
	 */
	void updateUserEnter(Card card);

	/**
	 * <p>方法功能描述：临时卡生成</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 上午11:58:47
	 * @参数：@param card    
	 * @返回类型：void   
	 * @throws
	 */
	void addTempCard(Card card);

	/**
	 * <p>方法功能描述：用户扣费</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:04:20
	 * @参数：@param allMoney    
	 * @返回类型：void   
	 * @throws
	 */
	void updateUserMoney(Card userCard);

	/**
	 * <p>方法功能描述：删除临时卡</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-19 下午10:33:57
	 * @参数：@param getrPlatenumber    
	 * @返回类型：void   
	 * @throws
	 */
	void deleteTemp(String getrPlatenumber);
	
	
}
