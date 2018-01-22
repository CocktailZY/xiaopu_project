package com.a2.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.a2.ssm.model.Role;
import com.a2.ssm.model.RolePower;
import com.a2.ssm.model.User;
import com.a2.ssm.service.RolePowerService;
import com.a2.ssm.service.RoleService;
import com.a2.ssm.service.UserService;


/**
 * <p>类名：RoleController</p>
 * <p>类功能描述：角色 Handler层</p>：
 * @类作者：zy
 * @创建时间：2018-8-31 下午2:05:29
 * @小组：A2小组
 */
@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	@Autowired
	private RolePowerService rolePowerService;
	@Autowired
	private UserService userService;
	
	/**
	 * <p>方法功能描述：查询所有角色</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午2:11:31
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("list")
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView();
		List<Role> list = roleService.list();
		mav.addObject("list", list);
		mav.setViewName("admin/role/rolelist");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：增加角色</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午2:28:51
	 * @参数：@param dto 角色实体对象 
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("save")
	public ModelAndView save(Role dto){
		roleService.save(dto);
		return new ModelAndView(new RedirectView("../role/list.do"));//跳转list.do显示所有角色信息
	}
	
	/**
	 * <p>方法功能描述：根据id删除某一角色信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午3:30:19
	 * @参数：@param dto 角色实体对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("delete")
	public ModelAndView delete(Role dto){
		List<RolePower> list = rolePowerService.listByRoleId(dto.getRoId());//删除角色时将其权限一起删除
		for(int i = 0; i < list.size(); i++){
			rolePowerService.delete(list.get(i).getRpId());
		}
		//将该角色的用户修改角色为空，状态未激活
		List<User> ulist = userService.getByRole(dto.getRoId());
		for(int j = 0 ; j < ulist.size() ; j++){
			User u = ulist.get(j);
			u.setuRoleid(null);//将用户的角色置为空
			u.setuState(0);//将状态改为未激活
			userService.update(u);
		}
		
		roleService.delete(dto.getRoId());
		return new ModelAndView(new RedirectView("../role/list.do"));//跳转list.do显示所有角色信息
	}
	
	/**
	 * <p>方法功能描述：通过角色id获得一个角色信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午3:36:34
	 * @参数：@param dto 角色实体对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("getById")
	public ModelAndView getById(Role dto){
		ModelAndView mav = new ModelAndView();
		Role role = roleService.getById(dto.getRoId());
		mav.addObject("role", role);
		mav.setViewName("admin/role/roleinfo");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：更新角色信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-8-31 下午6:46:31
	 * @参数：@param dto 角色实体对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("update")
	public ModelAndView update(Role dto){
		roleService.update(dto);
		return new ModelAndView(new RedirectView("../role/list.do"));//跳转list.do显示所有角色信息
	}
	
}
