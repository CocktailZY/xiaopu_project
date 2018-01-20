package com.a2.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.a2.ssm.service.OrderDetailService;


/**
 * <p>类名：订单详情</p>
 * <p>类功能描述：存放订单的</p>
 * @类作者：sun
 * @创建时间：2016-9-2 下午1:48:08
 * @小组：A2小组
 */
@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController {

	@Autowired
	private OrderDetailService orderDetailService;
	
	/**
	 * <p>方法功能描述：</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-2 下午1:58:39
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	public ModelAndView findAllOrderDetail(){	
		return null;
	}
}
