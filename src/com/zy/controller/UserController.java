package com.zy.controller;

import java.io.IOException;

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
import com.zy.model.User;
import com.zy.service.UserService;
import com.zy.util.JsonUtil;
import com.zy.util.UserUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(@RequestBody String user,HttpServletRequest request,HttpServletResponse response) {
		
		JSONObject json = new JSONObject();
		JSONObject userObj = JSONObject.fromObject(user);
		
		String userName = userObj.getString("username");
		String password = userObj.getString("password");

		User userObject = userService.getByUserNameAndPassword(userName, password);
		if ("".equals(userObject) || null == userObject) {
			json.put("status", "error");
			json.put("message", "用户名或密码错误!");
		} else {
			json.put("status", "success");
			json.put("message", "登录成功!");
			if(userObject.getRoleId() == 2){
				json.put("role","admin");
				UserUtil.setAdminCurrentUser(userObject, request.getSession());
			}else{
				UserUtil.setCurrentUser(userObject, request.getSession());
			}
		}
		// }
		return json;
	}

	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject save(@RequestBody String user,HttpServletRequest request,HttpServletResponse response) {
		JSONObject json = new JSONObject();
		Object userObj = JsonUtil.fromJson(user, User.class);
		User userobj = (User) userObj;
		if ("exist".equals(userService.checkUsername(userobj.getUserName()))) {
			json.put("status", "exist");
			json.put("message", "用户名已存在!");
		} else {
			// 注册
			User hoolUser = userService.save(userobj);
			if(null != hoolUser){
				UserUtil.setCurrentUser(hoolUser, request.getSession());
				json.put("user", hoolUser);
				json.put("status","success");
				json.put("message", "注册成功!");
			}else{
				json.put("status","error");
				json.put("message", "注册失败!");
			}
			
		}
		return json;
	}
	
	@RequestMapping(value = "/getLoginUser.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getLoginUser(HttpServletRequest request,HttpServletResponse response) {
		JSONObject json = new JSONObject();
		User loginUser = UserUtil.getCurrentUser(request.getSession());
		User adminUser = UserUtil.getAdminCurrentUser(request.getSession());
		json.put("loginUser", loginUser);
		json.put("adminUser", adminUser);
		return json;
	}
	
	
	@RequestMapping(value = "/getInfoByUserId.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getInfoByUserId(String userid,HttpServletRequest request,HttpServletResponse response) {
		JSONObject json = new JSONObject();
		User user = userService.getById(Integer.parseInt(userid));
		if(null != user){
			json.put("info", user);
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		
		return json;
	}
	
	@RequestMapping(value = "/updateUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateUserInfo(@RequestBody User user,HttpServletRequest request,HttpServletResponse response) {
		JSONObject json = new JSONObject();
		User userObj = userService.update(user);
		if(null != userObj){
			json.put("info", userObj);
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		
		return json;
	}
	
	@RequestMapping(value = "/loginOut.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject loginOut(HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.getSession().removeAttribute(Consts.SESSIONUSER);
		JSONObject json = new JSONObject();
//		response.sendRedirect(Consts.serveUrl+"/view/index.html");
		json.put("status", "success");
		return json;
	}
}
