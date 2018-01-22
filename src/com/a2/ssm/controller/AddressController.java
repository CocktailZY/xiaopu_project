package com.a2.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.a2.ssm.model.Address;
import com.a2.ssm.model.User;
import com.a2.ssm.service.AddressService;
import com.a2.ssm.service.UserService;

@Controller
@RequestMapping("/address")
public class AddressController {

	@Autowired
	private AddressService addressService;
	@Autowired
	private UserService userService;

	/**
	 * <p>方法功能描述：如果获取到addID新增地址信息，没有则更新信息</p>
	 * @方法作者：lx
	 * @创建时间：2018-9-7 下午4:44:48
	 * @参数：@param addr
	 * @参数：@param request    
	 * @返回类型：void   
	 * @throws
	 */
	@RequestMapping("saveAdd")
	public ModelAndView saveAdd(Address addr,HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		//获取用户id
		User user = (User) request.getSession().getAttribute("loginUser");
		int uid = user.getuId(); 
		//获取详细地址
		String shen = request.getParameter("location_p");
		String shi = request.getParameter("location_c");
		String xian = request.getParameter("location_a");
		String jie = request.getParameter("location_x");
		if(jie == null || jie == ""){
			jie = "空";
		}
		String address = shen+","+shi+","+xian+","+jie;
		//将获取到的地址信息放到地址类对象中
		addr.setAddress(address);
		addr.setAddUserid(uid);
		//将信息存入数据库(如果id没有值为新增，有值为更新)
		if(addr.getAddId()!=null){
			addressService.update(addr);
		}else{
			addressService.save(addr);
		}
		
		//获取地址信息(姓名和电话)
		List<Address> addList = addressService.getListByUid(user.getuId());
		//获取地址信息(去掉‘，’的地址)
		for(int i=0;i<addList.size();i++){
			String addres = addList.get(i).getAddress();
			addList.get(i).setAddress(addres.replace(",", ""));
		}
		//重回个人信息页面，同时将更新后的user传回
		mav.setViewName("/user/pc_address");
		mav.addObject("addList", addList);
		return mav;
	}
	
	/**
	 * <p>方法功能描述：使用ajax改变页面中的默认地址</p>
	 * @方法作者：lx
	 * @创建时间：2018-9-13 下午2:44:54
	 * @参数：@param request    
	 * @返回类型：void   
	 * @throws
	 */
	@RequestMapping("changeAddState")
	public void changeAddState(HttpServletRequest request){
		//从页面获取地址id
		int addId = Integer.parseInt(request.getParameter("addId"));
		//获取用户id
		User user = (User) request.getSession().getAttribute("loginUser");
		int uid = user.getuId(); 
		//获取地址信息(姓名和电话)
		List<Address> addList = addressService.getListByUid(user.getuId());
		//根据地址id查询地址信息
		Address addr = addressService.getById(addId);
		//先将全部的地址信息的状态（addState）改为0
		for(int i=0;i<addList.size();i++){
			addList.get(i).setAddState(0);
			addressService.update(addList.get(i));
		}
		//再将页面中选中的地址的状态改为1
		addr.setAddState(1);
		addressService.update(addr);
		
	}
	
	/**
	 * <p>方法功能描述：在页面中使用ajax，点击修改时在上面出现地址信息</p>
	 * @方法作者：lx
	 * @创建时间：2018-9-8 上午10:23:55
	 * @参数：@param request
	 * @参数：@param response
	 * @参数：@throws IOException    
	 * @返回类型：void   
	 * @throws
	 */
	@RequestMapping("findById")
	public void findById(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int addId = Integer.parseInt(request.getParameter("addId"));
		//根据id查询地址信息
		Address addr = addressService.getById(addId);
		//获取没有逗号的地址
		String[] addrs = addr.getAddress().split(",");
		String shen = addrs[0];
		String shi = addrs[1];
		String xian = addrs[2];
		String jie = addrs[3];
		
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jo = new JSONObject();
		jo.put("shen", shen);
		jo.put("shi", shi);
		jo.put("xian", xian);
		jo.put("jie", jie);
		jo.put("addr", addr);
		PrintWriter out = response.getWriter();
		out.write(jo.toString());
		out.flush();
		out.close();
	}

	/**
	 * <p>方法功能描述：根据addId删除地址信息</p>
	 * @方法作者：lx
	 * @创建时间：2018-9-13 下午2:33:01
	 * @参数：@param addId
	 * @参数：@param request
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("deleteById")
	public ModelAndView deleteById(int addId,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		//获取用户id
		User user = (User) request.getSession().getAttribute("loginUser");
		int uid = user.getuId(); 
		//根据addId删除addr
		addressService.delete(addId);
		//获取地址信息(姓名和电话)
		List<Address> addList = addressService.getListByUid(user.getuId());
		//获取地址信息(去掉‘，’的地址)
		for(int i=0;i<addList.size();i++){
			String addres = addList.get(i).getAddress();
			addList.get(i).setAddress(addres.replace(",", ""));
		}
		//重回个人信息页面，同时将更新后的user传回
		mav.setViewName("/user/pc_address");
		mav.addObject("addList", addList);
		return mav;
	}
}
