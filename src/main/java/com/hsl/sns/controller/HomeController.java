package com.hsl.sns.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value = "/leftBar")
	public String sideBar() {
		return "leftBar";
	}
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/join")
	public String join() {
		return "join";
	}
	@RequestMapping(value = "/index")
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/chat")
	public String chat() {
		return "chat";
	}
	

	@RequestMapping(value = "content_List")
	public String content_List() {
		return "content_List";
	}
	@RequestMapping(value = "content_write")
	public String content_write() {
		return "content_write";
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
