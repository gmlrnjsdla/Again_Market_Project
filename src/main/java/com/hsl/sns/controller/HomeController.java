package com.hsl.sns.controller;

import java.util.ArrayList;
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
import com.hsl.sns.dto.FollowDto;
import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PostDto;
import com.hsl.sns.dto.PostingUrlDto;




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
		
		//====================== right bar ======================//
		
		List<FollowDto> followList = dao.likeContentListDao(sid);
		model.addAttribute("fList", followList); //찜목록
		
		List<PostDto> mypostList = dao.myPostListDao(sid);
		model.addAttribute("pList", mypostList); //판매목록
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
	
	@RequestMapping(value = "/index")
	public String index(Model model, HttpSession session, HttpServletRequest request) {
		
		sidebar(session,model);
		
		//====================== 게시글 리스트 ======================//
		String sid = (String)session.getAttribute("sessionId");
		IDao dao = sqlSession.getMapper(IDao.class);
		List<PostDto> postList = dao.postListDao();
		List<PostingUrlDto> postUrlList = dao.postUrlListDao();	
		model.addAttribute("postList", postList);
		model.addAttribute("postUrlList", postUrlList);
		model.addAttribute("sid", sid);
		//====================== 게시글 리스트 끝 ======================//
		
		//====================== 게시글 찜하기 수 ======================//
		List<Integer> counts = new ArrayList<>(); 
		for(int i=0; i<postList.size(); i++) {
			PostDto dto = postList.get(i);
			int postidx = dto.getPostidx();
			int count = dao.followCountDao(postidx);
			counts.add(count);
		}
		
		model.addAttribute("countList", counts);
		System.out.println(counts.get(0));
		//====================== 게시글 찜하기 수 끝 ======================//
		
		
		return "index";
	}
	
	@RequestMapping(value = "follow")
	public String follow(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String followid = request.getParameter("followid");
		int followcontent = Integer.parseInt(request.getParameter("followcontent")); 
		
		int count = dao.followCheckDao(followid,followcontent);
		if(count != 0) {
			return "redirect:/index";
		}else {
			dao.followDao(followcontent, followid);
		}
		return "redirect:/index";
	}
	
	@RequestMapping(value = "search")
	public String search(Model model, HttpSession session, HttpServletRequest request) {
		sidebar(session,model);
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String tradeplace = request.getParameter("tradeplace");
		String type = request.getParameter("type");
		
		List<PostDto> postList = dao.postSearchDao(tradeplace, type);
		model.addAttribute("postList", postList);
		
		return "index";
	}
	
	
	
}