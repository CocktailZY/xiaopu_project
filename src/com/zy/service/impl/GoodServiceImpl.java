package com.zy.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.mapper.GoodImgMapper;
import com.zy.mapper.GoodMapper;
import com.zy.mapper.GoodMessageMapper;
import com.zy.mapper.GoodTypeMapper;
import com.zy.mapper.UserMapper;
import com.zy.model.ExpandModel;
import com.zy.model.Good;
import com.zy.model.GoodImg;
import com.zy.model.GoodMessage;
import com.zy.model.GoodType;
import com.zy.model.Role;
import com.zy.model.TableChange;
import com.zy.model.Tip;
import com.zy.model.User;
import com.zy.service.GoodService;

@Service
@Transactional
public class GoodServiceImpl implements GoodService {

	@Resource
	private GoodMapper goodMapper;
	
	@Resource
	private UserMapper userMapper;
	
	@Resource
	private GoodTypeMapper goodTypeMapper;
	
	@Resource
	private GoodMessageMapper goodMessageMapper;
	
	@Resource
	private GoodImgMapper goodImgMapper;
	
	public List<ExpandModel> list(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		List<ExpandModel> list = new ArrayList<ExpandModel>();
		List<Good> goodList = goodMapper.listAll(map);
		if(goodList.size() > 0){
			for(int i = 0 ; i < goodList.size(); i++){
				ExpandModel exModel = new ExpandModel();
				exModel.setGoodObj(goodList.get(i));
				exModel.setTypeObj(goodTypeMapper.getById(goodList.get(i).getGoodTypeId()));
				List<GoodImg> listImg = goodImgMapper.listByGoodId(goodList.get(i).getGoodId());
				exModel.setImgObj(listImg.get(0));
				exModel.setImgClass("");
				exModel.setMsgObj(new GoodMessage());
				exModel.setTipObj(new Tip());
				exModel.setUserObj(new User());
				exModel.setTabObj(new TableChange());
				exModel.setRoleObj(new Role());
				
				list.add(exModel);
			}
		}
		return list;
	}

	public ExpandModel getById(int id) {
		// TODO Auto-generated method stub
		ExpandModel exModel = new ExpandModel();
		exModel.setGoodObj(goodMapper.getById(id));
		exModel.setTypeObj(goodTypeMapper.getById(goodMapper.getById(id).getGoodTypeId()));
		
		exModel.setImgClass("");
		exModel.setImgObj(new GoodImg());
		exModel.setMsgObj(new GoodMessage());
		exModel.setUserObj(new User());
		exModel.setTipObj(new Tip());
		exModel.setTabObj(new TableChange());
		exModel.setRoleObj(new Role());
		return exModel;
	}

	public Good update(Good dto) {
		// TODO Auto-generated method stub
		int i = goodMapper.update(dto);
		if(i != 0){
			return dto;
		}else{
			return null;
		}
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return goodMapper.delete(id);
	}	

	public Good save(Good dto) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String onTime = sdf.format(new Date());
		dto.setOnTime(onTime);
		
		int goodId = goodMapper.save(dto);
		Good goodObj = goodMapper.getById(dto.getGoodId());
		return goodObj;
		
	}

	//-------------------Extend--------------------------------
	public List<ExpandModel> mohuList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Good> mohuList = goodMapper.mohuList(map);
		List<ExpandModel> list = new ArrayList<ExpandModel>();
		for(int i = 0 ; i < mohuList.size() ; i++){
			ExpandModel exModel = new ExpandModel();
			exModel.setGoodObj(mohuList.get(i));
			exModel.setImgObj(goodImgMapper.listByGoodId(mohuList.get(i).getGoodId()).get(0));
			
			exModel.setImgClass("");
			exModel.setTypeObj(new GoodType());
			exModel.setMsgObj(new GoodMessage());
			exModel.setUserObj(new User());
			exModel.setTipObj(new Tip());
			exModel.setTabObj(new TableChange());
			exModel.setRoleObj(new Role());
			
			
			list.add(exModel);
		}
		return list;
	}

	public User getUserInfo(int goodId) {
		Good goodObj = goodMapper.getById(goodId);
		User userinfo = userMapper.getById(goodObj.getUserId());
		return userinfo;
	}

	public GoodType getGoodByGoodTypeName(String typeName) {
		// TODO Auto-generated method stub
		return goodTypeMapper.getByName(typeName);
	}

	public List<ExpandModel> getGoodMessage(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		List<ExpandModel> exModel = new ArrayList<ExpandModel>();
		List<GoodMessage> msgList = goodMessageMapper.getByGoodId(map);
		for(int i = 0 ; i < msgList.size();i++){
			ExpandModel eModel = new ExpandModel();
			User userObj = userMapper.getById(msgList.get(i).getUserId());
			eModel.setMsgObj(msgList.get(i));
			eModel.setUserObj(userObj);
			
			eModel.setImgClass("");
			eModel.setImgObj(new GoodImg());
			eModel.setGoodObj(new Good());
			eModel.setTypeObj(new GoodType());
			eModel.setTipObj(new Tip());
			eModel.setTabObj(new TableChange());
			eModel.setRoleObj(new Role());
			exModel.add(eModel);
		}
		return exModel;
	}

}
