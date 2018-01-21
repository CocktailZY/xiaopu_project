package com.zy.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.opensymphony.xwork2.ActionSupport;
import com.zy.dao.IEntrepotDao;
import com.zy.model.Entrepot;
import com.zy.model.Users;

@Scope("prototype")
@ParentPackage("struts-default")
//表示继承的父包
@Namespace(value = "/entrepot")
public class EntrepotAction extends ActionSupport{
	
	private Entrepot dto;
	private IEntrepotDao dao;
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	public Entrepot getDto() {
		return dto;
	}
	public void setDto(Entrepot dto) {
		this.dto = dto;
	}
	@Resource(name="EntrepotDao")
	public void setDao(IEntrepotDao dao) {
		this.dao = dao;
	}
	
	/**
	 * 进入修改仓库页面
	 * @return
	 */
	@Action(value="update",results={
			@Result(name="update",location="/view/entrepot/update.jsp")
	})
	public String update() {
		log.info("EntrepotAction.update----------strat---------");
		try {
			ServletActionContext.getRequest().setAttribute("dto",dao.get(dto.getId()));
			log.info("EntrepotAction.update----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("EntrepotAction.update----------end---------");
		return "update";
	}
	/**
	 * 保存仓库信息
	 * @return
	 */
	@Action(value="save",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String save() {
		log.info("EntrepotAction.save----------strat---------");
		try {
			if (dto.getId() == 0) {
				dao.save(dto);
			}else{
				dao.update(dto);
			}
			dto=null;
			log.info("ResourceAction.save----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","新增或修改失败");
		}
		log.info("EntrepotAction.save----------end---------");
		return "success";
	}
	/**
	 * 删除仓库信息
	 * @return
	 */
	@Action(value="delete",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String delete() {
		log.info("EntrepotAction.delete----------strat---------");
		try {
			dao.delete(dto);
			dto=null;
			log.info("EntrepotAction.delete----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","删除失败");
		}
		log.info("EntrepotAction.delete----------end---------");
		return "success";
	}

	/**
	 * 查询所有
	 * @param dto
	 * @return
	 */
	@Action(value="list",results={
			@Result(name="list",location="/view/entrepot/list.jsp")
	})
	public String list() {
		log.info("EntrepotAction.list----------strat---------");
		try {
			ServletActionContext.getRequest().setAttribute("list",dao.list(dto));
			log.info("EntrepotAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("EntrepotAction.list----------end---------");
		return "list";
	}
	

}
