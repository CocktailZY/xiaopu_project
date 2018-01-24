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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.model.ExpandModel;
import com.zy.model.GoodType;
import com.zy.service.GoodTypeService;


@Controller
@RequestMapping("/goodType")
public class GoodTypeController {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private GoodTypeService goodTypeService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject list(String goodTypeId,HttpServletRequest request,HttpServletResponse response) {
		log.info("获取全部商品类型");
		JSONObject json = new JSONObject();
		List<GoodType> list = new ArrayList<GoodType>();
		HashMap<String,Object> map = new HashMap<String,Object>();
	
		if(null != goodTypeId && !"".equals(goodTypeId)){
			map.put("goodTypeId", goodTypeId);
		}
		
		list = goodTypeService.list(map);
		if(list.size() == 0 || "".equals(list)){
			json.put("status", "error");
		}else{
			List<ExpandModel> exList = goodTypeService.addImgClass(list);
			json.put("typelist", exList);
			json.put("status", "success");
		}
		System.out.println("GoodTypeController---"+json);
		return json;
	
	}
}
