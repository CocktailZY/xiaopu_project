package com.zy.controller;

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

import com.zy.model.GoodImg;
import com.zy.service.GoodImgService;
import com.zy.util.JsonUtil;

@Controller
@RequestMapping("/goodImg")
public class GoodImgController {
	
	private final Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private GoodImgService goodImgService;
	
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject save(@RequestBody String imgs,HttpServletRequest request,HttpServletResponse response){
		log.info("入参:"+goodImgService);
		JSONObject json = new JSONObject();
		JSONObject jsonObj = JSONObject.fromObject(imgs);
		List<String> imgs_str = JsonUtil.fromListJson(jsonObj.optString("imgs"), String.class);
		log.info("转后:"+imgs_str);
		try{
			for(int i = 0 ; i < imgs_str.size() ; i++){
				GoodImg goodImgObj = new GoodImg();
				goodImgObj.setGoodId(Integer.parseInt(jsonObj.optString("goodId")));
				goodImgObj.setImgUrl(imgs_str.get(i));
				goodImgService.save(goodImgObj);
			}
			json.put("status", "success");
		}catch(Exception e){
			json.put("status", "error");
		}
		return json;
	}

}
