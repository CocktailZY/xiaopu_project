package com.zy.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.zy.dao.IRoleDao;
import com.zy.dao.IUserDao;
import com.zy.model.Role;
import com.zy.model.Users;
import com.zy.util.PageUtil;

@Scope("prototype")
@ParentPackage("struts-default")
//表示继承的父包
@Namespace(value = "/user")
//表示当前Action所在命名空间
public class UserAction extends ActionSupport {
	
	private final Logger log = Logger.getLogger(this.getClass());
	private int page;
	private Users dto;
	private IUserDao userDao;
	private IRoleDao roleDao;
	@Resource(name="RoleDao")
	public void setRoleDao(IRoleDao roleDao) {
		this.roleDao = roleDao;
	}
	@Resource(name="UserDao")
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	public Users getDto() {
		return dto;
	}
	public void setDto(Users dto) {
		this.dto = dto;
	}
	/**
	 * 增加用户信息
	 * @return
	 */
	@Action(value="add",results={
			@Result(name="user_add",location="/view/user/add.jsp")
	})
	public String add(){
		log.info("UserAction.add----------strat---------");
		try {
			ServletActionContext.getRequest().setAttribute("list",roleDao.list(null));
			log.info("UserAction.add----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("UserAction.add----------end---------");
		return "user_add";	
	}
	/**
	 * 进入修改用户页面
	 * @return
	 */
	@Action(value="update",results={
			@Result(name="user_update",location="/view/user/update.jsp")
	})
	public String update() {
		log.info("UserAction.update----------strat---------");
		try {
			ServletActionContext.getRequest().setAttribute("list",roleDao.list(null));
			ServletActionContext.getRequest().setAttribute("dto",userDao.get(dto.getId()));
			log.info("UserAction.update----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("UserAction.update----------end---------");
		return "user_update";
	}
	/**
	 * 保存用户信息
	 * @return
	 */
	@Action(value="save",results={
			@Result(name="user_success",location="list.action",type="redirectAction")
	})
	public String save() {
		log.info("UserAction.save----------strat---------");
		dto.setRole(roleDao.get(dto.getRole().getId()));
		try {
			if (dto.getId() == 0) {
				userDao.save(dto);
			}else{
				userDao.update(dto);
			}
			dto=null;
			log.info("UserAction.save----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","新增或修改失败");
		}
		log.info("UserAction.save----------end---------");
		return "user_success";
	}
	/**
	 * 删除用户信息
	 * @return
	 */
	@Action(value="delete",results={
			@Result(name="user_success",location="list.action",type="redirectAction")
	})
	public String delete() {
		log.info("UserAction.delete----------strat---------");
		try {
			userDao.delete(dto);
			log.info("UserAction.delete----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","删除失败");
		}
		log.info("UserAction.delete----------end---------");
		return "user_success";
	}

	/**
	 * 查询所有
	 * @param dto
	 * @return
	 */
	@Action(value="list",results={
			@Result(name="user_list",location="/view/user/list.jsp")
	})
	public String list() {
		log.info("UserAction.list----------strat---------");
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
			pageModel.setTotalCount(roleDao.count("select count(*) from Users")); // 数据总条数
			pageModel.setPageSize(5);// 设置页面显示最大 值
			pageModel.setNum(3); // 设置当前页的前后距离
			HttpServletRequest request = ServletActionContext.getRequest();
			List<Users> aboutList = (List<Users>) userDao.listPage("from Users", page, 5);
			pageModel.setItems(aboutList);
			request.setAttribute("count", aboutList.size());// 放置在request中
			request.setAttribute("pageModel", pageModel);
			request.setAttribute("page", pageModel.getPage());
			
			//ServletActionContext.getRequest().setAttribute("list",userDao.list(dto));
			log.info("UserAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("UserAction.list----------end---------");
		return "user_list";
	}
	@Action(value="login",results={
			@Result(name="login_suc",location="/view/main.jsp"),
			@Result(name="login_fal",location="/login.jsp"),
			@Result(name="gk_login",location="../good/list.action?dto.status=1" ,type="redirectAction")
	})
	public String login(){
		
		Users user = userDao.login(dto.getUsername(), dto.getPassword());
		
		if(user!=null){
			ServletActionContext.getRequest().getSession().setAttribute("login_user",user);
			if(user.getRole().getId()==6){
				return "gk_login";
			}else{
				return "login_suc";
			}
		}
		ServletActionContext.getRequest().setAttribute("mes", "用户名或密码错误!");
		return "login_fal";
	}
	@Action(value="logout",results={
			@Result(name="logout",location="/login.jsp")
	})
	public String logout(){
		ServletActionContext.getRequest().getSession().removeAttribute("login_user");
		return "logout";
	}

}
