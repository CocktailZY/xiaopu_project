package com.zy.action;

import java.util.ArrayList;
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
import com.zy.dao.IOrderDao;
import com.zy.dao.IRoleDao;
import com.zy.dao.IUserDao;
import com.zy.model.Order;
import com.zy.model.Role;
import com.zy.model.Users;
import com.zy.util.PageUtil;
@Scope("prototype")
@ParentPackage("struts-default")
//表示继承的父包
@Namespace(value = "/role")
//表示当前Action所在命名空间
public class RoleAction extends ActionSupport{

	private int page;
	private final Logger log = Logger.getLogger(this.getClass());
	private Role dto;
	private IRoleDao roleDao;
	private IUserDao userDao;
	@Resource(name="UserDao")
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	@Resource(name="RoleDao")
	public void setRoleDao(IRoleDao roleDao) {
		this.roleDao = roleDao;
	}
	public Role getDto() {
		return dto;
	}
	public void setDto(Role dto) {
		this.dto = dto;
	}
	/**
	 * 进入修改角色页面
	 * @return
	 */
	@Action(value="update",results={
			@Result(name="role_update",location="/view/role/update.jsp")
	})
	public String update() {
		log.info("RoleAction.update----------strat---------");
		try {
			ServletActionContext.getRequest().setAttribute("dto",roleDao.get(dto.getId()));
			log.info("RoleAction.update----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("RoleAction.update----------end---------");
		return "role_update";
	}
	/**
	 * 保存角色信息
	 * @return
	 */
	@Action(value="save",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String save() {
		log.info("RoleAction.save----------strat---------");
		try {
			if (dto.getId() == 0) {
				roleDao.save(dto);
			}else{
				roleDao.update(dto);
			}
			dto=null;
			log.info("ResourceAction.save----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","新增或修改失败");
		}
		log.info("RoleAction.save----------end---------");
		return "success";
	}
	/**
	 * 删除角色信息
	 * @return
	 */
	@Action(value="delete",results={
			@Result(name="role_success",location="list.action",type="redirectAction")
	})
	public String delete() {
		List<Users> ulist = new ArrayList<Users>();
		log.info("RoleAction.delete----------strat---------");
		try {
			ulist = userDao.getByRoleId(dto.getId());
			for(int i=0;i<ulist.size();i++){
				Users u = ulist.get(i);
				u.setRole(null);
				userDao.update(u);
			}
//			resourceRoleDao.delByRoleId(dto.getId());
			roleDao.delete(dto);
			dto=null;
			log.info("RoleAction.delete----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","删除失败");
		}
		log.info("RoleAction.delete----------end---------");
		return "role_success";
	}

	/**
	 * 查询所有
	 * @param dto
	 * @return
	 */
	@Action(value="list",results={
			@Result(name="role_list",location="/view/role/list.jsp")
	})
	public String list() {
		log.info("RoleAction.list----------strat---------");
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
			pageModel.setTotalCount(roleDao.count("select count(*) from Role")); // 数据总条数
			pageModel.setPageSize(5);// 设置页面显示最大 值
			pageModel.setNum(3); // 设置当前页的前后距离
			HttpServletRequest request = ServletActionContext.getRequest();
			List<Role> aboutList = (List<Role>) roleDao.listPage("from Role", page, 5);
			pageModel.setItems(aboutList);
			request.setAttribute("count", aboutList.size());// 放置在request中
			request.setAttribute("pageModel", pageModel);
			request.setAttribute("page", pageModel.getPage());
			
			
			log.info("RoleAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("RoleAction.list----------end---------");
		return "role_list";
	}
	
}
