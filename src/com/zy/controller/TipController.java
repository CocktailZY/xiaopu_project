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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.Consts;
import com.zy.model.ExpandModel;
import com.zy.model.ShopGuide;
import com.zy.model.Tip;
import com.zy.service.TipService;
import com.zy.util.Page;

@Controller
@RequestMapping("/tip")
public class TipController {
	
	private final Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private TipService tipService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject list(String userid,String mark,String pageNum,HttpServletRequest request,HttpServletResponse response){
		log.info("我的消息!");
		JSONObject json = new JSONObject();
		JSONArray jsonObj = new JSONArray();
		List<ExpandModel> list = new ArrayList<ExpandModel>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		if(null != userid && !"".equals(userid)){
			map.put("userId", userid);
		}
		
		if(null != mark && !"".equals(mark)){
			map.put("mark", mark);
		}
		jsonObj = tipService.tableGetTime(map);
		
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
		
		jsonObj = tipService.tableGetTime(map);
		if(null == jsonObj || "".equals(jsonObj)){
			json.put("status", "error");
		}else{
			json.put("personTipList", jsonObj);
			json.put("status", "success");
		}
		log.info("tips:"+json);
		return json;
	}
	
	@RequestMapping(value = "/updateAllRead.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject updateAllRead(String userId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter tip update");
		JSONObject json = new JSONObject();
		Tip guideObj = new Tip();
		guideObj.setUserId(Integer.parseInt(userId));
		guideObj.setMark("old");
		int flag = tipService.allReadGuide(guideObj);
		if(flag != 0){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
}
