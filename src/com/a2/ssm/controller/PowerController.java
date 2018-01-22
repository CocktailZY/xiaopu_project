package com.a2.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.a2.ssm.model.Power;
import com.a2.ssm.service.PowerService;

/**
 * <p>
 * 类名：PowerController
 * </p>
 * <p>
 * 类功能描述：权限 Handler层
 * </p>
 * ：
 * 
 * @类作者：zy
 * @创建时间：2018-9-4 下午4:45:58
 * @小组：A2小组
 */
@Controller
@RequestMapping("/power")
public class PowerController {

	@Autowired
	private PowerService powerService;

	/**
	 * <p>
	 * 方法功能描述：显示一级权限
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2018-9-2 下午3:43:07
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<Power> list = powerService.listParentPower();
		mav.addObject("list", list);
		mav.setViewName("admin/power/powerlist");
		return mav;
	}

	/**
	 * <p>
	 * 方法功能描述：根据一级菜单id显示子菜单
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2018-9-2 下午4:04:08
	 * @参数：@param power 权限对象
	 * @参数：@param response
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("childlist")
	public String childlist(Power power, HttpServletResponse response) {
		List<Power> childlist = powerService.listChildPower(power);
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();

		for (Power specs : childlist) {
			jo.put("poId", specs.getPoId());
			jo.put("poName", specs.getPoName());
			json.add(jo);
		}
		PrintWriter out;
		try {
			response.setContentType("application/json;charset=UTF-8");
			out = response.getWriter();
			out.write(json.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * <p>
	 * 方法功能描述：查询所有父权限Json对象封装
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2018-9-4 下午1:58:38
	 * @参数：@param response
	 * @参数：@return
	 * @返回类型：String
	 * @throws
	 */
	@RequestMapping("listFpower")
	public String listFpower(HttpServletResponse response) {
		List<Power> flist = powerService.listParentPower();
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();

		for (Power specs : flist) {
			jo.put("poId", specs.getPoId());
			jo.put("poName", specs.getPoName());
			json.add(jo);
		}
		PrintWriter out;
		try {
			response.setContentType("application/json;charset=UTF-8");
			out = response.getWriter();
			out.write(json.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * <p>
	 * 方法功能描述：增加权限
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2018-9-4 下午4:46:51
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("save")
	public ModelAndView save(Power power, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		Power p = new Power();
		p.setPoName(power.getPoName());// 设置权限名称

		String typeId = req.getParameter("powertype");// 获取是父权限还是子权限
		if ("0".equals(typeId)) {// 如果新增父权限
			p.setParentid(0);// 设置其父权限为0
			powerService.save(p);
		} else {
			String fid = req.getParameter("fid");
			p.setParentid(Integer.parseInt(fid));// 设置其父id
			p.setUrl(power.getUrl());//设置url
			powerService.save(p);
		}
		return new ModelAndView(new RedirectView("../power/list.do"));
	}

	/**
	 * <p>
	 * 方法功能描述：更新权限信息
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2018-9-4 下午6:49:17
	 * @参数：@param power
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("update")
	public ModelAndView update(Power power) {
		ModelAndView mav = new ModelAndView();
		// Power p = powerService.getById(power.getPoId());
		if (power.getParentid() == null) {
			power.setParentid(0);
			powerService.update(power);
		} else {
			powerService.update(power);

		}
		return new ModelAndView(new RedirectView("../power/list.do"));
	}

	/**
	 * <p>
	 * 方法功能描述：查询所有二级权限
	 * </p>
	 * 
	 * @方法作者：zy
	 * @创建时间：2018-9-4 下午7:16:47
	 * @参数：@return
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("cplist")
	public ModelAndView cplist() {
		ModelAndView mav = new ModelAndView();

		List<Power> list = powerService.list();// 取出所有权限
		List<Power> plist = powerService.listParentPower();// 所有一级权限
		List<Power> cplist = new ArrayList<Power>();// 所有二级权限
			for (int j = 0; j < list.size(); j++) {
				Power cp = list.get(j);
				if (cp.getParentid() != 0) {
					cplist.add(cp);// 所有二级权限
				}
		}
		mav.addObject("plist", plist);
		mav.addObject("clist", cplist);
		mav.setViewName("admin/power/cpowerlist");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：删除权限</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-5 上午11:44:37
	 * @参数：@param power 权限对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("delete")
	public ModelAndView delete(Power power){
		ModelAndView mav = new ModelAndView();
		if(power.getParentid()==0){
			List<Power> list = powerService.listChildPower(power);
			for(int i = 0; i < list.size(); i++){
				powerService.delete(list.get(i).getPoId());//将其子权限删除
			}
			powerService.delete(power.getPoId());//在删除一级权限
		}else{
			powerService.delete(power.getPoId());//删除二级权限
		}
		
		return new ModelAndView(new RedirectView("../power/list.do"));
	}
}
