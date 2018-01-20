package com.a2.ssm.service;

import java.util.HashMap;
import java.util.List;

import com.a2.ssm.model.OrderInfo;


/**
 * @author zy
 * OrderInfoService
 */
public interface OrderInfoService {

	public List<OrderInfo> list();
	
	/**
	 * <p>方法功能描述：通过id查询订单的list</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-5 下午2:01:45
	 * @参数：@param id
	 * @参数：@id
	 * @返回类型：List<OrderInfo>   
	 * @throws
	 */
	public List<OrderInfo> getById(int id);
	public void update(OrderInfo dto);
	public void delete(int id);
	public void save(OrderInfo dto);
	public List<OrderInfo> getByShopId(int shopid);
	public OrderInfo getByOId(int id);
	public void updateorder(OrderInfo dto);
	public List<OrderInfo> cxListShopId(HashMap<String, Object> map);
	public List<OrderInfo> cxListShopIdPage(HashMap<String, Object> map);
	
}
