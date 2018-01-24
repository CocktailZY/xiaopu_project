package com.zy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.mapper.GoodMapper;
import com.zy.mapper.TipMapper;
import com.zy.mapper.UserMapper;
import com.zy.model.ExpandModel;
import com.zy.model.GoodImg;
import com.zy.model.GoodMessage;
import com.zy.model.GoodType;
import com.zy.model.Role;
import com.zy.model.ShopGuide;
import com.zy.model.TableChange;
import com.zy.model.Tip;
import com.zy.service.TipService;

@Service
@Transactional
public class TipServiceImpl implements TipService {

	@Resource
	private TipMapper tipMapper;
	@Resource
	private GoodMapper goodMapper;
	@Resource
	private UserMapper userMapper;
	
	public List<ExpandModel> list(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		List<ExpandModel> list = new ArrayList<ExpandModel>();
		
		List<Tip> tipList = tipMapper.listAll(map);
		for(int i = 0 ; i < tipList.size() ; i++){
			ExpandModel exModel = new ExpandModel();
			Tip tip = tipList.get(i);
			exModel.setTipObj(tip);
			exModel.setGoodObj(goodMapper.getById(tip.getGoodId()));
			exModel.setUserObj(userMapper.getById(tip.getFromId()));
			
			exModel.setImgClass("");
			exModel.setImgObj(new GoodImg());
			exModel.setMsgObj(new GoodMessage());
			exModel.setTypeObj(new GoodType());
			exModel.setTabObj(new TableChange());
			exModel.setRoleObj(new Role());
			
			list.add(exModel);
		}
		
		return list;
	}

	public Tip getById(int id) {
		// TODO Auto-generated method stub
		return tipMapper.getById(id);
	}

	public void update(Tip dto) {
		// TODO Auto-generated method stub
		tipMapper.update(dto);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		tipMapper.delete(id);
	}

	public void save(Tip dto) {
		// TODO Auto-generated method stub
		tipMapper.save(dto);
	}
	//----------------------------Extend--------------------------------------------
	public JSONArray tableGetTime(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		JSONArray jsonObj = new JSONArray();
		List<Tip> timeList = tipMapper.tipGetTime();//外层循环
		
		for(int i = 0 ; i < timeList.size(); i++){
			JSONObject json = new JSONObject();
			String timeSplit = timeList.get(i).getCreateTime().substring(0, 10);
			map.put("createTime", timeSplit);
			
			List<ExpandModel> list = new ArrayList<ExpandModel>();
			List<Tip> tabList = tipMapper.likeByTime(map);//内层循环
			for(int j = 0 ; j < tabList.size(); j++){
				ExpandModel exModel = new ExpandModel();
				exModel.setTipObj(tabList.get(j));
				exModel.setUserObj(userMapper.getById(tabList.get(j).getFromId()));
				exModel.setGoodObj(goodMapper.getById(tabList.get(j).getGoodId()));
				
				exModel.setTabObj(new TableChange());
				exModel.setTypeObj(new GoodType());
				exModel.setImgClass("");
				exModel.setImgObj(new GoodImg());
				exModel.setMsgObj(new GoodMessage());
				exModel.setRoleObj(new Role());
				
				list.add(exModel);
			}
			
			json.put("byTime", timeSplit);
			json.put("tabList", list);
			json.put("show","false");
			
			jsonObj.add(json);
		}
		
		return jsonObj;
	}

	public int allReadGuide(Tip dto) {
		// TODO Auto-generated method stub
		return tipMapper.allReadGuide(dto);
	}
	
}
