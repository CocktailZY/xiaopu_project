package com.a2.ssm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.a2.ssm.model.User;
import com.a2.ssm.service.FavoritesService;

/**
 * 
 * <p>类名：FavoritesController</p>
 * <p>类功能描述：收藏夹</p>
 * @类作者：sun
 * @创建时间：2016-9-1 上午11:33:09
 * @小组：A2小组
 */
@Controller
@RequestMapping("/favorites")
public class FavoritesController {

	@Autowired
	private FavoritesService favoritesService;
	
	/**
	 * <p>方法功能描述：收藏夹登录验证</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-1 下午1:55:49
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("favourite")
	public ModelAndView favourite(HttpServletRequest request){
		User user =(User) request.getSession().getAttribute("loginUser");
		if(user==null){
			return new ModelAndView(new RedirectView("../login.jsp"));
		}
		ModelAndView mav=new ModelAndView();
		mav.setViewName("user/favourite");
		return mav;
	}
}
