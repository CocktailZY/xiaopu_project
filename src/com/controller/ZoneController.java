package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.model.Space;
import com.model.Zone;
import com.service.SpaceService;
import com.service.ZoneService;




@Controller
@RequestMapping("/zone")
public class ZoneController {

	//注入Service
	@Autowired
	private ZoneService zoneService;
	@Autowired
	private SpaceService spaceService;

	@RequestMapping("addZone")
	public String addZone(Zone dto){
		zoneService.addZone(dto);
		return "redirect:../space/show.do";
	}
	
	@RequestMapping("deleteZone")
	public String deleteZone(Integer zId){
		//查询该区块名称
		String zName = zoneService.selectZoneById(zId);
		//查询是否有属于该区块的车位
		List<Space> zoneSpacesList = spaceService.selectSpaceByZone(zName);
		System.out.println(zoneSpacesList);
		if(zoneSpacesList.size()!=0){
			//删除该区块的车位
			spaceService.deleteSpaceByZone(zName);
			zoneService.deleteZone(zId);
		}else{
			//删除区块
			zoneService.deleteZone(zId);
		}
		
		return "redirect:../space/show.do";
	}
	
}
