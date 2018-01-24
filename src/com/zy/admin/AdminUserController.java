package com.zy.admin;

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
import com.zy.model.Role;
import com.zy.model.User;
import com.zy.service.UserService;
import com.zy.util.MailUtils;
import com.zy.util.Page;
import com.zy.util.UserUtil;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject adminUserList(String pageNum,String pageSize,HttpServletRequest request,HttpServletResponse response) {
		JSONObject json = new JSONObject();
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<ExpandModel> list = userService.list();

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
		
		List<ExpandModel> pageList = userService.pageListAll(map);
		
		if(pageList.size() != 0){
			json.put("userList", pageList);
			json.put("allUser", list);
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		
		return json;
	}
	
	@RequestMapping(value = "/getByUserId.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getByUserId(String userId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin user get");
		JSONObject json = new JSONObject();
		User userObj = userService.getById(Integer.parseInt(userId));
		if(null != userObj){
			json.put("status", "success");
			json.put("userInfo",userObj);
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/del.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject delUser(String userId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin user del");
		JSONObject json = new JSONObject();
		int userObj = userService.delete(Integer.parseInt(userId));
		if(userObj == 1){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/recoverPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public void recoverPwd(@RequestBody String user,HttpServletRequest request,HttpServletResponse response) {
		
		JSONObject json = new JSONObject();
		JSONObject userObj = JSONObject.fromObject(user);
		
		String userName = userObj.getString("username");
		String toEmail = userObj.getString("email");

		User userObject = userService.getByUserName(userName);
		
		userObject.setPassWord("admin123456");
		MailUtils.sendMail(toEmail,"code");
		userService.update(userObject);
	}
}
