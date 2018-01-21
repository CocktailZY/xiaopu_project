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
import com.zy.dao.IGoodsTypeDao;
import com.zy.model.GoodsType;
/**
 * 商品类型Action
 * @author lenovo
 * 
 */
@Scope("prototype")
@ParentPackage("struts-default")
//表示继承的父包
@Namespace(value = "/goodType")
public class GoodsTypeAction extends ActionSupport{

	private GoodsType dto;
	private IGoodsTypeDao dao;
	private final Logger log=Logger.getLogger(this.getClass());
	public GoodsType getDto() {
		return dto;
	}
	public void setDto(GoodsType dto) {
		this.dto = dto;
	}
	@Resource(name="GoodTypeDao")
	public void setDao(IGoodsTypeDao dao) {
		this.dao = dao;
	}
	
	@Action(value="add",results={
			@Result(name="add",location="/view/goodType/add.jsp")
	})
	public String add(){
		log.info("GoodsTypeAction.add------------------------------------start");
		try{
			log.info("GoodsTypeAction.add------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("GoodsTypeAction.add------------------------------------end");
		return "add";
	}
	
	@Action(value="save",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String save(){
		log.info("GoodsTypeAction.save------------------------------------start");
		try{
			if(dto.getId()==0){
				dao.save(dto);
			}else{
				dao.update(dto);
			}
			log.info("GoodsTypeAction.save------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("GoodsTypeAction.save------------------------------------end");
		return "success";
	}
	@Action(value="update",results={
			@Result(name="update",location="/view/goodType/update.jsp")
	})
	public String update(){
		log.info("GoodsTypeAction.update------------------------------------start");
		try{
			ServletActionContext.getRequest().setAttribute("dto", dao.get(dto.getId()));
			log.info("GoodsTypeAction.update------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("GoodsTypeAction.update------------------------------------end");
		return "update";
	}
	
	@Action(value="delete",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String delete(){
		log.info("GoodsTypeAction.delete------------------------------------start");
		try{
			dao.delete(dto);
			log.info("GoodsTypeAction.delete------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("GoodsTypeAction.delete------------------------------------end");
		return "success";
	}
	
	@Action(value="list",results={
			@Result(name="list",location="/view/goodType/list.jsp")
	})
	public String list(){
		log.info("GoodsTypeAction.list------------------------------------start");
		try{
			ServletActionContext.getRequest().setAttribute("list",dao.list(dto));
			log.info("GoodsTypeAction.list------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("GoodsTypeAction.list------------------------------------end");
		return "list";
	}
	
}
