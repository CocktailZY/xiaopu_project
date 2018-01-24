package com.zy.service;

import java.util.HashMap;
import java.util.List;

import com.zy.model.ExpandModel;
import com.zy.model.Good;
import com.zy.model.GoodMessage;
import com.zy.model.GoodType;
import com.zy.model.User;

public interface GoodService {
	public List<ExpandModel> list(HashMap<String,Object> map);
	public ExpandModel getById(int id);
	public Good update(Good dto);
	public int delete(int id);
	public Good save(Good dto);
	
	//-------------------Extend------------------------
	/**
	 * 模糊查询
	 * @param map
	 * @return
	 * List<Good>
	 * @author Administrator
	 * 下午9:27:09
	 */
	public List<ExpandModel> mohuList(HashMap<String,Object> map);
	/**
	 * 根据goodid获取卖家用户信息
	 * @param goodId
	 * @return
	 * User
	 * @author Administrator
	 * 下午9:25:08
	 */
	public User getUserInfo(int goodId);
	
	/**
	 * 根据类型名称获取类型对象
	 * @param typeName
	 * @return
	 * GoodType
	 * @author Administrator
	 * 下午9:30:50
	 */
	public GoodType getGoodByGoodTypeName(String typeName);
	
	/**
	 * 根据商品id获取该商品留言
	 * @param goodId
	 * @return
	 * List<ExpandModel>
	 * @author Administrator
	 * 下午9:35:58
	 */
	public List<ExpandModel> getGoodMessage(HashMap<String,Object> map);
	
}
