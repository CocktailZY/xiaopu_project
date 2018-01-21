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
import com.zy.dao.IOrderTypeDao;
import com.zy.model.OrderType;

/**
 * 订单类型Action
 * @author lenovo
 *
 */
@Scope("prototype")
@ParentPackage("struts-default")
//表示继承的父包
@Namespace(value = "/orderType")
public class OrderTypeAction extends ActionSupport{
	
	private OrderType dto;
	private IOrderTypeDao dao;
	private final Logger log=Logger.getLogger(this.getClass());
	public OrderType getDto() {
		return dto;
	}
	public void setDto(OrderType dto) {
		this.dto = dto;
	}
	@Resource(name="OrderTypeDao")
	public void setDao(IOrderTypeDao dao) {
		this.dao = dao;
	}
	
	@Action(value="add",results={
			@Result(name="add",location="/view/orderType/add.jsp")
	})
	public String add(){
		log.info("OrderTypeAction.add------------------------------------start");
		try{
			log.info("OrderTypeAction.add------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("OrderTypeAction.add------------------------------------end");
		return "add";
	}
	
	@Action(value="save",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String save(){
		log.info("OrderTypeAction.save------------------------------------start");
		try{
			if(dto.getId()==0){
				dao.save(dto);
			}else{
				dao.update(dto);
			}
			log.info("OrderTypeAction.save------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("OrderTypeAction.save------------------------------------end");
		return "success";
	}
	@Action(value="update",results={
			@Result(name="update",location="/view/orderType/update.jsp")
	})
	public String update(){
		log.info("OrderTypeAction.update------------------------------------start");
		try{
			ServletActionContext.getRequest().setAttribute("dto", dao.get(dto.getId()));
			log.info("OrderTypeAction.update------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("OrderTypeAction.update------------------------------------end");
		return "update";
	}
	
	@Action(value="delete",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String delete(){
		log.info("OrderTypeAction.delete------------------------------------start");
		try{
			dao.delete(dto);
			log.info("OrderTypeAction.delete------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("OrderTypeAction.delete------------------------------------end");
		return "success";
	}
	
	@Action(value="list",results={
			@Result(name="list",location="/view/orderType/list.jsp")
	})
	public String list(){
		log.info("OrderTypeAction.list------------------------------------start");
		try{
			ServletActionContext.getRequest().setAttribute("list",dao.list(dto));
			log.info("OrderTypeAction.list------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("OrderTypeAction.list------------------------------------end");
		return "list";
	}

	

}
