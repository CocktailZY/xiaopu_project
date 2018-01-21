package com.zy.action;

import java.io.IOException;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.annotation.Scope;

import com.zy.dao.IPurchaseDao;
import com.zy.dao.IUserDao;
import com.zy.model.Purchase;
import com.zy.model.Users;

@Scope("prototype")
@ParentPackage("struts-default")
//表示继承的父包
@Namespace(value = "/login")
//表示当前Action所在命名空间
public class TestAJAXAction {
	private Users dto;
	private IUserDao userDao;
	
	private Purchase purDto;
	private IPurchaseDao purDao;
	
	@Resource(name="UserDao")
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	@Resource(name="PurchaseDao")
	public void setPurDao(IPurchaseDao purDao) {
		this.purDao = purDao;
	}

	public Users getDto() {
		return dto;
	}
	public void setDto(Users dto) {
		this.dto = dto;
	}
	
	@Action(value="loginajax")
	public String loginajax(){
		String username = ServletActionContext.getRequest().getParameter("aaa");
		Users user = userDao.loginMessage(username);
		if(user!=null){
			try {
				JSONObject jobj = JSONObject.fromObject("{mes:\'用户名已存在!\'}");
				ServletActionContext.getResponse().getWriter().write(jobj.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			try {
				JSONObject jobj = JSONObject.fromObject("{mes:\'用户名可以使用!\'}");
				ServletActionContext.getResponse().getWriter().write(jobj.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	

}
