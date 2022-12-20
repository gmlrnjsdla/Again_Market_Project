package com.hsl.sns.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsl.sns.dao.Chat;
import com.hsl.sns.dao.IDao;
import com.hsl.sns.dto.MemberDto;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	private void sidebar(HttpSession session, Model model) {
		//==============사이드바 정보가져오기==============
		String sid = (String)session.getAttribute("sessionId");
		String snick = (String)session.getAttribute("nick");
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto dto = dao.memberInfoDao(sid);
		List<MemberDto> dtos = dao.memberListDao(sid);
		Chat cdao = sqlSession.getMapper(Chat.class);
		int count = cdao.messageExist(snick);
		model.addAttribute("count", count);
		model.addAttribute("memberList", dtos);
		model.addAttribute("minfo", dto);
		//==============사이드바 정보가져오기==============
	}
	
	
	@RequestMapping(value = "/")
	public String home() {
		return "login";
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
	public String memberModify(Model model, HttpSession session) {
		
		sidebar(session,model);
		String sid = (String) session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto memberDto = dao.memberInfoDao(sid);
		
		model.addAttribute("memberDto", memberDto);
		
		
		return "memberModify";
	}
	@RequestMapping(value = "/memberModifyOk")
	public String memberModifyOk(HttpServletRequest request,Model model, HttpSession session) {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String id =  request.getParameter("id");
		String name =  request.getParameter("name");
		String mail =  request.getParameter("mail");
		String nick =  request.getParameter("nick");
		String phone =  request.getParameter("phone");
		String greet =  request.getParameter("greet");
		
		dao.memberModifyDao(id, name, mail, nick, phone, greet);
		
		return "redirect:content_List";
	}

	@RequestMapping(value = "/memberDelete")
	public String memberDelete(HttpServletRequest request,Model model, HttpSession session) {
		sidebar(session,model);
		String sid = (String) session.getAttribute("sessionId");

		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.memberDeleteDao(sid);
		
		session.invalidate();
		
		return "redirect:login";
	}
	
	
	@RequestMapping(value = "/index")
	public String index(Model model, HttpSession session) {
		
		sidebar(session,model);
		
		
		return "index";
	}
	
	
	@RequestMapping(value = "/content_List")
	public String content_List(HttpServletRequest request, HttpSession session, Model model) {
		
		sidebar(session,model);
		String nick = (String) session.getAttribute("nick");
		model.addAttribute("nick", nick);
		
		return "content_List";
	}
	
	@RequestMapping(value = "/content_write")
	public String content_write(HttpSession session, Model model) {
		
		sidebar(session,model);		
		
		return "content_write";
	}
	
	
	@RequestMapping(value = "/content_view")
	public String content_view(HttpSession session, Model model) {
		
		sidebar(session,model);
		
		return "content_view";
	}
	
	
	
	//=============================== Content End ===============================//
	
}