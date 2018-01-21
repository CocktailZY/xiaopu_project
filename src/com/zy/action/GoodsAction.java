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
import com.zy.dao.IGoodsTypeDao;
import com.zy.dao.ISupplierDao;
import com.zy.model.GoodToSupplier;
import com.zy.model.Goods;
import com.zy.model.Users;
import com.zy.util.PageBean;

@Scope("prototype")
@ParentPackage("struts-default")
// 表示继承的父包
@Namespace(value = "/good")
// 表示当前Action所在命名空间
public class GoodsAction extends ActionSupport {
	private Goods dto;
	private IGoodDao dao;
	private IGoodsTypeDao typeDao;
	private IGoodToSupplier gtsDao;
	private final Logger log = Logger.getLogger(this.getClass());
	private GoodToSupplier gtsDto;
	private ISupplierDao supDao;

	public GoodToSupplier getGtsDto() {
		return gtsDto;
	}

	public void setGtsDto(GoodToSupplier gtsDto) {
		this.gtsDto = gtsDto;
	}

	public Goods getDto() {
		return dto;
	}

	public void setDto(Goods dto) {
		this.dto = dto;
	}

	@Resource(name = "GoodDao")
	public void setDao(IGoodDao dao) {
		this.dao = dao;
	}

	@Resource(name = "GoodTypeDao")
	public void setTypeDao(IGoodsTypeDao typeDao) {
		this.typeDao = typeDao;
	}

	@Resource(name = "GoodToSupplierDao")
	public void setGtsDao(IGoodToSupplier gtsDao) {
		this.gtsDao = gtsDao;
	}

	@Resource(name = "SupplierDao")
	public void setSupDao(ISupplierDao supDao) {
		this.supDao = supDao;
	}

	@Action(value = "add", results = { @Result(name = "add", location = "/view/goods/add.jsp") })
	public String add() {
		log.info("GoodsAction.add------------------------------------start");
		try {
			ServletActionContext.getRequest().setAttribute("tlist",
					typeDao.list(null));
			log.info("GoodsAction.add------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.add------------------------------------end");
		return "add";
	}

	@Action(value = "save", results = { @Result(name = "success", location = "list.action?dto.status=2", type = "redirectAction") })
	public String save() {
		log.info("GoodsAction.save------------------------------------start");
		dto.setGoodType(typeDao.get(dto.getGoodType().getId()));
		// gtsDto = new GoodToSupplier();
		// gtsDto.setGoods(dto);
		// gtsDto.setSupplier(supDao.get(Integer.parseInt(dto.getSupId())));

		try {
			if (dto.getId() == 0) {
				dto.setStatus(0);
				dao.save(dto);
			} else {
				dao.update(dto);
				// gtsDao.save(gtsDto);
			}
			dto = null;
			log.info("GoodsAction.save------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.save------------------------------------end");
		return "success";
	}

	@Action(value = "update", results = { @Result(name = "update", location = "/view/goods/update.jsp") })
	public String update() {
		log.info("GoodsAction.update------------------------------------start");
		try {
			// ServletActionContext.getRequest().setAttribute("suplist",supDao.list(null));
			ServletActionContext.getRequest().setAttribute("tlist",
					typeDao.list(null));
			ServletActionContext.getRequest().setAttribute("dto",
					dao.get(dto.getId()));
			log.info("GoodsAction.update------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.update------------------------------------end");
		return "update";
	}

	@Action(value = "delete", results = { @Result(name = "success", location = "list.action?dto.status=0", type = "redirectAction") })
	public String delete() {
		log.info("GoodsAction.delete------------------------------------start");
		try {
			dao.delete(dto);
			log.info("GoodsAction.delete------------------------------------success");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.delete------------------------------------end");
		return "success";
	}

	/**
	 * 显示商品信息
	 * 
	 * @return
	 */
	@Action(value = "list", results = { 
			@Result(name = "list", location = "/view/goods/list.jsp"), 
			@Result(name = "gk_list", location = "/view/shopping/shop.jsp")
	})
	public String list() {
		log.info("GoodsAction.list----------strat---------");
		try {
			Users user = (Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
			//分页
			String pageNumStr = ServletActionContext.getRequest().getParameter("pageNum");
			int pageNum = 1;
			if(pageNumStr!=null && !"".equals(pageNumStr)){
				pageNum = Integer.parseInt(pageNumStr);
			}
			
			if(dto.getStatus()==2){
				List<Goods> list = new ArrayList<Goods>();
				List<Goods> glist = dao.list(dto);
				PageBean page=null;
				if(glist.size()>0){
					page = new PageBean(glist.size(),pageNum,5);
					list = dao.list(dto, page);
				}
				ServletActionContext.getRequest().setAttribute("list",list);
				ServletActionContext.getRequest().setAttribute("page",page);
				ServletActionContext.getRequest().setAttribute("dto",dto);
				
			}else{
				List<Goods> list = new ArrayList<Goods>();
				List<Goods> glist = dao.listByStatus(dto.getStatus());
				PageBean page=null;
				if(glist.size()>0){
					page = new PageBean(glist.size(),pageNum,5);
					list = dao.listPage(dto.getStatus(), page);
				}
				ServletActionContext.getRequest().setAttribute("list",list);
				ServletActionContext.getRequest().setAttribute("page",page);
				ServletActionContext.getRequest().setAttribute("dto",dto);
				if(user.getRole().getId()==6){
					return "gk_list";
				}
			}
			
			
			
			log.info("GoodsAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.list----------end---------");
		return "list";
	}


	/**
	 * 修改商品状态
	 * 
	 * @return
	 */
	@Action(value = "qxsj", results = { @Result(name = "qxsj", location = "list.action?dto.status=0", type = "redirectAction") })
	public String qxsj() {
		log.info("GoodsAction.list----------strat---------");
		try {
			Goods g = dao.get(dto.getId());
			if (g.getStatus() == 0) {
				g.setStatus(1);
			} else {
				g.setStatus(0);
			}
			dao.update(g);
			log.info("GoodsAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.list----------end---------");
		return "qxsj";
	}

	/**
	 * 修改商品状态
	 * 
	 * @return
	 */
	@Action(value = "qxsjall", results = { @Result(name = "qxsjall", location = "list.action", type = "redirectAction") })
	public String qxsjall() {
		log.info("GoodsAction.list----------strat---------");
		try {
			
			
			String[] goodids = dto.getGoodsn().split(",");
			for (int i = 0; i < goodids.length; i++) {
				Goods g = dao.get(Integer.parseInt(goodids[i].trim()));
				if (g.getStatus() == 0) {
					g.setStatus(1);
				}
				dao.update(g);
			}
			log.info("GoodsAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.list----------end---------");
		return "qxsjall";
	}

}
