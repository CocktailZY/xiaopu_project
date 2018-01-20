package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.CartMapper;
import com.a2.ssm.model.Cart;
import com.a2.ssm.service.CartService;

@Service
@Transactional
public class CartServiceImpl implements CartService {

	@Resource
	private CartMapper cartMapper;
	
	public List<Cart> list() {
		List<Cart> cartList =cartMapper.list();
		return cartList;
	}

	public List<Cart> getById(int id) {
		List<Cart> cartList=(List<Cart>) cartMapper.getById(id);
		return cartList;
	}

	public void update(Cart dto) {
		cartMapper.update(dto);
	}

	public void delete(int id) {
		cartMapper.delete(id);
	}

	public void save(Cart dto) {
		cartMapper.save(dto);
	}

}
