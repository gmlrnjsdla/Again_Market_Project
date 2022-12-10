package com.hsl.sns.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value = "leftBar")
	public String sideBar() {
		return "leftBar";
	}
	
}
