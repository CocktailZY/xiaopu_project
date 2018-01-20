package com.a2.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.a2.ssm.model.Power;
import com.a2.ssm.model.Role;
import com.a2.ssm.model.RolePower;
import com.a2.ssm.service.PowerService;
import com.a2.ssm.service.RolePowerService;
import com.a2.ssm.service.RoleService;

@Controller
@RequestMapping("/rolePower")
public class RolePowerController {

	@Autowired
	private RolePowerService rolePowerService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PowerService powerService;

	/**
	 * <p>
	 * 方法功能描述：查看所有角色权限关系
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2016-8-31 下午9:06:55
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<RolePower> list = rolePowerService.list();
		mav.addObject("list", list);
		mav.setViewName("rolePower");
		return mav;
	}

	/**
	 * <p>
	 * 方法功能描述：根据角色id显示权限信息
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2016-8-31 下午9:53:05
	 * @参数：@param dto
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("listPower")
	public ModelAndView listPower(Role dto) {
		ModelAndView mav = new ModelAndView();
		List<RolePower> powerIdlist = rolePowerService.listByRoleId(dto
				.getRoId());// 根据角色id查出所有关系
		List<Power> list = new ArrayList<Power>();
		Power power = new Power();
		for (int i = 0; i < powerIdlist.size(); i++) {
			int pid = powerIdlist.get(i).getRpPowerid();// 获得所有权限id
			power = powerService.getById(pid);// 根据权限id获得一级权限
			if (power != null) {
				list.add(power);
			}
		}
		mav.addObject("list", list);
		mav.addObject("role", roleService.getById(dto.getRoId()));
		mav.setViewName("admin/rolePower/rolePowerlist");
		return mav;
	}

	/**
	 * <p>
	 * 方法功能描述：根据角色id查出未选权限
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2016-9-1 上午10:26:30
	 * @参数：@param role 角色对象
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("addPower")
	public ModelAndView addPower(Role role) {
		ModelAndView mav = new ModelAndView();
		List<RolePower> powerIdlist = rolePowerService.listByRoleId(role
				.getRoId());// 被选中权限list
		List<Power> powerlist = powerService.listParentPower();// 所有权限list
		// List<Power> list = new ArrayList<Power>();
		for (int i = 0; i < powerIdlist.size(); i++) {
			int spid = powerIdlist.get(i).getRpPowerid();// 获得所有被选权限id
			for (int j = 0; j < powerlist.size(); j++) {
				int pid = powerlist.get(j).getPoId();// 获得所有权限id
				if (spid == pid) {
					powerlist.remove(0);
					i--;
				}
			}

		}
		mav.addObject("list", powerlist);
		mav.addObject("role", roleService.getById(role.getRoId()));
		mav.setViewName("admin/rolePower/addPowerlist");
		return mav;
	}

	/**
	 * <p>
	 * 方法功能描述：给角色增加一级权限
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午7:54:04
	 * @参数：@param role 角色对象
	 * @参数：@param power 权限对象
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("addRolePower")
	public ModelAndView addRolePower(Role role, Power power) {
		ModelAndView mav = new ModelAndView();
		String[] pid = power.getPoName().split(",");
		for (int i = 0; i < pid.length; i++) {
			RolePower rp = new RolePower();
			rp.setRpRoleid(role.getRoId());
			int powerId = Integer.parseInt(pid[i].trim());
			rp.setRpPowerid(powerId);
			rolePowerService.save(rp);
		}
		mav.setViewName("redirect:../rolePower/listPower.do?roId="
				+ role.getRoId());
		return mav;
	}

	/**
	 * <p>
	 * 方法功能描述：根据一级权限获取未选的二级权限
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午7:54:45
	 * @参数：@param role 角色对象
	 * @参数：@param power 权限对象
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("addChildPower")
	public ModelAndView addChildPower(Role role, Power power) {
		ModelAndView mav = new ModelAndView();
		Power p = powerService.getById(power.getPoId());// 根据权限id得到一条一级权限
		List<RolePower> rplist = rolePowerService.listByRoleId(role.getRoId());// 获得这个角色的所有权限id
		List<Power> cplist = powerService.listChildPower(p);// 获取父id等于一级权限id的权限list
		for (int j = 0; j < rplist.size(); j++) {
			int rpid = rplist.get(j).getRpPowerid();// 这个角色的所有权限id
			for (int i = 0; i < cplist.size(); i++) {
				int cpid = cplist.get(i).getPoId();// 子权限的id
				if (cpid == rpid) {
					cplist.remove(i);
					i--;
				}
			}
		}
		mav.addObject("cplist", cplist);
		mav.addObject("role", roleService.getById(role.getRoId()));
		mav.addObject("power", p);
		mav.setViewName("admin/rolePower/addChildPowerlist");
		return mav;
	}

	/**
	 * <p>
	 * 方法功能描述：显示已选子权限
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午9:30:59
	 * @参数：@param role 角色对象
	 * @参数：@param power 权限对象
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("childPower")
	public ModelAndView childPower(Role role, Power power) {
		ModelAndView mav = new ModelAndView();
		Power p = powerService.getById(power.getPoId());// 根据权限id得到一条一级权限

		List<RolePower> rplist = rolePowerService.listByRoleId(role.getRoId());// 获得这个角色的所有权限id
																				// list
																				// 1235
		List<Power> cplist = powerService.listChildPower(p);// 获取父id等于一级权限id的权限list
															// 2348
		List<Power> clist = new ArrayList<Power>();
		for (int j = 0; j < rplist.size(); j++) {
			int rpid = rplist.get(j).getRpPowerid();// 这个角色的所有权限id
			for (int i = 0; i < cplist.size(); i++) {
				int cpid = cplist.get(i).getPoId();// 子权限的id
				if (cpid == rpid) {
					clist.add(cplist.get(i));
				}

			}
		}
		mav.addObject("clist", clist);
		mav.addObject("role", role);
		mav.addObject("fpower", p);// 一级权限
		mav.setViewName("admin/rolePower/childPowerlist");
		return mav;
	}

	/**
	 * <p>
	 * 方法功能描述：增加子权限
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2016-9-1 下午10:25:52
	 * @参数：@param role 角色对象
	 * @参数：@param power 权限对象
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("saveChildPower")
	public ModelAndView saveChildPower(Role role, Power power) {
		ModelAndView mav = new ModelAndView();
		String[] pid = power.getPoName().split(",");// 选中的
		for (int i = 0; i < pid.length; i++) {
			RolePower rp = new RolePower();
			rp.setRpRoleid(role.getRoId());
			int powerId = Integer.parseInt(pid[i].trim());
			rp.setRpPowerid(powerId);
			rolePowerService.save(rp);
		}
		mav.setViewName("redirect:../rolePower/listPower.do?roId="
				+ role.getRoId());
		return mav;
	}

	/**
	 * <p>
	 * 方法功能描述：删除角色拥有权限
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午2:56:21
	 * @参数：@param power 权限对象
	 * @参数：@param role 角色对象
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("delete")
	public ModelAndView delete(Power power, Role role) {
		ModelAndView mav = new ModelAndView();
		List<RolePower> list = rolePowerService.listByRoleId(role.getRoId());// 取出当前角色的所有权限

		for (int i = 0; i < list.size(); i++) {

			int pid = list.get(i).getRpPowerid();

			Power p = powerService.getAllById(pid);
			if (p.getParentid() == power.getPoId()) {
				rolePowerService.delete(list.get(i).getRpId());
			}
			if (list.get(i).getRpPowerid() == power.getPoId()) {
				rolePowerService.delete(list.get(i).getRpId());
			}
		}

		mav.setViewName("redirect:../rolePower/listPower.do?roId="+ role.getRoId());
		return mav;
	}

	/**
	 * <p>方法功能描述：菜单权限控制</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-16 下午7:17:28
	 * @参数：@param role 角色对象
	 * @参数：@param req
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("adminPower")
	public ModelAndView adminPower(Role role, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		// 根据角色id查该角色拥有的所有权限, 得到关系list
		List<RolePower> rplist = rolePowerService.listByRoleId(role.getRoId());
		//根据关系list里面的pid获得权限list
		List<Power> plist = new ArrayList<Power>();
		
		for (int i = 0; i < rplist.size(); i++) {
			RolePower rp = rplist.get(i);
			plist.add(powerService.getAllById(rp.getRpPowerid()));
		}
		
		//一级权限list
		List<Power> fplist = new ArrayList<Power>();
		//二级权限list
		List<Power> cplist = new ArrayList<Power>();
		List<String> icons = new ArrayList<String>();
		icons.add("home");
		icons.add("list");
		icons.add("home");
		icons.add("file");
		icons.add("question-sign");
		icons.add("tasks");
		icons.add("folder-open");
		int ss = 0;
		for(int j = 0; j < plist.size(); j++){
			if(plist.get(j).getParentid() == 0){
				Power p = plist.get(j);
				p.setIcon(icons.get(ss));
				fplist.add(p);
				ss++;
			}else{
				cplist.add(plist.get(j));
			}
		}

//		mav.addObject("fplist", fplist);
//		mav.addObject("cplist", cplist);
		req.getSession().setAttribute("fplist", fplist);
		req.getSession().setAttribute("cplist", cplist);
		mav.setViewName("admin/admin");
		
		return mav;
	}

}
