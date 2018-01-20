package com.a2.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.a2.ssm.model.Address;
import com.a2.ssm.model.Power;
import com.a2.ssm.model.Role;
import com.a2.ssm.model.User;
import com.a2.ssm.service.AddressService;
import com.a2.ssm.service.RoleService;
import com.a2.ssm.service.UserService;


/**
 * <p>类名：UserController</p>
 * <p>类功能描述：User Handler层</p>
 * @类作者：zy
 * @创建时间：2016-8-29 下午8:45:25
 * @小组：A2小组
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private AddressService addressService;
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	/**
	 * <p>方法功能描述：用户登录</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-29 下午8:47:01
	 * @参数：页面传的用户实体  @param dto
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("login")
	public ModelAndView login(User dto,HttpServletRequest req){
		log.info("UserController.login----------strat---------");
		ModelAndView mav = new ModelAndView();
		User user = userService.login(dto);
		if(user!=null && user.getuState()!=0){
			req.getSession().setAttribute("loginUser", user);
			if(user.getuRoleid()!=2 && user.getuRoleid()!=3){
				log.info("UserController.login----------success---------");
				return new ModelAndView(new RedirectView("../rolePower/adminPower.do?roId="+user.getuRoleid()));//如果当前登录用户角色为管理员,则跳转到后台界面

			}else{
				log.info("UserController.login----------success---------");
				return new ModelAndView(new RedirectView("../index.jsp"));//否则跳转前台页面
			}
		}else{
			mav.setViewName("error");
			log.info("UserController.login----------fail---------");
		}
		log.info("UserController.login----------end---------");
		//app.setFile(user.getuName()+"----"+user.getuPwd()+"----"+user.getRole().getRoName());
		return mav;
	}
	/**
	 * <p>方法功能描述：用户注销</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-15 上午11:23:13
	 * @参数：@param req
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("loginout")
	public ModelAndView loginout(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		req.getSession().removeAttribute("loginUser");
		req.getSession().removeAttribute("adminPower");
		mav.setViewName("../login");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：后台登录之前获得角色</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-29 下午8:59:22
	 * @参数：页面传的用户实体  @param dto
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("admin")
	public ModelAndView admin(User dto,HttpServletRequest req){
		req.getSession().removeAttribute("loginUser"); 
		ModelAndView mav = new ModelAndView();
		List<Role> list = roleService.list();
		mav.addObject("rolelist", list);
		
		mav.setViewName("admin/login");
		
		return mav;
	}
	
	/**
	 * <p>方法功能描述：通过id查询用户信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-31 上午10:15:59
	 * @参数：@param id
	 * @参数：@param req
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("getById")
	public ModelAndView getById(User dto,HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		User user = userService.getById(dto.getuId());
		Role role = roleService.getById(user.getuRoleid());
		mav.addObject("userinfo", user);
		mav.addObject("role", role);
		mav.setViewName("admin/user/userinfo");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：查询所有用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-8-31 上午11:19:28
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("list")
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView();
		List<User> list = userService.listByRole();
		List<Role> rolelist = roleService.list();
		
		mav.addObject("list", list);
		mav.addObject("rlist", rolelist);
		mav.setViewName("admin/user/userlist");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：查询所有管理员信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 下午12:43:58
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("listAdmin")
	public ModelAndView listAdmin(){
		ModelAndView mav = new ModelAndView();
		List<User> list = userService.listByAdminRole();
		List<Role> rolelist = roleService.list();
		mav.addObject("list", list);
		mav.addObject("rlist", rolelist);
		mav.setViewName("admin/user/adminlist");
		return mav;
	}
	
	
	/*-------------------------------lx----------------------------------------*/
	
	/**
	 * @throws IOException 
	 * <p>方法功能描述：前台注册页面使用ajax检测用户名是否重复</p>
	 * @方法作者：lx
	 * @创建时间：2016-8-31 下午4:12:47
	 * @参数：@param request
	 * @参数：@param response    
	 * @返回类型：void   
	 * @throws
	 */
	@RequestMapping("findByName")
	public void findByName(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		String uName = request.getParameter("uName");
		User user = new User();
		user.setuName(uName);
		user = userService.findByName(user);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//正则表达式限16个字符，支持中英文、数字、减号或下划线
		String regStr = "^[A-Za-z0-9_\u4e00-\u9fa5]{4,16}$";
		if(uName.matches(regStr)){
			if(user !=null){
				String jsonStr = "{\"mes\":\"<font color='red'>用户名重复</font>\",\"flag\":false}";
				out.write(jsonStr);
			}else{
				String jsonStr = "{\"mes\":\"<font color='green'>用户名可用</font>\",\"flag\":true}";
				out.write(jsonStr);
			}
		}else{
			String jsonStr = "{\"mes\":\"<font color='red'>用户名规范不合格</font>\",\"flag\":false}";
			out.write(jsonStr);
		}
		
		out.flush();
		out.close();
	}
	
	/**
	 * <p>方法功能描述：前台用户将注册信息添加到数据库中</p>
	 * @方法作者：lx
	 * @创建时间：2016-8-31 下午2:34:48
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("save")
	public ModelAndView save(User dto){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/result");
		userService.save(dto);
		return mav;//提示去激活
	}
	/**
	 * <p>方法功能描述：新增管理员</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-17 下午7:52:28
	 * @参数：@param user 用户对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("saveAdmin")
	public ModelAndView saveAdmin(User user){
		userService.saveAdmin(user);
		return new ModelAndView(new RedirectView("../user/listAdmin.do"));
	}
	/**
	 * @return 
	 * <p>方法功能描述：根据激活码查找用户，如果找到了的话，则删除激活码
	 * (数据库里设为不可空了，一气之下就不删了)并更改用户状态，跳转到登录页面，如果没有找到，则跳转回注册页面</p>
	 * @方法作者：lx
	 * @创建时间：2016-9-1 下午4:47:38
	 * @参数：@param uCode    
	 * @返回类型：void   
	 * @throws
	 */
	@RequestMapping("active")
	public ModelAndView active(@RequestParam("code") String uCode){
		ModelAndView mav = new ModelAndView();
		User user = new User();
		user.setuCode(uCode);
		user = userService.getByCode(user);
		if(user != null){
			user.setuState(1);
			//user.setuCode(null);
			userService.update(user);
			return new ModelAndView(new RedirectView("../login.jsp"));//注册成功重定向到登陆页面
		}else{
			return new ModelAndView(new RedirectView("../view/user/signup.jsp"));//注册失败返回到注册页面
		}
	}
	
	/**
	 * <p>方法功能描述：接收session域中login()方法存入的登陆用户信息，根据信息编辑用户信息,把用户信息和地址信息一起传回去</p>
	 * @方法作者：lx
	 * @创建时间：2016-9-2 下午10:56:34
	 * @参数：@param request    
	 * @返回类型：void   
	 * @throws
	 */
	@RequestMapping("findById")
	public ModelAndView findById(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		//获取用户信息
		User user = (User) request.getSession().getAttribute("loginUser");
		//获取地址信息(姓名和电话)
		List<Address> addList = addressService.getListByUid(user.getuId());
		//获取地址信息(去掉‘，’的地址)
		for(int i=0;i<addList.size();i++){
			String address = addList.get(i).getAddress();
			addList.get(i).setAddress(address.replace(",", ""));
		}
		
		mav.setViewName("/user/pc_address");
		//mav.addObject("user", user);
		mav.addObject("addList", addList);
		return mav;
	}
	/**
	 * <p>方法功能描述：重新上传头像</p>
	 * @方法作者：lx
	 * @创建时间：2016-9-5 下午8:19:32
	 * @参数：@param file
	 * @参数：@param request
	 * @参数：@return
	 * @参数：@throws IllegalStateException
	 * @参数：@throws IOException    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("changeHead")
	public ModelAndView changeHead(@RequestParam("hf") MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mav = new ModelAndView();
		//设置上传路径
		String path = request.getSession().getServletContext().getRealPath("/fileUpload");	
		if(!file.isEmpty()){
			// file.transferTo：转存文件  
			// file.getOriginalFilename：得到上传时的文件名
			file.transferTo(new File(path + "/" + file.getOriginalFilename()));
		}
		//获取页面中的user，并改变uhead的值!!!!!!!!!!!!!!!!!(houmianyidingyaogai)
		User user = (User) request.getSession().getAttribute("loginUser");
		user.setuHead(file.getOriginalFilename());
		userService.update(user);
		request.getSession().setAttribute("loginUser", user);
		//重回个人信息页面，同时将更新后的user传回
		mav.setViewName("/user/pc_message");
		return mav;
	}
	/**
	 * <p>方法功能描述：AJAX传角色list</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 下午3:27:25
	 * @参数：@param response
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("roleList")
	public String roleList(HttpServletResponse response) {
		List<Role> flist = roleService.list();
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();

		for (Role specs : flist) {
			jo.put("roId", specs.getRoId());
			jo.put("roName", specs.getRoName());
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
	 * <p>方法功能描述：AJAX传管理员角色list</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 下午3:27:25
	 * @参数：@param response
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("listAdminRole")
	public String listAdminRole(HttpServletResponse response) {
		List<Role> flist = roleService.listAdmin();
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();

		for (Role specs : flist) {
			jo.put("roId", specs.getRoId());
			jo.put("roName", specs.getRoName());
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
	 * <p>方法功能描述：更新用户信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-13 下午4:30:39
	 * @参数：@param user 用户对像
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("update")
	public ModelAndView update(User user){
		
		userService.update(user);
		
		return new ModelAndView(new RedirectView("../user/list.do"));
	}
	
	/**
	 * <p>方法功能描述：更新管理员</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-17 下午7:49:17
	 * @参数：@param user 用户对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("updateAdmin")
	public ModelAndView updateAdmin(User user){
		userService.updateAdmin(user);
		return new ModelAndView(new RedirectView("../user/listAdmin.do"));
	}
	/**
	 * <p>方法功能描述：激活管理员</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-17 下午7:49:17
	 * @参数：@param user 用户对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("jhAdmin")
	public ModelAndView jhAdmin(User user){
		userService.jhAdmin(user);
		return new ModelAndView(new RedirectView("../user/listAdmin.do"));
	}
	/**
	 * <p>方法功能描述：逻辑删除用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-14 下午3:26:43
	 * @参数：@param user
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("delete")
	public ModelAndView delete(User user){
		userService.delete(user.getuId());
		return new ModelAndView(new RedirectView("../user/list.do"));
	}
	/**
	 * <p>方法功能描述：逻辑删除用户</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-14 下午3:26:43
	 * @参数：@param user
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("deleteAdmin")
	public ModelAndView deleteAdmin(User user){
		userService.delete(user.getuId());
		return new ModelAndView(new RedirectView("../user/listAdmin.do"));
	}
	
}
