package com.zy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.Consts;
import com.zy.model.GoodMessage;
import com.zy.service.GoodMessageService;
import com.zy.util.JsonUtil;
import com.zy.util.Page;

@Controller
@RequestMapping("/msg")
public class MessageController {

	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private GoodMessageService goodMessageService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject list(String userid,String mark,String pageNum,HttpServletRequest request,HttpServletResponse response) {
		log.info(userid+"----"+mark);
		JSONObject json = new JSONObject();
		List<GoodMessage> list = new ArrayList<GoodMessage>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		int pageNumStr = 1;
		if (pageNum != null && !"".equals(pageNum)) {
			pageNumStr = Integer.parseInt(pageNum);
			Page page = new Page(list.size(),pageNumStr,Consts.PAGE_SIZE);
			map.put("rowStart", page.getRowStart());
			map.put("pageSize", page.getPageSize());
		}
		map.put("userId", userid);
		map.put("mark", mark);
		
		list = goodMessageService.list(map);
		if(list.size() == 0 || "".equals(list)){
			json.put("status", "error");
		}else{
			json.put("msgList", list);
			json.put("status", "success");
		}
		
		return json;
	}
	
	
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject save(@RequestBody String message,HttpServletRequest request,HttpServletResponse response){
		JSONObject json = new JSONObject();
		GoodMessage msg = (GoodMessage) JsonUtil.fromJson(message, GoodMessage.class);
		GoodMessage msgObj = goodMessageService.save(msg);
		if(null != msgObj){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject delete(String msgId,HttpServletRequest request,HttpServletResponse response){
		JSONObject json = new JSONObject();
		int flag = goodMessageService.delete(Integer.parseInt(msgId));
		if(flag == 1){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
}
