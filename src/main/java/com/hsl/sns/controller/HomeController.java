package com.hsl.sns.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hsl.sns.dao.IDao;
import com.hsl.sns.dto.MemberDto;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "/")
	public String home() {
		return "login";
	}
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
	
	@RequestMapping(value = "/memberModify")
	public String memberModify() {
		return "memberModify";
	}

	
	
	
	@RequestMapping(value = "/content_List")
	public String content_List(HttpServletRequest request, HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String sid = (String)session.getAttribute("sessionId");
		
		if(sid != null) {
			MemberDto dto = dao.memberInfoDao(sid);
			String mname = dto.getName();
			List<MemberDto> dtos = dao.memberListDao(sid);
			
			model.addAttribute("memberList", dtos);
			model.addAttribute("mname", mname);
		}
		
		return "content_List";
	}
	
	@RequestMapping(value = "/content_write")
	public String content_write(HttpSession session, Model model) {
		
		//사이드바 회원정보
		String sid = (String)session.getAttribute("sessionId");
		IDao dao = sqlSession.getMapper(IDao.class);
		List<MemberDto> dtos = dao.memberListDao(sid);
		model.addAttribute("memberList", dtos);
		//사이드바 회원정보		
		
		return "content_write";
	}
	
	
	@RequestMapping(value = "/content_view")
	public String content_view(HttpSession session, Model model) {
		
		//사이드바 회원정보
		String sid = (String)session.getAttribute("sessionId");
		IDao dao = sqlSession.getMapper(IDao.class);
		List<MemberDto> dtos = dao.memberListDao(sid);
		model.addAttribute("memberList", dtos);
		//사이드바 회원정보
		
		return "content_view";
	}
	
	
	//=============================== Content End ===============================//
	
}