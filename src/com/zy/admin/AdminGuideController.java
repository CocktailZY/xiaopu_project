package com.zy.admin;

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
import com.zy.model.GuideExpand;
import com.zy.model.ShopGuide;
import com.zy.service.ShopGuideService;
import com.zy.util.JsonUtil;
import com.zy.util.Page;

@Controller
@RequestMapping("/admin/guide")
public class AdminGuideController {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ShopGuideService shopGuideService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject adminguideList(String pageNum,String status,String userId,String mark,HttpServletRequest request,HttpServletResponse response) {
		log.info("enter admin guide list");
		JSONObject json = new JSONObject();
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<ShopGuide> list = shopGuideService.list();
		
		if(null != userId && !"".equals(userId)){
			map.put("userId", userId);
		}
		
		if(null != mark && !"".equals(mark)){
			map.put("mark", mark);
		}

		if(null != status && !"".equals(status)){
			map.put("status", Integer.parseInt(status));
		}
		
		int pageNumStr = 1;
		if (pageNum != null && !"".equals(pageNum)) {
			pageNumStr = Integer.parseInt(pageNum);
			if(list.size() != 0){
				Page page = new Page(list.size(),pageNumStr,Consts.PAGE_SIZE);
				map.put("rowStart", page.getRowStart());
				map.put("pageSize", page.getPageSize());
				json.put("pageTotal",page.getPageCount());
			}else{
				map.put("rowStart", 0);
				map.put("pageSize", Consts.PAGE_SIZE);
				json.put("pageTotal",0);
			}
			
		}else{
			map.put("rowStart", 0);
			map.put("pageSize", Consts.PAGE_SIZE);
		}
		
		List<GuideExpand> pageList = shopGuideService.pageListAll(map);
		
		if(null != pageList){
			json.put("guideList", pageList);
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		
		return json;
	}
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveguide(@RequestBody String guide,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin guide save");
		JSONObject json = new JSONObject();
		ShopGuide guideObj = (ShopGuide)JsonUtil.fromJson(guide, ShopGuide.class);
		ShopGuide guideReal = shopGuideService.save(guideObj);
		if(null != guideReal){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/del.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject delguide(String guideId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin guide del");
		JSONObject json = new JSONObject();
		int guideObj = shopGuideService.delete(Integer.parseInt(guideId));
		if(guideObj == 1){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/getByGuideId.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getByGuideId(String guideId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin guide del");
		JSONObject json = new JSONObject();
		ShopGuide guideObj = shopGuideService.getById(Integer.parseInt(guideId));
		if(null != guideObj){
			json.put("status", "success");
			json.put("guideInfo",guideObj);
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject update(@RequestBody ShopGuide guide,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin guide update");
		JSONObject json = new JSONObject();
		ShopGuide guideObj = shopGuideService.update(guide);
		if(null != guideObj){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/changeStatus.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject changeStatus(String guideId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin guide changeStatus");
		JSONObject json = new JSONObject();
		ShopGuide guideObj = shopGuideService.getById(Integer.parseInt(guideId));
		guideObj.setStatus(1);
		guideObj.setMark("front_new");
		ShopGuide flag = shopGuideService.update(guideObj);
		if(null != flag){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/allReadGuide.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject allReadGuide(String userId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin guide update");
		JSONObject json = new JSONObject();
		ShopGuide guideObj = new ShopGuide();
		guideObj.setUserId(Integer.parseInt(userId));
		guideObj.setMark("front_old");
		int flag = shopGuideService.allReadGuide(guideObj);
		if(flag != 0){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}

}
