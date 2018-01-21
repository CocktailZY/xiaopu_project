package com.zy.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.opensymphony.xwork2.ActionSupport;
import com.zy.dao.IRoleDao;
import com.zy.dao.ISupplierDao;
import com.zy.dao.IUserDao;
import com.zy.model.Role;
import com.zy.model.Supplier;
import com.zy.model.Users;
/**
 * @author lenovo
 * 供应商Action
 */
@Scope("prototype")
@ParentPackage("struts-default")
//表示继承的父包
@Namespace(value = "/supplier")
public class SupplierAction extends ActionSupport{
	
	private Supplier dto;
	private ISupplierDao dao;
	private IUserDao userDao;
	private IRoleDao roleDao;
	private final Logger log=Logger.getLogger(this.getClass());
	
	public Supplier getDto() {
		return dto;
	}
	public void setDto(Supplier dto) {
		this.dto = dto;
	}
	@Resource(name="SupplierDao")
	public void setDao(ISupplierDao dao) {
		this.dao = dao;
	}
	@Resource(name="UserDao")
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	@Resource(name="RoleDao")
	public void setRoleDao(IRoleDao roleDao) {
		this.roleDao = roleDao;
	}
	@Action(value="add",results={
			@Result(name="add",location="/view/supplier/add.jsp")
	})
	public String add(){
		log.info("SupplierAction.add------------------------------------start");
		try{
			log.info("SupplierAction.add------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SupplierAction.add------------------------------------end");
		return "add";
	}
	
	@Action(value="save",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String save(){
		log.info("SupplierAction.add------------------------------------start");
		try{
			if(dto.getId()==0){
				dao.save(dto);
				Users user = new Users();
				user.setUsername(dto.getSupName());
				user.setPassword("123456");
				Role role = roleDao.get(5);
				user.setRole(role);
				user.setOtherId(dto.getId());
				userDao.save(user);
			}else{
				dao.update(dto);
			}
			log.info("SupplierAction.add------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SupplierAction.add------------------------------------end");
		return "success";
	}
	
	@Action(value="update",results={
			@Result(name="update",location="/view/supplier/update.jsp")
	})
	public String update(){
		log.info("SupplierAction.update------------------------------------start");
		try{
			ServletActionContext.getRequest().setAttribute("dto", dao.get(dto.getId()));
			log.info("SupplierAction.update------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SupplierAction.update------------------------------------end");
		return "update";
	}
	
	@Action(value="delete",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String delete(){
		log.info("SupplierAction.delete------------------------------------start");
		try{
			dao.delete(dto);
			log.info("SupplierAction.delete------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SupplierAction.delete------------------------------------end");
		return "success";
	}
	
	@Action(value="list",results={
			@Result(name="list",location="/view/supplier/list.jsp")
	})
	public String list(){
		log.info("SupplierAction.list------------------------------------start");
		try{
			ServletActionContext.getRequest().setAttribute("list",dao.list(dto));
			log.info("SupplierAction.list------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SupplierAction.list------------------------------------end");
		return "list";
	}
	
}
