package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.model.Card;
import com.model.Charge;
import com.model.Zone;
import com.service.CardService;
import com.service.SpaceService;
import com.service.ZoneService;


@Controller
@RequestMapping("/card")
public class CardController {

	//注入Service
	@Autowired
	private CardService cardService;


	@RequestMapping("show")
	public ModelAndView show(){
		ModelAndView mav = new ModelAndView();
		//查询所有会员卡信息
		List<Card> allCardList = cardService.allCardList();
		
		mav.addObject("allCardList", allCardList);
		mav.setViewName("back/card");
		return mav;
	}
	
	@RequestMapping("selectCard")
	public ModelAndView selectCard(String selectString){
		ModelAndView mav = new ModelAndView();
		if(selectString!=""){
			//按照卡号查询
			List<Card> selectNumberList = cardService.selectNumberList(selectString);
			//按照用户名查询
			List<Card> selectUserList = cardService.selectUserList(selectString);
			//按照车牌号查询
			List<Card> selectPlatenumberList = cardService.selectPlatenumberList(selectString);
			mav.addObject("selectNumberList", selectNumberList);
			mav.addObject("selectUserList", selectUserList);
			mav.addObject("selectPlatenumberList", selectPlatenumberList);
		}else{
			List<Card> allCardList = cardService.allCardList();	
			mav.addObject("allCardList", allCardList);
		}
		mav.setViewName("back/card");
		return mav;
	}

	
	@RequestMapping("addCard")
	public String addCard(Card dto){
		cardService.addCard(dto);
		return "redirect:../card/show.do";
	}
	
	@RequestMapping("addMoney")
	public String addMoney(Card dto){
		//查询余额
		String cNumber = dto.getcNumber();
		String Money = cardService.selectMoneyBycNumber(cNumber);
		//类型转换
		Integer moneyInteger = Integer.parseInt(Money);
		String cMoneyString = dto.getcMoney();
		Integer cMoneyInteger = Integer.parseInt(cMoneyString);
		//余额与充值金额相加
		Integer allMoneyInteger = moneyInteger+cMoneyInteger;
		String allMoney = allMoneyInteger.toString();
		dto.setcMoney(allMoney);
		cardService.addMoney(dto);
		return "redirect:../card/show.do";
	}
	
	@RequestMapping("reduceMoney")
	public String reduceMoney(String cNumber){
		cardService.reduceMoney(cNumber);
		return "redirect:../card/show.do";
	}
	
	
	@RequestMapping("deleteCard")
	public String deleteCard(Integer cId){
		cardService.deleteCard(cId);
		return "redirect:../card/show.do";
	}
	
	@RequestMapping("updateCard")
	public String updateCard(Card dto){
		cardService.updateCard(dto);
		return "redirect:../card/show.do";
	}
	
	@RequestMapping("userEnter")
	public String userEnter(Card dto){
		//cardService.userEnter(dto);
		return "redirect:../record/show.do";
	}
	
}
