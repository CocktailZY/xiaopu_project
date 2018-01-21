package com.mapper;

/**
 * <p>类名：InvoiceMapper</p>
 * <p>类功能描述：计费的mapper</p>
 * @类作者：renguangqi
 * @创建时间：2018-4-28 下午4:21:35
 */
public interface InvoiceMapper {
	
	/**
	 * <p>方法功能描述：查询当前系统日期收入的金额总和</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-4-28 下午4:20:59
	 * @参数：@param date
	 * @参数：@return    
	 * @返回类型：Integer   
	 * @throws
	 */
	public Integer nowDateMoney(String date);
}
