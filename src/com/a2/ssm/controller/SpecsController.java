package com.a2.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.a2.ssm.model.Specs;
import com.a2.ssm.service.SpecsService;


@Controller
@RequestMapping("/specs")
public class SpecsController {

	@Autowired
	private SpecsService specsService;
	
}
