package com.hsl.sns.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value = "leftBar")
	public String sideBar() {
		return "leftBar";
	}
	@RequestMapping(value = "login")
	public String login() {
		return "login";
	}
	@RequestMapping(value = "join")
	public String join() {
		return "join";
	}
	
	@RequestMapping(value = "index")
	public String index() {
		return "index";
	}
	@RequestMapping(value = "joinOk")
	public String joinOk() {
		return "joinOk";
	}
	@RequestMapping(value = "memberModify")
	public String memberModify() {
		return "memberModify";
	}
}
