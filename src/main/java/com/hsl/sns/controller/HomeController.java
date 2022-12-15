package com.hsl.sns.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsl.sns.dao.IDao;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	
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
	@RequestMapping(value = "content_view")
	public String content_view() {
		return "content_view";
	}

	


	@RequestMapping(value = "joinOk")
	public String joinOk(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mphone = request.getParameter("mphone");
		String mname = request.getParameter("mname");
		String mnickname = request.getParameter("mnickname");
		String memail = request.getParameter("memail");
		
		dao.joinMemberDao(mid, mpw, mphone, mname, mnickname, memail);
		model.addAttribute("mname", mname);
		
		return "joinOk";
	}
	
	@RequestMapping(value = "memberModify")
	public String memberModify() {
		return "memberModify";
	}

}
