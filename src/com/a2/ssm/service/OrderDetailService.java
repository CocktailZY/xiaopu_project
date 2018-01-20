package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.OrderDetail;


/**
 * @author zy
 * OrderDetailService
 */
public interface OrderDetailService {

	public List<OrderDetail> list();
	
	/**
	 * <p>方法功能描述：通过id查询订单详情的list</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-5 下午2:02:38
	 * @参数：@param id
	 * @参数：@id    
	 * @返回类型：List<OrderDetail>   
	 * @throws
	 */
	public List<OrderDetail> getById(int id);
	public void update(OrderDetail dto);
	public void delete(int id);
	public void save(OrderDetail dto);
	public List<OrderDetail> getByOrderId(int id);
}
