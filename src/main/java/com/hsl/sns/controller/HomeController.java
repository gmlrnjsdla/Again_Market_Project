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
	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public String loginOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberDto dto = dao.memberInfoDao(id);
		
		if(dto != null) {
			String dbpw = dto.getPwd();
			String nick = dto.getNick();
			if(pwd.equals(dbpw)) {
				HttpSession session = request.getSession();
				session.setAttribute("sessionId", id);
				session.setAttribute("nick", nick);
				model.addAttribute("name", dto.getName());
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
		
		
		return "redirect:index";
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
	public String index(Model model, HttpSession session) {
		
		String sid = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto dto = dao.memberInfoDao(sid);
		List<MemberDto> dtos = dao.memberListDao(sid);
		
		
		model.addAttribute("memberList", dtos);
		model.addAttribute("minfo", dto);
		
		return "index";
	}

	
	
	@RequestMapping(value = "/joinOk", method = RequestMethod.POST)
	public String joinOk(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String nick = request.getParameter("nick");
//		String profile = request.getParameter("profile");
		String greet = request.getParameter("greet");
		
		dao.joinMemberDao(id, pwd, name, birth, mail, phone, nick, "person.png", greet);
		
		model.addAttribute("name", name);
		
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
			String mname = dto.getName();
			List<MemberDto> dtos = dao.memberListDao(sid);
			
			model.addAttribute("memberList", dtos);
			model.addAttribute("mname", mname);
		}
		
		return "content_List";
	}
	
	@RequestMapping(value = "/content_write")
	public String content_write(HttpSession session, Model model) {
		
		String sid = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		List<MemberDto> dtos = dao.memberListDao(sid);
		model.addAttribute("memberList", dtos);
		
		return "content_write";
	}
	
	@RequestMapping(value = "/content_view")
	public String content_view(HttpSession session, Model model) {
		
		String sid = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		List<MemberDto> dtos = dao.memberListDao(sid);
		model.addAttribute("memberList", dtos);
		
		return "content_view";
	}
	
	
	//=============================== Content End ===============================//
	
}