package com.a2.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.a2.ssm.model.Complaint;
import com.a2.ssm.model.User;
import com.a2.ssm.service.ComplaintService;
import com.a2.ssm.service.UserService;


/**
 * <p>类名：ComplaintController</p>
 * <p>类功能描述：投诉 Handler层</p>：
 * @类作者：zy
 * @创建时间：2018-9-5 下午7:55:39
 * @小组：A2小组
 */
@Controller
@RequestMapping("/complaint")
public class ComplaintController {

	@Autowired
	private ComplaintService complaintService;
	@Autowired
	private UserService userService;
	
	/**
	 * <p>方法功能描述：显示所有投诉</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-5 下午7:56:06
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("list")
	public ModelAndView list(Complaint comp){
		ModelAndView mav = new ModelAndView();
		List<Complaint> list = complaintService.list(comp);
		List<User> ulist = userService.list(1);
		mav.addObject("list", list);
		mav.addObject("ulist", ulist);
		mav.setViewName("admin/complaint/complaint-management");
		return mav;
	}
	/**
	 * <p>方法功能描述：确认审核投诉</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-6 下午5:18:03
	 * @参数：@param comp 投诉实体对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("shenhe")
	public ModelAndView shenhe(Complaint comp){
		Complaint complaint = complaintService.getById(comp.getCoId());
		if(comp.getCoState()==0){
			complaint.setCoState(1);
		}else{
			if(comp.getCoState()==1){
				complaint.setCoState(3);
			}else{
				complaint.setCoState(2);
			}
		}
		complaintService.update(complaint);
		return new ModelAndView(new RedirectView("../complaint/list.do"));
	}
	
}
