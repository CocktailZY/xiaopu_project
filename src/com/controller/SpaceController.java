package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;


import com.model.Charge;
import com.model.Space;
import com.model.Zone;
import com.service.ChargeService;
import com.service.SpaceService;
import com.service.ZoneService;



@Controller
@RequestMapping("/space")
public class SpaceController {

	//注入Service
	@Autowired
	private SpaceService spaceService;
	@Autowired
	private ZoneService zoneService;
	
	@RequestMapping("show")
	public ModelAndView show(){
		ModelAndView mav = new ModelAndView();
		//查询全部区块信息
		List<Zone> allZoneList = zoneService.allZoneList();
		mav.addObject("allZoneList",allZoneList);
		//查询所有车位
		List<Space> allSpaceList = spaceService.allSpaceList();
		//查询所有占用车位所在区块的list（除去重复内容）
		List<Space> allZoneNameList = spaceService.allZoneNameList();
		mav.addObject("allSpaceList",allSpaceList);
		mav.addObject("allZoneNameList",allZoneNameList);
		mav.setViewName("back/space");
		return mav;
	}
	
	@RequestMapping("addSpace")
	public String addSpace(Space dto,Integer count){
		//根据添加条数，for循环
		for(int m = 0; m<count ; m++){
			//根据区块名称查询该区块所有车位编号的列表（正序）
			List<String> allNumberList = spaceService.allNumberList(dto);
			if(allNumberList.size()!=0){
				//根据编号list，利用for循环判断编号是否连续，遇到不连续的地方将该编号添加到新增的车位编号中
				for(int i = 1;i<=allNumberList.size();i++){
					String numberString = allNumberList.get(i-1);
					Integer numberInteger = Integer.parseInt(numberString);
					if(numberInteger != i){
						dto.setsNumber(i);
						spaceService.addSpace(dto);
						break;
					}else if(i==allNumberList.size()){
						dto.setsNumber(numberInteger+1);
						spaceService.addSpace(dto);
						break;
					}
				}
			}else{
				dto.setsNumber(1);
				spaceService.addSpace(dto);
			}
		}
		return "redirect:../space/show.do";
	}
	
	@RequestMapping("deleteSpace")
	public String deleteSpace(Integer sId){
		spaceService.deleteSpace(sId);
		return "redirect:../space/show.do";
	}

}
