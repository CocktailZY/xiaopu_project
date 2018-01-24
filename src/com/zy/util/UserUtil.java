package com.zy.util;

import javax.servlet.http.HttpSession;

import com.zy.Consts;
import com.zy.model.User;
public class UserUtil {

	/**
	 * 获取当前登录用户的帐号
	 * @param session
	 * @return
	 */
	public static String getOperator(HttpSession session){
		User ui = getCurrentUser(session);
		String userName = "";
		if(ui != null){
			userName = ui.getUserName();
		}
		return userName;
	}
	
	/**
	 * 获得系统当前用户(userInfo)
	 * @param session
	 */
	public static User getCurrentUser(HttpSession session){
		String userinfo = (String) session.getAttribute(Consts.SESSIONUSER);
		User user = (User) JsonUtil.fromJson(userinfo, User.class);
		return user;
	}
	
	public static User getAdminCurrentUser(HttpSession session){
		String userinfo = (String) session.getAttribute(Consts.ADMINUSER);
		User user = (User) JsonUtil.fromJson(userinfo, User.class);
		return user;
	}
	
	public static void setCurrentUser(User user,HttpSession session){
		String userinfo = JsonUtil.toJson(user);
		session.setAttribute(Consts.SESSIONUSER, userinfo);
	}
	public static void setAdminCurrentUser(User user,HttpSession session){
		String userinfo = JsonUtil.toJson(user);
		session.setAttribute(Consts.ADMINUSER, userinfo);
	}
	
}
