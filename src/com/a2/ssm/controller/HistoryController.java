package com.a2.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.a2.ssm.service.HistoryService;


@Controller
@RequestMapping("/history")
public class HistoryController {

	@Autowired
	private HistoryService historyService;
	
}
