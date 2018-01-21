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
import com.zy.dao.IGoodDao;
import com.zy.dao.IGoodToSupplier;
import com.zy.dao.ISupplierDao;
import com.zy.model.GoodToSupplier;
import com.zy.model.Goods;
import com.zy.model.Users;

@Scope("prototype")
@ParentPackage("struts-default")
// 表示继承的父包
@Namespace(value = "/gonghuo")
// 表示当前Action所在命名空间
public class GongHuoAction {

	private GoodToSupplier dto;
	private Goods goodDto;
	private IGoodDao goodDao;
	private ISupplierDao supDao;
	private IGoodToSupplier gtsDao;
	private final Logger log = Logger.getLogger(this.getClass());

	public Goods getGoodDto() {
		return goodDto;
	}

	public void setGoodDto(Goods goodDto) {
		this.goodDto = goodDto;
	}

	public GoodToSupplier getDto() {
		return dto;
	}

	public void setDto(GoodToSupplier dto) {
		this.dto = dto;
	}

	@Resource(name = "GoodDao")
	public void setGoodDao(IGoodDao goodDao) {
		this.goodDao = goodDao;
	}

	@Resource(name = "SupplierDao")
	public void setSupDao(ISupplierDao supDao) {
		this.supDao = supDao;
	}

	@Resource(name = "GoodToSupplierDao")
	public void setGtsDao(IGoodToSupplier gtsDao) {
		this.gtsDao = gtsDao;
	}

	@Action(value = "add", results = { @Result(name = "add", location = "/view/gonghuo/add.jsp") })
	public String add() {
		log.info("GongHuoAction.add------------------------------------start");
		try {
			ServletActionContext.getRequest().setAttribute("goodlist",goodDao.list(null));
			log.info("GongHuoAction.add------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GongHuoAction.add------------------------------------end");
		return "add";
	}

	@Action(value = "save", results = { 
			@Result(name = "success", location = "/view/gonghuo/list.jsp"),
			@Result(name = "listAll", location = "listAll.action", type = "redirectAction"),
	})
	public String save() {
		log.info("GongHuoAction.save------------------------------------start");
		Users user = (Users) ServletActionContext.getRequest().getSession().getAttribute("login_user");
		List<GoodToSupplier> glist = new ArrayList<GoodToSupplier>();
		try {
			if (dto.getId() == 0) {
				String ids[] = goodDto.getGoodsn().split(",");
				for (int i = 0; i < ids.length; i++) {
					if (ids[i] != null && !ids.equals("")) {
						GoodToSupplier gts = new GoodToSupplier();
						gts.setGoods(goodDao.get(Integer.parseInt(ids[i])));
						gts.setSupplier(supDao.get(user.getOtherId()));
						gtsDao.save(gts);
						glist.add(gts);
					}
				}
			ServletActionContext.getRequest().setAttribute("glist", glist);
			} else {
				gtsDao.update(dto);
				return "listAll";
			}
			goodDto = null;
			log.info("GongHuoAction.save------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.save------------------------------------end");
		
		return "success";
	}

	@Action(value = "update", results = { @Result(name = "update", location = "/view/gonghuo/listAll.jsp")})
	public String update() {
		log.info("GongHuoAction.update------------------------------------start");
		Users user = (Users) ServletActionContext.getRequest().getSession().getAttribute("login_user");
		try {
			String gonghuoids[] = dto.getPp().split(",");
			String jinjia[] = dto.getJprice().split(",");
			for (int i = 0; i < gonghuoids.length; i++) {
				if (gonghuoids[i] != null && !gonghuoids.equals("")) {
					GoodToSupplier gts = new GoodToSupplier();
					gts = gtsDao.get(Integer.parseInt(gonghuoids[i].trim()));
					gts.setJprice(jinjia[i].trim());
					gtsDao.update(gts);
				}
			}
			List<GoodToSupplier> list = gtsDao.listBySupId(user.getOtherId());
			ServletActionContext.getRequest().setAttribute("list", list);
			dto=null;
			log.info("GongHuoAction.update------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GongHuoAction.update------------------------------------end");
		return "update";
	}

	@Action(value = "updateById", results = { @Result(name = "update", location = "/view/gonghuo/update.jsp") })
	public String updateById() {
		log.info("GongHuoAction.update------------------------------------start");
		try {
			ServletActionContext.getRequest().setAttribute("dto",gtsDao.get(dto.getId()));
			log.info("GongHuoAction.update------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GongHuoAction.update------------------------------------end");
		return "update";
	}

	@Action(value = "delete", results = { @Result(name = "success", location = "listAll.action", type = "redirectAction") })
	public String delete() {
		log.info("GongHuoAction.delete------------------------------------start");
		try {
			gtsDao.delete(dto);
			log.info("GongHuoAction.delete------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GongHuoAction.delete------------------------------------end");
		return "success";
	}


	@Action(value = "listAll", results = { 
			@Result(name = "list", location = "/view/gonghuo/listAll.jsp"),
			@Result(name = "kclist", location = "/view/order/showcg.jsp")
	})
	public String listAll() {
		log.info("GongHuoAction.list------------------------------------start");
		try {
			Users user=(Users) ServletActionContext.getRequest().getSession().getAttribute("login_user");
			
			List<GoodToSupplier> list = gtsDao.listBySupId(user.getOtherId());
			ServletActionContext.getRequest().setAttribute("list", list);
			
			int roleId = user.getRole().getId();
			if(roleId == 2 || roleId == 3){
				String num = ServletActionContext.getRequest().getParameter("num");
				ServletActionContext.getRequest().setAttribute("num", num);
				ServletActionContext.getRequest().setAttribute("list", gtsDao.listByGoodId(goodDto.getId()));
				return "kclist";
			}
			
			log.info("GongHuoAction.list------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GongHuoAction.list------------------------------------end");
		return "list";
	}

}
