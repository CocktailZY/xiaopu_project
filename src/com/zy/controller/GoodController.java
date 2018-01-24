package com.zy.controller;

import java.io.UnsupportedEncodingException;
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
import com.zy.model.ExpandModel;
import com.zy.model.Good;
import com.zy.model.GoodImg;
import com.zy.model.GoodMessage;
import com.zy.model.GoodType;
import com.zy.model.User;
import com.zy.service.GoodImgService;
import com.zy.service.GoodMessageService;
import com.zy.service.GoodService;
import com.zy.util.JsonUtil;
import com.zy.util.Page;


@Controller
@RequestMapping("/goods")
public class GoodController {
	
	private final Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private GoodService goodService;
	@Autowired
	private GoodImgService goodImgService;
	@Autowired
	private GoodMessageService goodMessageService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject list(String goodName,String goodTypeId,String userid,String pageNum,String type,String status,String pageSize,HttpServletRequest request,HttpServletResponse response){
		log.info("获取全部商品");
		JSONObject json = new JSONObject();
		List<ExpandModel> list = new ArrayList<ExpandModel>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		if(null != goodName && !"".equals(goodName)){
			map.put("goodName", goodName);
		}
		if(null != goodTypeId && !"".equals(goodTypeId)){
			map.put("goodTypeId", goodTypeId);
		}
		if(null != userid && !"".equals(userid)){
			map.put("userId", userid);
		}
		if(null != type && !"".equals(type)){
			map.put("type", type);
		}
		if(null != status && !"".equals(status)){
			map.put("status", status);
		}
		
		list = goodService.list(map);
		
		if(list.size() > 0 ){
			int pageNumStr = 1;
			if (pageNum != null && !"".equals(pageNum)) {
				pageNumStr = Integer.parseInt(pageNum);
				Page page = new Page(list.size(),pageNumStr,Integer.parseInt(pageSize));
				map.put("rowStart", page.getRowStart());
				map.put("pageSize", page.getPageSize());
				json.put("pageTotal",page.getPageCount());
			}else{
				map.put("rowStart", 0);
				map.put("pageSize", 8);
			}
		}
		List<ExpandModel> pageList = goodService.list(map);
		if(null == pageList || "".equals(pageList)){
			json.put("status", "error");
		}else{
			json.put("goodsList", pageList);
			json.put("status", "success");
		}
		return json;
	}
	
	@RequestMapping(value = "/mohu.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject mohu(String conds,String pageNum,String pageSize,String status,HttpServletRequest request,HttpServletResponse response) throws Exception{
		log.info("模糊查询商品");
		
		JSONObject json = new JSONObject();
		List<ExpandModel> list = new ArrayList<ExpandModel>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		conds = new String(conds.getBytes("ISO8859-1"),"UTF-8");
		GoodType gtObj = goodService.getGoodByGoodTypeName(conds);
		if(null != gtObj){
			map.put("goodTypeId", gtObj.getGoodTypeId());
		}
		
		map.put("conds", conds);
		map.put("status", status);
		
		list = goodService.mohuList(map);
		int pageNumStr = 1;
		if (pageNum != null && !"".equals(pageNum)) {
			pageNumStr = Integer.parseInt(pageNum);
			Page page = new Page(list.size(),pageNumStr,Integer.parseInt(pageSize));
			map.put("rowStart", page.getRowStart());
			map.put("pageSize", page.getPageSize());
			json.put("pageTotal",page.getPageCount());
		}else{
			map.put("rowStart", 0);
			map.put("pageSize", 8);
		}
		
		List<ExpandModel> pagelist = goodService.mohuList(map);
		if(null == list || "".equals(list)){
			json.put("status", "error");
		}else{
			json.put("goodsList", pagelist);
			json.put("status", "success");
		}
		return json;
	}
	
	@RequestMapping(value = "/getDetailByGoodsId.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject detail(String goodId,String pageNum,String pageSize,HttpServletRequest request,HttpServletResponse response){
		log.info("查询商品详情");
		JSONObject json = new JSONObject();
		List<ExpandModel> goodMessage = new ArrayList<ExpandModel>();
		//拿到商品详情
		ExpandModel goodObj = goodService.getById(Integer.parseInt(goodId));
		
		//拿到卖家信息
		User userinfo = goodService.getUserInfo(Integer.parseInt(goodId));
		
		//拿到买家留言
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("goodId", goodId);
		List<GoodMessage> list = goodMessageService.list(map);
		if(list.size() > 0 ){
			int pageNumStr = 1;
			if (pageNum != null && !"".equals(pageNum)) {
				pageNumStr = Integer.parseInt(pageNum);
				Page page = new Page(list.size(),pageNumStr,Consts.PAGE_SIZE);
				map.put("rowStart", page.getRowStart());
				map.put("pageSize", page.getPageSize());
				json.put("pageTotal",page.getPageCount());
			}else{
				map.put("rowStart", 0);
				map.put("pageSize", Consts.PAGE_SIZE);
			}
			goodMessage = goodService.getGoodMessage(map);
		}
		
		List<GoodImg> goodImgsList = goodImgService.listByGoodId(Integer.parseInt(goodId));
		if(null == goodObj || "".equals(goodObj)){
			json.put("status", "error");
		}else{
			json.put("detail", goodObj);
			json.put("userInfo", userinfo);
			json.put("message", goodMessage);
			json.put("goodImgsList", goodImgsList);
			json.put("status", "success");
		}
		System.out.println("GoodController---"+json);
		return json;
	}
	
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject save(@RequestBody String goodInfo,HttpServletRequest request,HttpServletResponse response){
		log.info("入参:"+goodInfo);
		JSONObject json = new JSONObject();
		Good goodObj = (Good)JsonUtil.fromJson(goodInfo, Good.class);
		Good good = goodService.save(goodObj);
		if(null != good){
			json.put("status", "success");
			json.put("goodId", good.getGoodId());
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject update(@RequestBody String goodInfo,HttpServletRequest request,HttpServletResponse response){
		log.info("入参:"+goodInfo);
		JSONObject json = new JSONObject();
		Good goodObj = (Good)JsonUtil.fromJson(goodInfo, Good.class);
		Good good = goodService.update(goodObj);
		if(null != good){
			json.put("status", "success");
			json.put("goodId", good.getGoodId());
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject delete(String goodId,HttpServletRequest request,HttpServletResponse response){
		log.info("入参:"+goodId);
		JSONObject json = new JSONObject();
		int flag = goodService.delete(Integer.parseInt(goodId));
		if(flag != 0){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}

}
