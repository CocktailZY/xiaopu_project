package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.model.Charge;
import com.service.ChargeService;


/**
 * <p>类名：ParameterController</p>
 * <p>类功能描述：停车场参数信息的增啥改查</p>
 * @类作者：renguangqi
 * @创建时间：2018-1-2 下午6:34:02
 */
@Controller
@RequestMapping("/charge")
public class ChargeController {

	//注入Service
	@Autowired
	private ChargeService chargeService;

	@RequestMapping("show")
	public ModelAndView show(){
		ModelAndView mav = new ModelAndView();
		//查询全部收费规则
		List<Charge> allChargeList = chargeService.allChargeList();
		mav.addObject("allChargeList", allChargeList);
		mav.setViewName("back/charge");
		return mav;
	}
	/**
	 * <p>方法功能描述：添加收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-7 下午8:41:16
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("addCharge")
	public String addCharge(Charge dto){
		chargeService.addCharge(dto);
		return "redirect:../charge/show.do";
	}
	
	/**
	 * <p>方法功能描述：删除收费规则</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-5-7 下午8:52:29
	 * @参数：@param cId
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("deleteCharge")
	public String deleteCharge(Integer chId){
		chargeService.deleteCharge(chId);
		return "redirect:../charge/show.do";
	}
	
}
