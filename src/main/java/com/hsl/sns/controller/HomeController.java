package com.hsl.sns.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.json.JSONObject;
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
		
		MemberDto dto = dao.memberInfoDao(sid); //회원 정보
		model.addAttribute("minfo", dto);
		
		List<MemberDto> dtos = dao.memberListDao(sid); //검색 리스트
		model.addAttribute("memberList", dtos);
		
		Chat cdao = sqlSession.getMapper(Chat.class); //메시지 유무 뱃지 확인용
		int count = cdao.messageExist(snick);
		model.addAttribute("count", count);
		
		model.addAttribute("memberList", dtos);
		model.addAttribute("minfo", dto);
		
		int buyrequestCount = dao.buyrequestCountDao(sid);
		model.addAttribute("buyrequestCount", buyrequestCount);
		
		//==============사이드바 정보가져오기==============
		
		//====================== right bar ======================//
		
		List<FollowDto> followList = dao.likeContentListDao(sid);
		model.addAttribute("fList", followList); //찜목록
		
		List<PostDto> buyList = dao.buyListDao(sid); // 예약목록
		model.addAttribute("bList", buyList);
		
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
	@RequestMapping(value = "/scheduler")
	public String test(Model model, HttpSession session, HttpServletRequest request) throws JSONException {
		
		sidebar(session,model);
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String sid = (String)session.getAttribute("sessionId");
		List<PostDto> dateList = dao.scheduler(sid);
		List<PostDto> dateList1 = dao.schedulerSell(sid);
		List jsonList = new ArrayList<JSONObject>();
		
		if(dateList != null && dateList1 != null) {
		
			for(int i=0;i<dateList.size(); i++) {
				PostDto dto = dateList.get(i);
				
				
		        JSONObject jsonObject = new JSONObject(dto);
		        jsonObject.put("color", "red");
		        jsonObject.put("id", dto.getNick()+"님과의 거래가 있습니다!\n"+"게시물 제목 : "+dto.getTitle()+"\n예약시간 : "+dto.getHopedate()+"\n확인을 누르면 해당 게시글로 이동합니다.");
		        jsonObject.put("start", dto.getHopedate());
		        jsonObject.put("title", "구매");
		        jsonObject.put("url", "content_view?postidx="+dto.getPostidx());
		        
		         
		        jsonList.add(jsonObject);
		      }
			for(int i=0;i<dateList1.size(); i++) {
				PostDto dto = dateList1.get(i);
				
				MemberDto mdto = dao.memberInfoDao(dto.getBuyuser());
				
		        JSONObject jsonObject1 = new JSONObject(dto);
		        jsonObject1.put("color", "yellow");
		        jsonObject1.put("id", mdto.getNick()+"님과의 거래가 있습니다!\n"+"게시물 제목 : "+dto.getTitle()+"\n예약시간 : "+dto.getHopedate()+"\n확인을 누르면 해당 게시글로 이동합니다.");
		        jsonObject1.put("start", dto.getHopedate());
		        jsonObject1.put("title", "판매");
		        jsonObject1.put("url", "content_view?postidx="+dto.getPostidx());
		        
		        jsonList.add(jsonObject1);
		      }
		      model.addAttribute("result", jsonList);
		}
		
		return "scheduler";
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
		//====================== 게시글 찜하기 수 끝 ======================//
		
		
		
		//====================== 날짜 차이 ======================//
		List<PostDto> dateList = dao.dateDao();
		model.addAttribute("dList", dateList);
		//====================== 날짜 차이 끝 ======================//
		
		
		return "index";
	}
	
	@RequestMapping(value = "follow")
	public String follow(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String followid = request.getParameter("followid");
		int followcontent = Integer.parseInt(request.getParameter("followcontent")); 
		
		int count = dao.followCheckDao(followid,followcontent);
		if(count != 0) {
			
			dao.followDeleteDao(followid, followcontent);
			return "redirect:/index";
		}else {
			dao.followDao(followcontent, followid);
		}
		return "redirect:/index";
	}
	
	//content_view 에서 눌렀을때
	@RequestMapping(value = "follow1")
	public String follow1(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String followid = request.getParameter("followid");
		int followcontent = Integer.parseInt(request.getParameter("followcontent")); 
		
		int count = dao.followCheckDao(followid,followcontent);
		if(count != 0) {
			dao.followDeleteDao(followid, followcontent);
			return String.format("redirect:/content_view?postidx=%s", followcontent);
		}else {
			dao.followDao(followcontent, followid);
		}
		
		return String.format("redirect:/content_view?postidx=%s", followcontent);
	}
	
	@RequestMapping(value = "search")
	public String search(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		sidebar(session,model);
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String tradeplace = request.getParameter("tradeplace");
		String type = request.getParameter("type");
		
		List<PostDto> postList = dao.postSearchDao(tradeplace, type);
		if(postList.size() == 0) {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('검색된 결과가 없습니다!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			model.addAttribute("postList", postList);
			List<PostingUrlDto> postUrlList = dao.postUrlListDao();	
			model.addAttribute("postUrlList", postUrlList);
			
			//====================== 게시글 찜하기 수 ======================//
			List<Integer> counts = new ArrayList<>(); 
			for(int i=0; i<postList.size(); i++) {
				PostDto dto = postList.get(i);
				int postidx = dto.getPostidx();
				int count = dao.followCountDao(postidx);
				counts.add(count);
			}
			
			model.addAttribute("countList", counts);
			//====================== 게시글 찜하기 수 끝 ======================//
			
			//====================== 날짜 차이 ======================//
			List<PostDto> dateList = dao.dateDao();
			model.addAttribute("dList", dateList);
			//====================== 날짜 차이 끝 ======================//
		}
		
		
		
		return "index";
	}

	@RequestMapping(value = "/help")
	public String help() {
		return "help";
	}
	
	@RequestMapping(value = "commentlike")
	public String commentlike(HttpServletRequest request, HttpSession session) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String sid = (String) session.getAttribute("sessionId");
		int postidx=Integer.parseInt(request.getParameter("postidx"));
		int commentidx = Integer.parseInt(request.getParameter("cidx")); 
		
		int checkCount = dao.CommentLikeCheckDao(sid, commentidx);
		
		if(checkCount != 0) {
		
			return String.format("redirect:/content_view?postidx=%s", postidx);	
		
		}else {
			
			dao.commentLikeDao(commentidx, sid);
			
		}
		
		return String.format("redirect:/content_view?postidx=%s", postidx);
	}
	
	
	
	
	
}