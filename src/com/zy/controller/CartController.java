package com.zy.controller;

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
import com.zy.model.Cart;
import com.zy.model.CartExtend;
import com.zy.service.CartService;
import com.zy.service.GoodService;
import com.zy.util.JsonUtil;
import com.zy.util.Page;

@Controller
@RequestMapping("/cart")
public class CartController {
	private final Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private CartService cartService;
	@Autowired
	private GoodService goodService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject list(String userid,String pageNum,HttpServletRequest request,HttpServletResponse response){
		log.info("获取全部商品");
		JSONObject json = new JSONObject();
		JSONArray list = new JSONArray();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		if(null != userid && !"".equals(userid)){
			map.put("userId", userid);
		}
		
		list = cartService.listByUserId(map);
		if(list.size()>0){
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
		}
		
		JSONArray pageList = cartService.listByUserId(map);
		
		if(null == pageList || "".equals(pageList)){
			json.put("status", "error");
		}else{
			json.put("cartList", pageList);
			json.put("status", "success");
		}
		return json;
	}
	
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject save(@RequestBody String cartInfo,HttpServletRequest request,HttpServletResponse response){
		log.info("入参:"+cartInfo);
		JSONObject json = new JSONObject();
		Cart goodObj = (Cart)JsonUtil.fromJson(cartInfo, Cart.class);
		Cart good = cartService.save(goodObj);
		if(null != good){
			json.put("status", "success");
//			json.put("cartId", good.getGoodId());
		}else{
			json.put("status", "error");
		}
		return json;
	}
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject update(String id,String type,HttpServletRequest request,HttpServletResponse response){
		JSONObject json = new JSONObject();
		Cart goodObj = cartService.getById(Integer.parseInt(id));
		if("add".equals(type)){
			goodObj.setNum(goodObj.getNum()+1);
			goodObj.setTotal(String.valueOf((goodObj.getNum()*Double.valueOf(goodService.getById(goodObj.getGoodId()).getGoodObj().getPrice()))));
		}else{
			goodObj.setNum(goodObj.getNum()-1);
			goodObj.setTotal(String.valueOf((goodObj.getNum()*Double.valueOf(goodService.getById(goodObj.getGoodId()).getGoodObj().getPrice()))));
		}
		int flag = cartService.update(goodObj);
		if(flag != 0){
			json.put("status", "success");
//			json.put("cartId", good.getGoodId());
		}else{
			json.put("status", "error");
		}
		return json;
	}
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject delete(String id,HttpServletRequest request,HttpServletResponse response){
		JSONObject json = new JSONObject();
		int flag = cartService.delete(Integer.parseInt(id));
		if(flag != 0){
			json.put("status", "success");
//			json.put("cartId", good.getGoodId());
		}else{
			json.put("status", "error");
		}
		return json;
	}
	@RequestMapping(value = "/deleteCartIds.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject deleteCartIds(String ids,HttpServletRequest request,HttpServletResponse response){
		JSONObject json = new JSONObject();
		String[] cartIds = ids.replace("[", "").replace("]", "").split(",");
		int flag = 0;
		for(int i = 0 ; i < cartIds.length ; i++){
			flag = cartService.delete(Integer.parseInt(cartIds[i]));
		}
		if(flag != 0){
			json.put("status", "success");
//			json.put("cartId", good.getGoodId());
		}else{
			json.put("status", "error");
		}
		return json;
	}
}
