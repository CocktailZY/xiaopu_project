package com.a2.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.a2.ssm.service.BrandService;



@Controller
@RequestMapping("/brand")
public class BrandController {

	@Autowired
	private BrandService brandService;
	
}
