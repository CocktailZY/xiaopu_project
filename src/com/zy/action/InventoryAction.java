package com.zy.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.opensymphony.xwork2.ActionSupport;
import com.zy.dao.IInventoryDao;
import com.zy.model.Goods;
import com.zy.model.Inventory;
import com.zy.model.Purchase;
import com.zy.util.PageUtil;

/**
 * 库存Action
 * @author lenovo
 *
 */
@Scope("prototype")
@ParentPackage("struts-default")
//表示继承的父包
@Namespace(value = "/inventory")
public class InventoryAction extends ActionSupport{
	
	private Inventory dto;
	private IInventoryDao dao;
	
	private final Logger log = Logger.getLogger(this.getClass());
	private int page;
	
	
	public Inventory getDto() {
		return dto;
	}

	public void setDto(Inventory dto) {
		this.dto = dto;
	}

	@Resource(name="InventoryDao")
	public void setDao(IInventoryDao dao) {
		this.dao = dao;
	}
	
	@Action(value="add",results={
			@Result(name="add",location="/view/inventory/add.jsp")
	})
	public String add(){
		log.info("InventoryAction.add----------strat---------");
		try {
//			ServletActionContext.getRequest().setAttribute("goodlist",goodDao.list(null));
			log.info("InventoryAction.add----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("InventoryAction.add----------end---------");
		return "add";	
	}
	/**
	 * 进入修改页面
	 * @return
	 */
	@Action(value="update",results={
			@Result(name="user_update",location="/view/inventory/update.jsp")
	})
	public String update() {
		log.info("InventoryAction.update----------strat---------");
		try {
//			ServletActionContext.getRequest().setAttribute("list",roleDao.list(null));
			ServletActionContext.getRequest().setAttribute("dto",dao.get(dto.getId()));
			log.info("InventoryAction.update----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("InventoryAction.update----------end---------");
		return "user_update";
	}
	/**
	 * 保存用户信息
	 * @return
	 */
	@Action(value="save",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String save() {
		log.info("InventoryAction.save----------strat---------");
//		dto.setRole(roleDao.get(dto.getRole().getId()));
		try {
			if (dto.getId() == 0) {
				dao.save(dto);
			}else{
				dao.update(dto);
			}
			dto=null;
			log.info("InventoryAction.save----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","新增或修改失败");
		}
		log.info("InventoryAction.save----------end---------");
		return "success";
	}
	/**
	 * 删除用户信息
	 * @return
	 */
	@Action(value="delete",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String delete() {
		log.info("InventoryAction.delete----------strat---------");
		try {
			dao.delete(dto);
			log.info("InventoryAction.delete----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","删除失败");
		}
		log.info("InventoryAction.delete----------end---------");
		return "success";
	}

	/**
	 * 查询所有
	 * @param dto
	 * @return
	 */
	@Action(value="list",results={
			@Result(name="list",location="/view/inventory/list.jsp")
	})
	public String list() {
		log.info("InventoryAction.list----------strat---------");
		try {
			PageUtil pageModel = new PageUtil();
			if ((String) ServletActionContext.getRequest().getParameter("page") == null) {
				pageModel.setPage(1);
			} else {
				 page = Integer.parseInt((String) ServletActionContext.getRequest().getParameter("page"));
				if (page != 0) {
					pageModel.setPage(page);
				}
			}
			pageModel.setTotalCount(dao.count("select count(*) from Inventory")); // 数据总条数
			pageModel.setPageSize(5);// 设置页面显示最大 值
			pageModel.setNum(3); // 设置当前页的前后距离
			HttpServletRequest request = ServletActionContext.getRequest();
			List<Inventory> aboutList = (List<Inventory>) dao.listPage("from Inventory", page, 5);
			pageModel.setItems(aboutList);
			request.setAttribute("count", aboutList.size());// 放置在request中
			request.setAttribute("pageModel", pageModel);
			request.setAttribute("page", pageModel.getPage());
			
			
			log.info("InventoryAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("InventoryAction.list----------end---------");
		return "list";
	}
	/**
	 * 订单确认
	 * @return
	 */
	@Action(value="qxqr",results={
			@Result(name="qxqr",location="list.action",type="redirectAction")
	})
	public String qxqr(){
		log.info("InventoryAction.list----------strat---------");
		try {
			Inventory g = dao.get(dto.getId());
			if(g.getStatus()==0){
				g.setStatus(1);
			}else{
				g.setStatus(0);
			}
			dao.update(g);
			log.info("InventoryAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("InventoryAction.list----------end---------");
		return "qxqr";
	}
	

}
