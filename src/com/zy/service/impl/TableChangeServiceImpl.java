package com.zy.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.mapper.GoodMapper;
import com.zy.mapper.TableChangeMapper;
import com.zy.mapper.UserMapper;
import com.zy.model.ExpandModel;
import com.zy.model.Good;
import com.zy.model.GoodImg;
import com.zy.model.GoodMessage;
import com.zy.model.GoodType;
import com.zy.model.Role;
import com.zy.model.TableChange;
import com.zy.model.Tip;
import com.zy.service.TableChangeService;
import com.zy.util.JsonUtil;
import com.zy.util.UserUtil;

@Service
@Transactional
public class TableChangeServiceImpl implements TableChangeService {

	@Resource
	private TableChangeMapper tableChangeMapper;
	@Resource
	private UserMapper userMapper;
	@Resource
	private GoodMapper goodMapper;
	
	public List<ExpandModel> list(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		List<ExpandModel> list = new ArrayList<ExpandModel>();
		List<TableChange> tabList = tableChangeMapper.listAll(map);
		for(int i = 0 ; i < tabList.size(); i++){
			ExpandModel exModel = new ExpandModel();
			exModel.setTabObj(tabList.get(i));
			exModel.setUserObj(userMapper.getById(tabList.get(i).getFromId()));
			exModel.setGoodObj(goodMapper.getById(tabList.get(i).getGoodId()));
			
			exModel.setTypeObj(new GoodType());
			exModel.setImgClass("");
			exModel.setImgObj(new GoodImg());
			exModel.setMsgObj(new GoodMessage());
			exModel.setTipObj(new Tip());
			exModel.setRoleObj(new Role());
			
			list.add(exModel);
		}
		return list;
	}

	public TableChange getById(int id) {
		// TODO Auto-generated method stub
		return tableChangeMapper.getById(id);
	}

	public void update(TableChange dto) {
		// TODO Auto-generated method stub
		 tableChangeMapper.update(dto);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		tableChangeMapper.delete(id);
	}

	public TableChange save(TableChange dto) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String orderTime = sdf.format(new Date());
		String mark = "new";
		
		dto.setOrderTime(orderTime);
		dto.setMark(mark);
		dto.setStatus(0);
		
		int tableId = tableChangeMapper.save(dto);
		if(tableId != 0){
			TableChange tableObj = tableChangeMapper.getById(tableId);
			return tableObj;
		}else{
			return null;
		}
		 
	}
	
	public TableChange saveCart(String ids,String userid){
		String[] goodids = ids.split(",");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String orderTime = sdf.format(new Date());
		String mark = "new";
		
		int tableId = 0;
		for(int i = 0 ; i < goodids.length ; i++){
			Good gDto = new Good();
			gDto = goodMapper.getById(Integer.parseInt(goodids[i]));
			gDto.setStatus(2);//预定
			goodMapper.update(gDto);
			
			TableChange dto = new TableChange();
			dto.setOrderTime(orderTime);
			dto.setMark(mark);
			dto.setStatus(0);
			dto.setGoodId(Integer.parseInt(goodids[i]));
			dto.setUserId(goodMapper.getById(Integer.parseInt(goodids[i])).getUserId());
			dto.setFromId(Integer.parseInt(userid));
			tableChangeMapper.save(dto);
			tableId = dto.getTableId();
		}
		
		if(tableId != 0){
			TableChange tableObj = tableChangeMapper.getById(tableId);
			return tableObj;
		}else{
			return null;
		}
	}

	public String tableCheck(TableChange dto) {
		// TODO Auto-generated method stub
		dto.setMark("new");
		TableChange tableObj = tableChangeMapper.tableCheck(dto);
		String result;
		if(null != tableObj){
			result = "have";
		}else{
			result = "no_have";
		}
		return result;
	}

	public JSONArray tableGetTime(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		JSONArray jsonObj = new JSONArray();
		List<TableChange> timeList = tableChangeMapper.tableGetTime();//外层循环
		for(int i = 0 ; i < timeList.size(); i++){
			JSONObject json = new JSONObject();
			String timeSplit = timeList.get(i).getOrderTime().substring(0, 10);
			map.put("orderTime", timeSplit);
			
			List<ExpandModel> list = new ArrayList<ExpandModel>();
			List<TableChange> tabList = tableChangeMapper.likeByTime(map);//内层循环
			for(int j = 0 ; j < tabList.size(); j++){
				ExpandModel exModel = new ExpandModel();
				exModel.setTabObj(tabList.get(j));
				exModel.setUserObj(userMapper.getById(tabList.get(j).getFromId()));
				exModel.setGoodObj(goodMapper.getById(tabList.get(j).getGoodId()));
				
				exModel.setTypeObj(new GoodType());
				exModel.setImgClass("");
				exModel.setImgObj(new GoodImg());
				exModel.setMsgObj(new GoodMessage());
				exModel.setTipObj(new Tip());
				exModel.setRoleObj(new Role());
				
				list.add(exModel);
			}
			
			json.put("byTime", timeSplit);
			json.put("tabList", list);
			json.put("show","false");
			
			if(list.size() != 0){
				jsonObj.add(json);
			}
		}
		return jsonObj;
	}
	
	public JSONArray tableGetTimeMy(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		JSONArray jsonObj = new JSONArray();
		List<TableChange> timeList = tableChangeMapper.tableGetTime();//外层循环
		for(int i = 0 ; i < timeList.size(); i++){
			JSONObject json = new JSONObject();
			String timeSplit = timeList.get(i).getOrderTime().substring(0, 10);
			map.put("orderTime", timeSplit);
			
			List<ExpandModel> list = new ArrayList<ExpandModel>();
			List<TableChange> tabList = tableChangeMapper.likeByTimeMy(map);//内层循环
			for(int j = 0 ; j < tabList.size(); j++){
				ExpandModel exModel = new ExpandModel();
				exModel.setTabObj(tabList.get(j));
				exModel.setUserObj(userMapper.getById(tabList.get(j).getFromId()));
				exModel.setGoodObj(goodMapper.getById(tabList.get(j).getGoodId()));
				
				exModel.setTypeObj(new GoodType());
				exModel.setImgClass("");
				exModel.setImgObj(new GoodImg());
				exModel.setMsgObj(new GoodMessage());
				exModel.setTipObj(new Tip());
				exModel.setRoleObj(new Role());
				
				list.add(exModel);
			}
			
			json.put("byTime", timeSplit);
			json.put("tabList", list);
			json.put("show","false");
			if(list.size() != 0){
				jsonObj.add(json);
			}
		}
		return jsonObj;
	}

	public void updateStatus(TableChange dto) {
		dto.setMark("old");
		Good gDto = goodMapper.getById(tableChangeMapper.getById(dto.getTableId()).getGoodId());
		gDto.setStatus(0);
		goodMapper.update(gDto);
		tableChangeMapper.updateStatus(dto);
	}
	
	public void  cansleStatus(TableChange dto){
		Good gDto = goodMapper.getById(tableChangeMapper.getById(dto.getTableId()).getGoodId());
		gDto.setStatus(1);
		goodMapper.update(gDto);
		tableChangeMapper.delete(dto.getTableId());
	}
	
	public JSONArray tableComplete(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		JSONArray jsonObj = new JSONArray();
		List<TableChange> timeList = tableChangeMapper.tableGetTime();//外层循环
		for(int i = 0 ; i < timeList.size(); i++){
			JSONObject json = new JSONObject();
			String timeSplit = timeList.get(i).getOrderTime().substring(0, 10);
			map.put("orderTime", timeSplit);
			map.remove("userId");
			JSONArray jsonArr = new JSONArray();
			List<TableChange> cleanTabList = new ArrayList<TableChange>();
			List<TableChange> tabList = tableChangeMapper.likeByTime(map);//内层循环,找出了所有这个时间下的订单
			cleanTabList = tabList;
			for  ( int  q  =   0 ; q  <  tabList.size()  -   1 ; q ++ )   { 
			    for  ( int  w  =  cleanTabList.size()  -   1 ; w  >  i; w -- )   { 
			      if  (cleanTabList.get(w).getUserId() == tabList.get(q).getUserId())   { 
			    	  cleanTabList.remove(w); 
			      } 
			    } 
			  } 
			
			for(int j = 0 ; j < cleanTabList.size(); j++){
				JSONObject jsonUser = new JSONObject();
				jsonUser.put("userName", userMapper.getById(tabList.get(j).getUserId()).getUserName());
				jsonUser.put("phone", userMapper.getById(tabList.get(j).getUserId()).getPhone());
				map.put("userId", tabList.get(j).getUserId());
				
				List<ExpandModel> list = new ArrayList<ExpandModel>();
				List<TableChange> tabUserList = tableChangeMapper.likeByTime(map);//内层循环,找出了所有这个时间下某个卖家的订单
				for(int k = 0 ; k < tabUserList.size() ; k++){
					ExpandModel exModel = new ExpandModel();
					exModel.setTabObj(tabUserList.get(k));
					exModel.setUserObj(userMapper.getById(tabUserList.get(k).getFromId()));
					exModel.setGoodObj(goodMapper.getById(tabUserList.get(k).getGoodId()));
					
					exModel.setTypeObj(new GoodType());
					exModel.setImgClass("");
					exModel.setImgObj(new GoodImg());
					exModel.setMsgObj(new GoodMessage());
					exModel.setTipObj(new Tip());
					exModel.setRoleObj(new Role());
					
					list.add(exModel);
				}
				jsonUser.put("goodList", list);
				jsonArr.add(jsonUser);
			}
			
			json.put("byTime", timeSplit);
			json.put("tabList", jsonArr);
			json.put("show","false");
			
			jsonObj.add(json);
		}
		return jsonObj;
	}

	public List<TableChange> list() {
		// TODO Auto-generated method stub
		return tableChangeMapper.list();
	}

}
