package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.OrderDetailMapper;
import com.a2.ssm.model.OrderDetail;
import com.a2.ssm.service.OrderDetailService;

@Service
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService {

	@Resource
	private OrderDetailMapper orderDetailMapper;
	
	public List<OrderDetail> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<OrderDetail> getById(int id) {
		return orderDetailMapper.getById(id);
	}

	public void update(OrderDetail dto) {
		// TODO Auto-generated method stub

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(OrderDetail dto) {
		// TODO Auto-generated method stub

	}

	public List<OrderDetail> getByOrderId(int id) {
		// TODO Auto-generated method stub
		return orderDetailMapper.getByOrderId(id);
	}

}
