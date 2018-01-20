package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.OrderDetail;


/**
 * @author zy
 * OrderDetailMapper
 */
public interface OrderDetailMapper {

	public List<OrderDetail> list();
	public List<OrderDetail> getById(int id);
	public void update(OrderDetail dto);
	public void delete(int id);
	public void save(OrderDetail dto);
	public List<OrderDetail> getByOrderId(int id);
	
}
