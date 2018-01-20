package com.a2.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import com.a2.ssm.model.OrderInfo;


/**
 * @author zy
 * OrderInfoMapper
 */
public interface OrderInfoMapper {

	public List<OrderInfo> list();
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
