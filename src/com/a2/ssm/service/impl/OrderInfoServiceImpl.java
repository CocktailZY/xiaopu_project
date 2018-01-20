package com.a2.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.OrderInfoMapper;
import com.a2.ssm.model.OrderInfo;
import com.a2.ssm.service.OrderInfoService;

@Service
@Transactional
public class OrderInfoServiceImpl implements OrderInfoService {

	@Resource
	private OrderInfoMapper orderInfoMapper;
	
	public List<OrderInfo> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<OrderInfo> getById(int id) {
		return orderInfoMapper.getById(id);
	}

	public void update(OrderInfo dto) {
		orderInfoMapper.update(dto);

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(OrderInfo dto) {
		// TODO Auto-generated method stub

	}

	public List<OrderInfo> getByShopId(int shopid) {
		// TODO Auto-generated method stub
		return orderInfoMapper.getByShopId(shopid);
	}

	public OrderInfo getByOId(int id) {
		// TODO Auto-generated method stub
		return orderInfoMapper.getByOId(id);
	}

	public void updateorder(OrderInfo dto) {
		orderInfoMapper.updateorder(dto);
		
	}

	public List<OrderInfo> cxListShopId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderInfoMapper.cxListShopId(map);
	}

	public List<OrderInfo> cxListShopIdPage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderInfoMapper.cxListShopIdPage(map);
	}

}
