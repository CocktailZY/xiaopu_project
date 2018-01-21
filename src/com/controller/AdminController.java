package com.controller;

import java.util.List;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.model.Admin;
import com.model.Charge;
import com.model.Record;
import com.service.AdminService;
import com.service.ChargeService;
import com.service.RecordService;
import com.service.SpaceService;

/**
 * <p>类名：AdminController</p>
 * <p>类功能描述：管理员的Controller，主要有修改密码、登录首页展示方法</p>
 * @类作者：renguangqi
 * @创建时间：2018-1-2 下午6:34:02
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	//注入Service
	@Autowired
	private AdminService adminService;
	@Autowired
	private ChargeService chargeService;

	@Autowired
	private SpaceService spaceService;
	@Autowired
	private RecordService recordService;

	
	/**
	 * @throws ParseException 
	 * <p>方法功能描述：用户登录方法，以及首页登录显示信息方法</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-1-2 下午6:35:10
	 * @参数：@param dto
	 * @参数：@param req
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("login")
	public ModelAndView login(Admin dto,HttpServletRequest req) throws ParseException{
		ModelAndView mav = new ModelAndView();
		//根据输入的管理员信息，查询管理员信息
		Admin admin = adminService.login(dto);
		//登录首页查询显示停车场收费公告
		//临时卡规则
		List<Charge> allInterimList = chargeService.allInterimList();
		//会员卡规则
		List<Charge> allMemberList = chargeService.allMemberList();
		mav.addObject("allInterimList", allInterimList);
		mav.addObject("allMemberList", allMemberList);
		
		//登录首页查询显示空余车位数
		Integer getFreeCount = spaceService.getFreeCount();
		mav.addObject("getFreeCount", getFreeCount);
		
		//登录首页查询显示实时停车数
		Integer getCarCount = spaceService.getCarCount();
		mav.addObject("getCarCount", getCarCount);
		
		//获取当前系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String date = df.format(new Date());// new Date()为获取当前系统时间

		//查询显示停车场出入记录信息
				List<Record> recordList = recordService.recordList();
				Integer nowDateCount = 0;
				Date todaystr = new Date();
				todaystr.setHours(0);
				todaystr.setMinutes(0);
				todaystr.setSeconds(0);

				Date todayend = new Date();
				todayend.setHours(23);
				todayend.setMinutes(59);
				todayend.setSeconds(59);
				
				long todayStr = todaystr.getTime();
				long todayEnd = todayend.getTime();
				Integer allPrise = 0;
				for(int i = 0;i < recordList.size(); i ++){
					Record nowRecord = recordList.get(i);
					String startTime = nowRecord.getrStarttime();
					String endTime = nowRecord.getrEndtime();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式24小时制
					Date str;
					Date end;
					str = sdf.parse(startTime);
					
					long Start = str.getTime();
					
					if(todayStr<Start && Start<todayEnd){
						nowDateCount = nowDateCount+1;
					}
					
					if(endTime != null){
						end = sdf.parse(endTime);
						long End = end.getTime();
						if(todayStr<End && End<todayEnd){
							String todayPrise = nowRecord.getrPrise();
							Integer todayprise = Integer.parseInt(todayPrise);
							allPrise = allPrise + todayprise;
						}
					}
				}
				mav.addObject("nowDateCount", nowDateCount);
				mav.addObject("allPrise", allPrise);
		//根据查询结果判断用户登录是否成功
		if(admin!=null){
			mav.setViewName("back/index");
		}else{
			mav.setViewName("back/error");
		}
		return mav;
	}
	
	/**
	 * @throws ParseException 
	 * <p>方法功能描述：点击左侧导航栏首页显示</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-1-28 上午11:36:05
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("show")
	public ModelAndView show() throws ParseException{
		ModelAndView mav = new ModelAndView();
		//登录首页查询显示停车场收费公告
		//临时卡规则
		List<Charge> allInterimList = chargeService.allInterimList();
		//会员卡规则
		List<Charge> allMemberList = chargeService.allMemberList();
		mav.addObject("allInterimList", allInterimList);
		mav.addObject("allMemberList", allMemberList);
		
		//登录首页查询显示空余车位数
		Integer getFreeCount = spaceService.getFreeCount();
		mav.addObject("getFreeCount", getFreeCount);
		
		//登录首页查询显示实时停车数
		Integer getCarCount = spaceService.getCarCount();
		mav.addObject("getCarCount", getCarCount);
		
		//查询显示停车场出入记录信息
		List<Record> recordList = recordService.recordList();
		Integer nowDateCount = 0;
		Date todaystr = new Date();
		todaystr.setHours(0);
		todaystr.setMinutes(0);
		todaystr.setSeconds(0);

		Date todayend = new Date();
		todayend.setHours(23);
		todayend.setMinutes(59);
		todayend.setSeconds(59);
		
		long todayStr = todaystr.getTime();
		long todayEnd = todayend.getTime();
		Integer allPrise = 0;
		for(int i = 0;i < recordList.size(); i ++){
			Record nowRecord = recordList.get(i);
			String startTime = nowRecord.getrStarttime();
			String endTime = nowRecord.getrEndtime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式24小时制
			Date str;
			Date end;
			str = sdf.parse(startTime);
			
			long Start = str.getTime();
			
			if(todayStr<Start && Start<todayEnd){
				nowDateCount = nowDateCount+1;
			}
			
			if(endTime != null){
				end = sdf.parse(endTime);
				long End = end.getTime();
				if(todayStr<End && End<todayEnd){
					String todayPrise = nowRecord.getrPrise();
					Integer todayprise = Integer.parseInt(todayPrise);
					allPrise = allPrise + todayprise;
				}
			}
		}
		mav.addObject("nowDateCount", nowDateCount);
		mav.addObject("allPrise", allPrise);
		mav.setViewName("back/index");
		return mav;
	}
	@RequestMapping("changepwd")
	public String changePwd(Admin admin){
		adminService.changePwd(admin);
		return "redirect:../admin/show.do";		
	}
}
