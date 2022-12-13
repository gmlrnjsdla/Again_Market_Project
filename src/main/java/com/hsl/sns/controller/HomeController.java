package com.hsl.sns.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
	
	
	@RequestMapping(value = "/leftBar")
	public String sideBar() {
		return "leftBar";
	}
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public String loginOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		MemberDto dto = dao.memberInfoDao(mid);
		
		if(dto != null) {
			String dbpw = dto.getMpw();
			if(mpw.equals(dbpw)) {
				HttpSession session = request.getSession();
				session.setAttribute("sessionId", mid);
				model.addAttribute("mname", dto.getMname());
			}else {
				PrintWriter out;
				try {
					response.setContentType("text/html;charset=utf-8");
					out = response.getWriter();
					out.println("<script>alert('아이디 혹은 비밀번호가 일치하지 않습니다. 다시확인해주세요!');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}else {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('아이디 혹은 비밀번호가 일치하지 않습니다. 다시확인해주세요!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return "index";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		
		session.invalidate();
		
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
	public String chat(Model model, HttpSession session) {
		
		String sid = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		List<MemberDto> dtos = dao.memberListDao(sid);
		model.addAttribute("memberList", dtos);
		
		return "chat";
	}
	
	@RequestMapping(value = "/joinOk", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/memberModify")
	public String memberModify() {
		return "memberModify";
	}

	
	
	//=============================== Member End ===============================//
	
	@RequestMapping(value = "/content_List")
	public String content_List(HttpServletRequest request, HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String sid = (String)session.getAttribute("sessionId");
		
		if(sid != null) {
			MemberDto dto = dao.memberInfoDao(sid);
			String mname = dto.getMname();
			
			model.addAttribute("mname", mname);
		}
		
		return "content_List";
	}
	@RequestMapping(value = "/content_write")
	public String content_write() {
		return "content_write";
	}
	
	
	//=============================== Content End ===============================//
	
}
