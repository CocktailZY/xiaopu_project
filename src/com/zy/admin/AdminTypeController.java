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
import com.zy.model.GoodType;
import com.zy.service.GoodTypeService;
import com.zy.util.Page;

@Controller
@RequestMapping("/admin/type")
public class AdminTypeController {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private GoodTypeService goodTypeService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject adminGoodTypeList(String pageNum,String pageSize,HttpServletRequest request,HttpServletResponse response) {
		log.info("enter admin GoodType list");
		JSONObject json = new JSONObject();
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<GoodType> list = goodTypeService.list();

		int pageNumStr = 1;
		if (pageNum != null && !"".equals(pageNum)) {
			pageNumStr = Integer.parseInt(pageNum);
			Page page = new Page(list.size(),pageNumStr,Consts.PAGE_SIZE);
			map.put("rowStart", page.getRowStart());
			map.put("pageSize", page.getPageSize());
			json.put("pageTotal",page.getPageCount());
		}else{
			map.put("rowStart", 0);
			map.put("pageSize", pageSize);
		}
		
		List<GoodType> pageList = goodTypeService.pageListAll(map);
		
		if(pageList.size() != 0){
			json.put("goodTypeList", pageList);
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		
		return json;
	}
	
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveGoodType(@RequestBody GoodType goodType,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin GoodType save");
		JSONObject json = new JSONObject();
		GoodType goodTypeObj = goodTypeService.save(goodType);
		if(null != goodTypeObj){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/del.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject delGoodType(String goodTypeId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin GoodType del");
		JSONObject json = new JSONObject();
		int GoodTypeObj = goodTypeService.delete(Integer.parseInt(goodTypeId));
		if(GoodTypeObj == 1){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/getByTypeId.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getByGoodTypeId(String goodTypeId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin GoodType del");
		JSONObject json = new JSONObject();
		GoodType goodTypeObj = goodTypeService.getById(Integer.parseInt(goodTypeId));
		if(null != goodTypeObj){
			json.put("status", "success");
			json.put("goodTypeInfo",goodTypeObj);
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject update(@RequestBody GoodType goodType,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin GoodType update");
		JSONObject json = new JSONObject();
		GoodType goodTypeObj = goodTypeService.update(goodType);
		if(null != goodTypeObj){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}

}
