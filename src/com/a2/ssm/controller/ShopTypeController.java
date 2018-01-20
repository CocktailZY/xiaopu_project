package com.a2.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.a2.ssm.model.Shop;
import com.a2.ssm.model.ShopType;
import com.a2.ssm.service.ShopTypeService;


@Controller
@RequestMapping("/shopType")
public class ShopTypeController {

	@Autowired
	private ShopTypeService shopTypeService;


	@RequestMapping("/typeSel")
	private ModelAndView typeSel(){
		ModelAndView mav = new ModelAndView();
		List<ShopType> shopType = shopTypeService.typeSel();
		mav.addObject("shopType", shopType);
		System.out.println(shopType);
		mav.setViewName("seller/selSignUp");
		return mav;
	}
}


