package com.zy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.mapper.CartMapper;
import com.zy.mapper.GoodMapper;
import com.zy.mapper.UserMapper;
import com.zy.model.Cart;
import com.zy.model.CartExtend;
import com.zy.model.Good;
import com.zy.model.User;
import com.zy.service.CartService;

@Service
@Transactional
public class CartServiceImpl implements CartService {

	@Resource
	private CartMapper cartMapper;
	@Resource
	private GoodMapper goodMapper;
	@Resource
	private UserMapper userMapper;

	public List<Cart> listAll() {
		// TODO Auto-generated method stub
		return cartMapper.listAll();
	}

	public Cart getById(int id) {
		// TODO Auto-generated method stub
		return cartMapper.getById(id);
	}

	public int update(Cart dto) {
		// TODO Auto-generated method stub
		return cartMapper.update(dto);
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return cartMapper.delete(id);
	}

	public Cart save(Cart dto) {
		// TODO Auto-generated method stub
		int flag = 0;
		Cart cartObj = cartMapper.getByGoodId(dto.getGoodId());
		if (null != cartObj) {
			cartObj.setNum(cartObj.getNum() + dto.getNum());
			cartObj.setTotal(String.valueOf(cartObj.getNum()
					* (Double.parseDouble(goodMapper.getById(dto.getGoodId())
							.getPrice()))));
			flag = cartMapper.update(cartObj);
		} else {
			flag = cartMapper.save(dto);
		}
		if (flag == 1) {
			return dto;
		} else {
			return null;
		}
	}

	public JSONArray listByUserId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Cart> listByUserId = cartMapper.listByUserId(map);
		
		JSONArray allList = new JSONArray();
		for (int i = 0; i < listByUserId.size(); i++) {
			JSONObject jsonObj = new JSONObject();
			Good good = goodMapper.getById(listByUserId.get(i).getGoodId());
			JSONArray jsonArr = new JSONArray();
			int goodUserId = good.getUserId();
			for(int j = 0;j<listByUserId.size();j++){
				int userId =  goodMapper.getById(listByUserId.get(j).getGoodId()).getUserId();
					if(userId == goodUserId){
						CartExtend cex = new CartExtend();
						cex.setGoodObj(goodMapper.getById(listByUserId.get(j).getGoodId()));// 查出商品信息，单价
						cex.setUserObj(userMapper.getById(cex.getGoodObj().getUserId()));// 查出卖家信息
						cex.setCartObj(listByUserId.get(j));// 放入num和total
//						JSONObject flagCheckBox = new JSONObject();//复选框
//						flagCheckBox.put("isSelected", false);
//						flagCheckBox.put("cart_goods", cex);
						jsonArr.add(cex);
					}
			}
			for(int num = 0;num < listByUserId.size();num++){
				int id =  goodMapper.getById(listByUserId.get(num).getGoodId()).getUserId();
				if(id == goodUserId){
					listByUserId.remove(num);
					num--;
				}
			}
			jsonObj.put("userNm", userMapper.getById(goodUserId).getUserName());
			jsonObj.put("goodList", jsonArr);
			allList.add(jsonObj);
			i--;
		}

		return allList;
	}

}
