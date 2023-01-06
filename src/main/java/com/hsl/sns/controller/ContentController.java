package com.hsl.sns.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;


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
	
	
	//파일업로드 상대경로
	@Autowired
	ResourceLoader resourceLoader;
	
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
		
		List<PostDto> buyList = dao.buyListDao(sid); // 예약목록
		model.addAttribute("bList", buyList);
		
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
		
		//=============================== 사이드바 구매요청 뱃지 ===============================
		String sid = (String)session.getAttribute("sessionId");
		int buyrequestCount = dao.buyrequestCountDao(sid);
		model.addAttribute("buyrequestCount", buyrequestCount);
				
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
		
		//====================== 날짜 차이 ======================//
		List<PostDto> dateList = dao.dateDao();
		model.addAttribute("dList", dateList);
		//====================== 날짜 차이 끝 ======================//
		
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
		
		//=============================== 사이드바 구매요청 뱃지 ===============================
		String sid = (String)session.getAttribute("sessionId");
		int buyrequestCount = dao.buyrequestCountDao(sid);
		model.addAttribute("buyrequestCount", buyrequestCount);
		
	
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
		
		
		//====================== 날짜 차이 ======================//
		List<PostDto> dateList = dao.dateDao();
		model.addAttribute("dList", dateList);
		//====================== 날짜 차이 끝 ======================//
		
		
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
		//=============================== 사이드바 구매요청 뱃지 ===============================
		String sid = (String)session.getAttribute("sessionId");
		int buyrequestCount = dao.buyrequestCountDao(sid);
		model.addAttribute("buyrequestCount", buyrequestCount);
		
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

		//====================== 날짜 차이 ======================//
		List<PostDto> dateList = dao.dateDao();
		model.addAttribute("dList", dateList);
		//====================== 날짜 차이 끝 ======================//
		
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
		
		//=============================== 사이드바 구매요청 뱃지 ===============================
		String sid = (String)session.getAttribute("sessionId");
		int buyrequestCount = dao.buyrequestCountDao(sid);
		model.addAttribute("buyrequestCount", buyrequestCount);		
		
	
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

		//====================== 날짜 차이 ======================//
		List<PostDto> dateList = dao.dateDao();
		model.addAttribute("dList", dateList);
		//====================== 날짜 차이 끝 ======================//
		
		
		return "transaction_List";
	}
	
	
	@RequestMapping(value = "/content_write")
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
				
				//업로드 파일 상대경로 지정
				Path path = Paths.get("");
//		        String fileUrl = path.toAbsolutePath().toString();
//		        fileUrl = fileUrl+"/src/main/resources/static/uploadfiles/";
				String fileUrl = "/var/lib/tomcat9/webapps/AgainMarket/WEB-INF/classes/static/uploadfiles/";
				
				
			
				do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "."+ fileExtension;
				
				destinationFile = new File(fileUrl+destinationFileName);
				} while(destinationFile.exists());
				
				destinationFile.getParentFile().mkdir();
				files[i].transferTo(destinationFile); // 
				
				dao.contentWritePicDao(postidx, fileOriName, destinationFileName, fileExtension, fileUrl);
				
			}
		}
			
		MemberDto mdto = dao.memberInfoDao(sid);
		int currentPoint = mdto.getPoint();
		
		int point = 200;
		String explain = "게시글 작성 +200p";
		
		dao.pointPlus(point, sid);		//point 증가
		dao.pointPlusDao(sid, point,currentPoint,explain);	//pointtbl에 증가된 값 저장
		
		
		return "redirect:index";
	}
	
	
	@RequestMapping(value = "/content_view")
	public String content_view(HttpSession session, Model model, HttpServletRequest request) {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		int postidx = Integer.parseInt(request.getParameter("postidx")); 
		String sid = (String)session.getAttribute("sessionId");
		model.addAttribute("sid", sid);
		
		//====================== 날짜 차이 ======================//
		List<PostDto> dateList = dao.dateDao();
		model.addAttribute("dList", dateList);
		//====================== 날짜 차이 끝 ======================//
		
		//프로필사진
		MemberDto minfo = dao.memberInfoDao(sid);
		model.addAttribute("minfo", minfo);
		
		//게시글 정보
		PostDto dto = dao.postDao(postidx);
		model.addAttribute("post", dto);
		String id = dto.getId();
		model.addAttribute("id", id); 	// sessionId와 비교를 위해
		
		//이미지 가져오기
		List<PostingUrlDto> postUrlList = dao.postUrlListDao();	
		model.addAttribute("postUrlList", postUrlList);
		
		//찜하기 수
		int count = dao.followCountDao(postidx);
		model.addAttribute("likeCount", count);

		//댓글
		List<CommentDto> commentDtos = dao.commentListDao(postidx);
		model.addAttribute("commentList", commentDtos);
		
		//댓글 개수
		List<CommentDto> cdtos = dao.commentListDao(postidx);
		List<Integer> counts = new ArrayList<>();
		for(int i=0; i<cdtos.size(); i++) {
			CommentDto cdto = cdtos.get(i);
			int commentidx = cdto.getCommentidx();
			int likeCount = dao.CommentLikeCountDao(commentidx);
			
			counts.add(likeCount);
		}
		
		model.addAttribute("commentlikeCount", counts);
		
		
		
		return "content_view";
	}
	

	
	@RequestMapping(value = "/buy_tradeView")
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
	
	@RequestMapping(value = "/buy_cancel")
	public String buy_cancel(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		int postidx = Integer.parseInt(request.getParameter("postidx"));

		dao.buyCancleDao(postidx);
		
		
		return "buy_cancel";
	}
	
	
	@RequestMapping(value = "/sell_tradeView")
	public String sell_tradeView(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		
		int postidx = Integer.parseInt(request.getParameter("postidx"));
		String sid = (String) session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto sdto=dao.selltradeDao(postidx);
		model.addAttribute("sinfo", sdto);
		
		MemberDto dto = dao.postInfomationDao(postidx);
		model.addAttribute("pinfo", dto);
		
		MemberDto mdto = dao.memberInfoDao(sid);
		System.out.println(mdto.getNick());
		model.addAttribute("minfo", mdto);
		
		return "sell_tradeView";
	}
	
	@RequestMapping(value = "/buy_completed")
	public String buy_completed(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		
		
		int postidx = Integer.parseInt(request.getParameter("postidx"));
		String buyuser = request.getParameter("buyuser");
		String selectedDate = request.getParameter("selectedDate");
		String nick = request.getParameter("nick");
		
		
		model.addAttribute("date", selectedDate);
		dao.buycompleteDao(postidx, buyuser,selectedDate);
		
		model.addAttribute("nick", nick);
		
		
		
		

		return "buy_completed";
	}
	
	@RequestMapping(value = "/sell_completed")
	public String sell_completed(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		String sid = (String)session.getAttribute("sessionId");
		String buyuser = request.getParameter("buyuser");
		
		int postidx = Integer.parseInt(request.getParameter("postidx"));
		String selectedDate = request.getParameter("selecteddate");
		String nick = request.getParameter("nick");
		
		dao.sellcompleteDao(postidx);
		model.addAttribute("date", selectedDate);
		model.addAttribute("nick", nick);
		
		//구매회원
		MemberDto buyuserMdto = dao.memberInfoDao(buyuser);
		int bcurrentPoint = buyuserMdto.getPoint();
		
		//판매회원
		MemberDto mdto = dao.memberInfoDao(sid);
		int currentPoint = mdto.getPoint();
		
		//예약 완료시 구매자, 판매자 모두에게 포인트 지급
		int point = 500;
		String explain = "예약완료 축하금 +500p";
		//구매회원 포인트 증가
		dao.pointPlus(point, buyuser);
		dao.pointPlusDao(buyuser, point, bcurrentPoint, explain);
		
		//판매회원 포인트 증가
		dao.pointPlus(point, sid);
		dao.pointPlusDao(sid, point, currentPoint, explain);
		
		return "sell_completed";
	}
	
	@RequestMapping(value = "/commentOk")
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
				
				
				MemberDto mdto = dao.memberInfoDao(sid);
				int currentPoint = mdto.getPoint();
				
				int point = 5;
				String explain = "댓글 작성 +5p";
				//댓글 쓰면 포인트 증가
				dao.pointPlus(point, sid);
				dao.pointPlusDao(sid, point, currentPoint, explain);
			}
		
		return String.format("redirect:/content_view?postidx=%s", postidx);
	}
	
	@RequestMapping(value = "/content_modify")
	public String content_modify(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		int postidx = Integer.parseInt(request.getParameter("postidx")); 
		
		//해당 게시글 내용 가져오기
		PostDto dto = dao.postDao(postidx);  
		model.addAttribute("post", dto);
		
		//해당 게시글 사진 가져오기
		List<PostingUrlDto> imgList = dao.getPosturlModifyDao(postidx);
		model.addAttribute("iList", imgList);
		
		
		
		return "content_modify";
	}
	
	
	
@RequestMapping(value = "/content_modifyOk")
public String content_modifyOk(HttpServletRequest request, HttpSession session, Model model, HttpServletResponse response) {
	sidebar(session,model);
	IDao dao = sqlSession.getMapper(IDao.class);
	 
	int postidx = Integer.parseInt(request.getParameter("postidx")); 
	String title = request.getParameter("title");
	String type = request.getParameter("type");
	String price = request.getParameter("price");
	String tradeplace = request.getParameter("tradeplace");
	String content = request.getParameter("content");
	
	
	dao.modifyPostDao(title, type, price, tradeplace, content, postidx);
	
	return String.format("redirect:/content_view?postidx=%s", postidx);
}
	
@RequestMapping(value = "/delete_content")
public String delete_content(HttpServletRequest request,Model model, HttpSession session) {
	
	sidebar(session,model);
	IDao dao = sqlSession.getMapper(IDao.class);
	int postidx = Integer.parseInt(request.getParameter("postidx")); 
	String sid = (String) session.getAttribute("sessionId");
	
	MemberDto dto = dao.postInfomationDao(postidx);
	if(dto.getPostDto().getSellflag() == 0) {
		
		MemberDto mdto = dao.memberInfoDao(sid);
		int currentPoint = mdto.getPoint();
		
		int point=200;
		String explain="예약확정 전 글삭제 -200p";
		dao.pointMinus(point, sid);
		dao.pointMinusDao(sid, point, currentPoint, explain);
	}
	
	dao.deletePostDao(postidx);
	return String.format("redirect:/sell_List?id=%s", sid);
}

}
