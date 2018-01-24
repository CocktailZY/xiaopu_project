package com.zy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.Consts;
import com.zy.model.ExpandModel;
import com.zy.model.TableChange;
import com.zy.service.TableChangeService;
import com.zy.util.JsonUtil;
import com.zy.util.Page;

@Controller
@RequestMapping("/table")
public class TableController {

	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private TableChangeService tableChangeService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject list(String userid,String mark,String pageNum,String status,String fromid,HttpServletRequest request,HttpServletResponse response) {
		log.info(userid+"----"+mark);
		JSONObject json = new JSONObject();
		JSONArray jsonObj = new JSONArray();
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(null != userid && !"".equals(userid)){
			map.put("userId", userid);
		}
		if(null != mark && !"".equals(mark)){
			map.put("mark", mark);
		}
		if(null != status && !"".equals(status)){
			map.put("status", status);
		}
		if(null != fromid && !"".equals(fromid)){
			map.put("fromId", fromid);
		}
		jsonObj = tableChangeService.tableGetTime(map);
		if(jsonObj.size() != 0){
			int pageNumStr = 1;
			if (pageNum != null && !"".equals(pageNum)) {
				pageNumStr = Integer.parseInt(pageNum);
				Page page = new Page(jsonObj.size(),pageNumStr,Consts.PAGE_SIZE);
				map.put("rowStart", page.getRowStart());
				map.put("pageSize", page.getPageSize());
				json.put("pageTotal",page.getPageCount());
			}else{
				map.put("rowStart", 0);
				map.put("pageSize", Consts.PAGE_SIZE);
			}
			
			jsonObj = tableChangeService.tableGetTime(map);
		}
//		if(jsonObj.size() == 0 || "".equals(jsonObj)){
//			json.put("status", "error");
//		}else{
			json.put("tableList", jsonObj);
			json.put("status", "success");
//		}
		log.info(json);
		return json;
	}
	@RequestMapping(value = "/listMy.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject listMy(String userid,String mark,String pageNum,String status,String fromid,HttpServletRequest request,HttpServletResponse response) {
		log.info(userid+"----"+mark);
		JSONObject json = new JSONObject();
		JSONArray jsonObj = new JSONArray();
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(null != userid && !"".equals(userid)){
			map.put("userId", Integer.parseInt(userid));
		}
		if(null != mark && !"".equals(mark)){
			map.put("mark", mark);
		}
		if(null != status && !"".equals(status)){
			map.put("status", Integer.parseInt(status));
		}
		if(null != fromid && !"".equals(fromid)){
			map.put("fromId", Integer.parseInt(fromid));
		}
		jsonObj = tableChangeService.tableGetTimeMy(map);
		if(jsonObj.size() != 0){
			int pageNumStr = 1;
			if (pageNum != null && !"".equals(pageNum)) {
				pageNumStr = Integer.parseInt(pageNum);
				Page page = new Page(jsonObj.size(),pageNumStr,Consts.PAGE_SIZE);
				map.put("rowStart", page.getRowStart());
				map.put("pageSize", page.getPageSize());
				json.put("pageTotal",page.getPageCount());
			}else{
				map.put("rowStart", 0);
				map.put("pageSize", Consts.PAGE_SIZE);
			}
			
			jsonObj = tableChangeService.tableGetTimeMy(map);
		}
//		if(jsonObj.size() == 0 || "".equals(jsonObj)){
//			json.put("status", "error");
//		}else{
			json.put("tableList", jsonObj);
			json.put("status", "success");
//		}
		log.info(json);
		return json;
	}
	
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject save(@RequestBody String tableInfo,HttpServletRequest request,HttpServletResponse response){
		log.info("入参:"+tableInfo);
		JSONObject json = new JSONObject();
		TableChange table = (TableChange)JsonUtil.fromJson(tableInfo, TableChange.class);
		TableChange tableObj = tableChangeService.save(table);
		if(null != tableObj){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/saveCart.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveCart(@RequestBody String cartList,HttpServletRequest request,HttpServletResponse response){
		log.info("入参:"+cartList);
		JSONObject json = new JSONObject();
		JSONObject jsono = JSONObject.fromObject(cartList);
		String ids = jsono.get("cartList").toString().replace("[", "").replace("]", "");
		TableChange tableObj = tableChangeService.saveCart(ids,jsono.get("userId").toString());
		if(null != tableObj){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/tableCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject tableCheck(String fromId, String goodId, HttpServletRequest request,HttpServletResponse response){
		JSONObject json = new JSONObject();
		TableChange tableObj = new TableChange();
		tableObj.setGoodId(Integer.parseInt(goodId));
		tableObj.setFromId(Integer.parseInt(fromId));
		String result = tableChangeService.tableCheck(tableObj);
		if("have".equals(result)){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/comfirmTable.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject comfirmTable(@RequestBody String tableInfo, HttpServletRequest request,HttpServletResponse response){
		JSONObject json = new JSONObject();
		TableChange tableObj = (TableChange)JsonUtil.fromJson(tableInfo, TableChange.class);
		try{
			tableChangeService.updateStatus(tableObj);
			json.put("status", "success");
		}catch(Exception e){
			json.put("status", "error");
		}
			
		return json;
	}
	
	@RequestMapping(value = "/cansleStatus.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject cansleStatus(@RequestBody String tableInfo, HttpServletRequest request,HttpServletResponse response){
		JSONObject json = new JSONObject();
		TableChange tableObj = (TableChange)JsonUtil.fromJson(tableInfo, TableChange.class);
		try{
			tableChangeService.cansleStatus(tableObj);
			json.put("status", "success");
		}catch(Exception e){
			json.put("status", "error");
		}
			
		return json;
	}
	
}
