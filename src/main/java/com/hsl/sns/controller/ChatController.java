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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hsl.sns.dao.Chat;
import com.hsl.sns.dao.ChatDao;
import com.hsl.sns.dao.IDao;
import com.hsl.sns.dto.ChatDto;
import com.hsl.sns.dto.FollowDto;
import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PostDto;

@Controller
public class ChatController {

	@Autowired
	private ChatDao messageDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	private void sidebar(HttpSession session, Model model) {
		//==============사이드바 정보가져오기==============
		String sid = (String)session.getAttribute("sessionId");
		String snick = (String)session.getAttribute("nick");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto dto = dao.memberInfoDao(sid); //회원 정보
		model.addAttribute("minfo", dto);
		
		List<MemberDto> dtos = dao.memberListDao(sid); //검색 리스트
		model.addAttribute("memberList", dtos);
		
		
		Chat cdao = sqlSession.getMapper(Chat.class); //메시지 유무 뱃지 확인용
		int count = cdao.messageExist(snick);
		model.addAttribute("count", count);
		
		
		//==============사이드바 정보가져오기==============
		
		//====================== right bar ======================//
		
		List<FollowDto> followList = dao.likeContentListDao(sid);
		model.addAttribute("fList", followList); //찜목록
		
		List<PostDto> buyList = dao.buyListDao(sid); // 예약목록
		model.addAttribute("bList", buyList);
		
		List<PostDto> mypostList = dao.myPostListDao(sid);
		model.addAttribute("pList", mypostList); //판매목록
	}
	
 
	// 메세지 목록
	@RequestMapping(value = "/message")
	public String message_list(HttpServletRequest request, HttpSession session, Model model) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));
		sidebar(session,model);
		String nick = (String) session.getAttribute("nick");

		ChatDto to = new ChatDto();
		to.setNick(nick);

		// 메세지 리스트
		ArrayList<ChatDto> list = messageDao.messageList(to);

		request.setAttribute("list", list);
		
		String sid = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		List<MemberDto> dtos = dao.memberListDao(sid);
		model.addAttribute("memberList", dtos);

		return "chat/message";
	}

	// 메세지 목록
	@RequestMapping(value = "/message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest request, HttpSession session, Model model) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));

		String nick = (String) session.getAttribute("nick");

		ChatDto to = new ChatDto();
		to.setNick(nick);
		// 메세지 리스트
		ArrayList<ChatDto> list = messageDao.messageList(to);

		model.addAttribute("list", list);
		request.setAttribute("list", list);

		
		return "chat/chat_ajax_list";
	}

	@RequestMapping(value = "/message_content_list.do")
	public String message_content_list(Model model,HttpServletRequest request, HttpSession session) {

		int room = Integer.parseInt(request.getParameter("room"));

		ChatDto to = new ChatDto();
		to.setRoom(room);
		to.setNick((String) session.getAttribute("nick"));

		// 메세지 내용을 가져온다.
		ArrayList<ChatDto> clist = messageDao.roomContentList(to);

		request.setAttribute("clist", clist);

		return "chat/chat_content_list";
	}

	// 메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do")
	public int message_send_inlist(@RequestParam int room, @RequestParam String othernick,
			@RequestParam String content, HttpSession session) {

		
		ChatDto to = new ChatDto();
		to.setRoom(room);
		to.setSendnick((String) session.getAttribute("nick"));
		to.setRecvnick(othernick);
		to.setContent(content);

		int flag = messageDao.messageSendInlist(to);

		return flag;
	}
	
	// 검색 -> 프로필 -> 메시지 보내기 에서 보낸 메시지
	@RequestMapping(value = "/message_send")
	public String message_send(HttpServletRequest request, HttpSession session) {
		
		int room = Integer.parseInt(request.getParameter("room"));
		String othernick = request.getParameter("othernick");
		String content = request.getParameter("content");
		
		ChatDto to = new ChatDto();
		to.setRoom(room);
		to.setSendnick((String) session.getAttribute("nick"));
		to.setRecvnick(othernick);
		to.setContent(content);

		messageDao.messageSendInlist(to);

		return "redirect:index";
	}
	
	@RequestMapping(value = "/send")
	public String send(HttpServletRequest request, Model model,HttpSession session) {
		
		sidebar(session,model);
		String recvnick = request.getParameter("nick");
		model.addAttribute("rnick", recvnick);
		
		return "chat/send";
	}

}
