package com.zy.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.Consts;
import com.zy.model.Role;
import com.zy.service.RoleService;
import com.zy.util.Page;

@Controller
@RequestMapping("/admin/role")
public class AdminRoleController {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject adminRoleList(String pageNum,String pageSize,HttpServletRequest request,HttpServletResponse response) {
		log.info("enter admin role list");
		JSONObject json = new JSONObject();
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<Role> list = roleService.list();

		int pageNumStr = 1;
		if (pageNum != null && !"".equals(pageNum)) {
			pageNumStr = Integer.parseInt(pageNum);
			Page page = new Page(list.size(),pageNumStr,Consts.PAGE_SIZE);
			map.put("rowStart", page.getRowStart());
			map.put("pageSize", page.getPageSize());
			json.put("pageTotal",page.getPageCount());
		}else{
			map.put("rowStart", 0);
			map.put("pageSize", Consts.PAGE_SIZE);
		}
		
		List<Role> pageList = roleService.pageListAll(map);
		
		if(pageList.size() != 0){
			json.put("roleList", pageList);
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		
		return json;
	}
	
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveRole(@RequestBody Role role,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin role save");
		JSONObject json = new JSONObject();
		Role roleObj = roleService.save(role);
		if(null != roleObj){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/del.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject delRole(String roleId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin role del");
		JSONObject json = new JSONObject();
		int roleObj = roleService.delete(Integer.parseInt(roleId));
		if(roleObj == 1){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/getByRoleId.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getByRoleId(String roleId,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin role del");
		JSONObject json = new JSONObject();
		Role roleObj = roleService.getById(Integer.parseInt(roleId));
		if(null != roleObj){
			json.put("status", "success");
			json.put("roleInfo",roleObj);
		}else{
			json.put("status", "error");
		}
		return json;
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject update(@RequestBody Role role,HttpServletRequest request,HttpServletResponse response){
		log.info("enter admin role update");
		JSONObject json = new JSONObject();
		Role roleObj = roleService.update(role);
		if(null != roleObj){
			json.put("status", "success");
		}else{
			json.put("status", "error");
		}
		return json;
	}

}
