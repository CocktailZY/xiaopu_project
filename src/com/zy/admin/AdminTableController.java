package com.zy.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.Consts;
import com.zy.model.TableChange;
import com.zy.service.TableChangeService;
import com.zy.util.Page;

@Controller
@RequestMapping("/admin/table")
public class AdminTableController {

private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private TableChangeService tableChangeService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject adminTableList(String pageNum,String pageSize,String status,HttpServletRequest request,HttpServletResponse response) {
		log.info("enter admin Table list");
		JSONObject json = new JSONObject();
		JSONArray jsonObj = new JSONArray();
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<TableChange> list = tableChangeService.list();

		if(null != status && !"".equals(status)){
			map.put("status", status);
		}
		
//		int pageNumStr = 1;
//		if (pageNum != null && !"".equals(pageNum)) {
//			pageNumStr = Integer.parseInt(pageNum);
//			Page page = new Page(list.size(),pageNumStr,Consts.PAGE_SIZE);
//			map.put("rowStart", page.getRowStart());
//			map.put("pageSize", page.getPageSize());
//			json.put("pageTotal",page.getPageCount());
//		}else{
//			map.put("rowStart", 0);
//			map.put("pageSize", pageSize);
//		}
		
		jsonObj = tableChangeService.tableComplete(map);
		
		if(jsonObj.size() == 0 || "".equals(jsonObj)){
			json.put("status", "error");
		}else{
			json.put("tableList", jsonObj);
			json.put("status", "success");
		}
		log.info("adminTable:"+json);
		
		return json;
	}
	
}
