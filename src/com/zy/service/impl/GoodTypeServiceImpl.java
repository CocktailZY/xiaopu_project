package com.zy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.Consts;
import com.zy.mapper.GoodTypeMapper;
import com.zy.model.ExpandModel;
import com.zy.model.Good;
import com.zy.model.GoodImg;
import com.zy.model.GoodMessage;
import com.zy.model.GoodType;
import com.zy.model.Role;
import com.zy.model.TableChange;
import com.zy.model.Tip;
import com.zy.model.User;
import com.zy.service.GoodTypeService;

@Service
@Transactional
public class GoodTypeServiceImpl implements GoodTypeService {

	@Resource
	private GoodTypeMapper goodTypeMapper;
	
	public List<GoodType> list(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return goodTypeMapper.listAll(map);
	}

	public GoodType getById(int id) {
		// TODO Auto-generated method stub
		return goodTypeMapper.getById(id);
	}

	public GoodType update(GoodType dto) {
		// TODO Auto-generated method stub
		int mark = goodTypeMapper.update(dto);
		if(mark == 1){
			return dto;
		}else{
			return null;
		}
		
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return goodTypeMapper.delete(id);
	}

	public GoodType save(GoodType dto) {
		// TODO Auto-generated method stub
		int mark = goodTypeMapper.save(dto);
		if(mark == 1){
			return dto;
		}else{
			return null;
		}
	}
//-----------------------Extend-----------------------
	public GoodType getByName(String name) {
		// TODO Auto-generated method stub
		return goodTypeMapper.getByName(name);
	}
	
	public List<ExpandModel> addImgClass(List<GoodType> list){
		List<ExpandModel> exModel = new ArrayList<ExpandModel>();
		for(int i = 0 ; i < list.size();i++){
			ExpandModel eModel = new ExpandModel();
			eModel.setTypeObj(list.get(i));
			eModel.setImgClass(Consts.IMG_CLASS[i]);
			
			eModel.setGoodObj(new Good());
			eModel.setImgObj(new GoodImg());
			eModel.setMsgObj(new GoodMessage());
			eModel.setUserObj(new User());
			eModel.setTipObj(new Tip());
			eModel.setTabObj(new TableChange());
			eModel.setRoleObj(new Role());
			
			exModel.add(eModel);
		}
		return exModel;
	}

	public List<GoodType> list() {
		// TODO Auto-generated method stub
		return goodTypeMapper.list();
	}

	public List<GoodType> pageListAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<GoodType> typeList = goodTypeMapper.pageListAll(map);
		return typeList;
	}

}
