package com.hsl.sns.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.hsl.sns.dao.Chat;
import com.hsl.sns.dao.IDao;
import com.hsl.sns.dto.FollowDto;
import com.hsl.sns.dto.CommentDto;
import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PostDto;
import com.hsl.sns.dto.PostingUrlDto;



@Controller
public class ContentController {

	private static final String String = null;
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
	
	
	@RequestMapping(value = "/sell_List")
	public String sell_List(HttpServletRequest request, HttpSession session, Model model) {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		String id = request.getParameter("id");
		MemberDto dto = dao.memberInfoDao(id);
		
		model.addAttribute("minfo", dto);
		model.addAttribute("id", dto.getId()); 
		
	
		//찜 수
		int follower = dao.followerCountDao(id);
		model.addAttribute("follower", follower);
		
		//판매글 수
		int post = dao.postCountDao(id);
		model.addAttribute("post", post);
		
		//예약글 수
		int buy = dao.buyCountDao(id);
		model.addAttribute("buy", buy);
		
		//거래완료글 수
		int trc = dao.transactionCountDao(id);
		model.addAttribute("trc", trc);
		
		
		List<PostDto> postList = dao.myPostListDao(id); // 해당 프로필의 판매중인 게시글 정보 가져오기
		model.addAttribute("pList", postList); 
		
		List<PostingUrlDto> postUrlList= dao.myPostUrlListDao(); // 해당 프로필의 게시물 사진 하나만 가져오기
		model.addAttribute("uList", postUrlList);
		
		
		return "sell_List";
	}
	
	
	@RequestMapping(value = "/buy_List")
	public String buy_List(HttpServletRequest request, HttpSession session, Model model) {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		String id = request.getParameter("id");
		MemberDto dto = dao.memberInfoDao(id);
		
		model.addAttribute("minfo", dto);
		model.addAttribute("id", dto.getId()); 
		
	
		//찜 수
		int follower = dao.followerCountDao(id);
		model.addAttribute("follower", follower);
		
		//판매글 수
		int post = dao.postCountDao(id);
		model.addAttribute("post", post);
		
		//예약글 수
		int buy = dao.buyCountDao(id);
		model.addAttribute("buy", buy);
		
		//거래완료글 수
		int trc = dao.transactionCountDao(id);
		model.addAttribute("trc", trc);
		

		
		List<PostDto> buyList = dao.buyListDao(id); // 해당 프로필의 예약중인 게시글 정보 가져오기
		model.addAttribute("bList", buyList); 
		
		List<PostingUrlDto> postUrlList= dao.myPostUrlListDao(); // 해당 프로필의 게시물 사진 하나만 가져오기
		model.addAttribute("uList", postUrlList);
		
		return "buy_List";
	}
	
	
	@RequestMapping(value = "/choice_List")
	public String choice_List(HttpServletRequest request, HttpSession session, Model model) {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		String id = request.getParameter("id");
		MemberDto dto = dao.memberInfoDao(id);
		
		model.addAttribute("minfo", dto);
		model.addAttribute("id", dto.getId()); 
		
		
		//=============================== 찜 ===============================
		int follower = dao.followerCountDao(id);
		model.addAttribute("follower", follower); //찜한 개수
		
		List<FollowDto> followList = dao.likeContentListDao(id); //찜한 게시물 목록
		model.addAttribute("fList", followList);
		
		//=============================== 판매중 ===============================
		int post = dao.postCountDao(id);
		model.addAttribute("post", post); //판매중인 개수
		
		
				
		//예약글 수
		int buy = dao.buyCountDao(id);
		model.addAttribute("buy", buy);
		
		//거래완료글 수
		int trc = dao.transactionCountDao(id);
		model.addAttribute("trc", trc);
		
		
		
		List<PostingUrlDto> postUrlList= dao.myPostUrlListDao(); // 해당 프로필의 게시물 사진 하나만 가져오기
		model.addAttribute("uList", postUrlList);
		
		
		return "choice_List";
	}
	
	
	@RequestMapping(value = "/transaction_List")
	public String transaction_List(HttpServletRequest request, HttpSession session, Model model) {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		String id = request.getParameter("id");
		MemberDto dto = dao.memberInfoDao(id);
		
		model.addAttribute("minfo", dto);
		model.addAttribute("id", dto.getId()); 
		
	
		//찜 수
		int follower = dao.followerCountDao(id);
		model.addAttribute("follower", follower);
		
		//판매글 수
		int post = dao.postCountDao(id);
		model.addAttribute("post", post);
		
		//예약글 수
		int buy = dao.buyCountDao(id);
		model.addAttribute("buy", buy);
		
		//거래완료글 수
		int trc = dao.transactionCountDao(id);
		model.addAttribute("trc", trc);
		

		
		List<PostDto> transactionList = dao.transactionListDao(id); // 해당 프로필의 예약중인 게시글 정보 가져오기
		model.addAttribute("tList", transactionList); 
		
		List<PostingUrlDto> postUrlList= dao.myPostUrlListDao(); // 해당 프로필의 게시물 사진 하나만 가져오기
		model.addAttribute("uList", postUrlList);;
		
		return "transaction_List";
	}
	
	
	@RequestMapping(value = "content_write")
	public String content_write(HttpSession session, Model model) {
		
		sidebar(session,model);	
		
		return "content_write";
	}
	
	
	
	
	
	
	
	@PostMapping(value = "/writeOk")
	public String writeOk(HttpSession session, Model model, HttpServletRequest request,
			 @RequestPart MultipartFile[] files) throws IllegalStateException, IOException {
		
		sidebar(session,model);
		
		String sid = (String)session.getAttribute("sessionId");
		IDao dao = sqlSession.getMapper(IDao.class);
		// write
		
		//제품등록
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		int price = Integer.parseInt(request.getParameter("price"));
		String tradeplace = request.getParameter("tradeplace");
		String content = request.getParameter("content");
		dao.contentWriteContDao(title, type, price, tradeplace, content, sid);
	
		
		//다중파일업로드
		List<PostDto> postList = dao.postInfoDao(sid);
		if(postList.size()!=0) {
		PostDto dto = postList.get(0);
		int postidx = dto.getPostidx();
		
		for (int i = 0; i < files.length; i++) {
			//그림파일첨부
			String fileOriName = files[i].getOriginalFilename(); 
			String fileExtension =FilenameUtils.getExtension(fileOriName).toLowerCase();
																			 
			File destinationFile; 
			String destinationFileName; 
			String fileUrl = "C:/Users/ici/git/SNS_Project/src/main/resources/static/uploadfiles/";
//			String fileUrl = "C:/Users/user.JY-20200602UADW/git/SNS_Project/src/main/resources/static/uploadfiles/";
			
			do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "."+ fileExtension;
			
			destinationFile = new File(fileUrl+destinationFileName);
			} while(destinationFile.exists());
			
			destinationFile.getParentFile().mkdir();
			files[i].transferTo(destinationFile); // 
			
			dao.contentWritePicDao(postidx, fileOriName, destinationFileName, fileExtension, fileUrl);
			
		}
		}
			
		return "index";
	}
	
	
	@RequestMapping(value = "/content_view")
	public String content_view(HttpSession session, Model model, HttpServletRequest request) {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		int postidx = Integer.parseInt(request.getParameter("postidx")); 
		
		//게시글 정보
		PostDto dto = dao.postDao(postidx);
		model.addAttribute("post", dto);
		String id = dto.getId();
		model.addAttribute("id", id); 	// sessionId와 비교를 위해
		
		//이미지 가져오기
		List<PostingUrlDto> postUrlList = dao.postUrlListDao();	
		model.addAttribute("postUrlList", postUrlList);
		
		int count = dao.followCountDao(postidx);
		model.addAttribute("likeCount", count);
		
		List<CommentDto> commentDtos = dao.commentListDao(postidx);
		model.addAttribute("commentList", commentDtos);
		
		return "content_view";
	}
	
	@RequestMapping(value = "buy_tradeView")
	public String buy_tradeView(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		
		int postidx = Integer.parseInt(request.getParameter("postidx"));
		String sid = (String) session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto dto = dao.postInfomationDao(postidx);
		model.addAttribute("pinfo", dto);
		MemberDto mdto = dao.memberInfoDao(sid);
		
		model.addAttribute("minfo", mdto);
		
		
		return "buy_tradeView";
	}
	
	
	@RequestMapping(value = "sell_tradeView")
	public String sell_tradeView(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		
		int postidx = Integer.parseInt(request.getParameter("postidx"));
		String sid = (String) session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto sdto=dao.selltradeDao(postidx);
		model.addAttribute("sinfo", sdto);
		MemberDto dto = dao.postInfomationDao(postidx);
		model.addAttribute("pinfo", dto);
		System.out.println(sid);
		MemberDto mdto = dao.memberInfoDao(sid);
		System.out.println(mdto.getNick());
		model.addAttribute("minfo", mdto);
		
		return "sell_tradeView";
	}
	
	@RequestMapping(value = "buy_completed")
	public String buy_completed(HttpServletRequest request, HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		
		int postidx = Integer.parseInt(request.getParameter("postidx"));
		String buyuser = request.getParameter("buyuser");
		
		
		dao.buycompleteDao(postidx, buyuser);
		

		return "buy_completed";
	}
	
	@RequestMapping(value = "sell_completed")
	public String sell_completed(HttpServletRequest request, HttpSession session, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int postidx = Integer.parseInt(request.getParameter("postidx"));
		
		dao.sellcompleteDao(postidx);
		
		
		return "sell_completed";
	}
	
	@RequestMapping(value = "commentOk")
	public String commentOk(HttpServletRequest request,HttpSession session,Model model, HttpServletResponse response) {
		sidebar(session,model);
		
		int postidx = Integer.parseInt(request.getParameter("postidx"));
		String content = request.getParameter("content");
		String sid = (String) session.getAttribute("sessionId");
		
		if(sid == null) {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('로그인을 하셔야 댓글쓰기가 가능합니다!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			} else {
				
				IDao dao = sqlSession.getMapper(IDao.class);
				
				dao.commentDao(sid, postidx, content);
				
				PostDto postDto = dao.commentViewDao(postidx);
				
				List<CommentDto> commentDtos = dao.commentListDao(postidx);
				
				model.addAttribute("post", postDto);
				model.addAttribute("commentList", commentDtos);
				
			
			}
		
		return "redirect:content_view";
	}
	
	
}
