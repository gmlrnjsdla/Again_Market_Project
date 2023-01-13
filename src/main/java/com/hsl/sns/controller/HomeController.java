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
import javax.websocket.Session;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.hsl.sns.dao.Chat;
import com.hsl.sns.dao.IDao;

import com.hsl.sns.dto.Criteria;
import com.hsl.sns.dto.FollowDto;
import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PageDto;
import com.hsl.sns.dto.PointDto;
import com.hsl.sns.dto.PostDto;
import com.hsl.sns.dto.PostingUrlDto;
import com.hsl.sns.dto.ProductDto;
import com.hsl.sns.dto.ShopPostDto;




@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	private void loginCheck(HttpSession session, HttpServletResponse response) {
		String sid = (String)session.getAttribute("sessionId");
		if(sid == null) {
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
		}
	}
	
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
		        jsonObject1.put("color", "#32a852");
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
	
	@RequestMapping(value = "/follow")
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
	@RequestMapping(value = "/follow1")
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
	
	@RequestMapping(value = "/search")
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
	public String help(HttpSession session, Model model) {
		sidebar(session,model);
		return "help";
	}
	@RequestMapping(value = "/test")
	public String test() {
		return "test";
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
	
	
	
	@RequestMapping(value = "/pointshop")
	public String pointshop(HttpServletRequest request, HttpSession session, Model model) {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		String id = request.getParameter("id");
		MemberDto dto = dao.memberInfoDao(id);
		String sid = (String) session.getAttribute("sessionId");
		model.addAttribute("sid",sid);
		model.addAttribute("minfo", dto);
		model.addAttribute("id", dto.getId()); 

		List<PostDto> postList = dao.myPostListDao(id); // 해당 프로필의 판매중인 게시글 정보 가져오기
		model.addAttribute("pList", postList); 
		
		List<ShopPostDto> shopList = dao.shopListDao();
		model.addAttribute("sList",shopList);
			
		return "pointshop";
	}
	
	@RequestMapping(value = "pointshop_tradeView")
	public String pointshop_tradeView(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		
		String sid = (String) session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto mdto = dao.memberInfoDao(sid);
		
		model.addAttribute("minfo", mdto);
		int shopidx=Integer.parseInt(request.getParameter("shopidx"));
		ShopPostDto sDto = dao.shopTrade(shopidx);
		model.addAttribute("sDto", sDto);
		
		return "pointshop_tradeView";
	}
	
	
	
	
	
	@RequestMapping(value = "pointshop_completed")
	public String pointshop_completed(HttpServletResponse response,HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String sid = (String)session.getAttribute("sessionId");
		String address = request.getParameter("address");
		model.addAttribute("address", address);
		
		MemberDto mdto = dao.memberInfoDao(sid);
		int currentPoint = mdto.getPoint();
		
		int point = Integer.parseInt(request.getParameter("point")); 
		if(point > currentPoint) {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('잔액이 부족합니다!!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			String explain = "상품 구매 "+point+"p";
			dao.pointMinus(point, sid);
			dao.pointMinusDao(sid, point, currentPoint, explain);
			
			String title = request.getParameter("title");
			
			String id= mdto.getId();
			String phone = mdto.getPhone();
			
			dao.pointProductDao(title, id, address, phone);
		}
		

		return "pointshop_completed";
	}
	
	
	
	
	
	@RequestMapping(value = "pointList")
	public String pointList(HttpServletRequest request, HttpSession session, Model model, Criteria cri) {
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		String sid = (String) session.getAttribute("sessionId");
		MemberDto mdto = dao.memberInfoDao(sid);
		model.addAttribute("minfo", mdto);
		
		
		
		
		int totalRecord = dao.pointListAllCount(sid);
		int pageNumInt = 1;
		if(request.getParameter("pageNum") == null) {
			pageNumInt = 1;
		}else {
			pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
		}
		cri.setPageNum(pageNumInt);
		
		cri.setStartNum(cri.getPageNum()-1 * cri.getAmount());  // 해당 페이지의 시작번호를 설정.
		PageDto dto = new PageDto(cri,totalRecord);
		int amount = cri.getAmount();
		int pageNum = cri.getPageNum();
		model.addAttribute("pageMaker", dto);
		model.addAttribute("pageNum", pageNumInt);
		
		List<PointDto> pointList = dao.pointListDao(sid,amount,pageNum);
		model.addAttribute("pointList", pointList);
		
		int boardCount = pointList.size();
		model.addAttribute("boardCount", boardCount);
		
		
		
		
		
		

		return "pointList";
	}
	
	@RequestMapping(value = "pointshop_write")
	public String pointshop_write(HttpSession session, Model model) {

		return "pointshop_write";
	}
	
	
	@PostMapping(value = "/pointshop_writeOk")
	public String pointshop_writeOk(Model model, HttpServletRequest request, HttpSession session,
		@RequestPart MultipartFile files) throws IllegalStateException, IOException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		// write
		String sid = (String) session.getAttribute("sessionId");
		MemberDto mdto = dao.memberInfoDao(sid);
		model.addAttribute("minfo", mdto);
		model.addAttribute("sid",sid);
		
		
		//제품등록
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int spoint = Integer.parseInt(request.getParameter("spoint"));
		
		 
		
		//파일첨부
		files.getOriginalFilename(); //첨부된 파일의 원래이름
		String fileExtension = FilenameUtils.getExtension(files.getOriginalFilename()).toLowerCase();//첨부된 파일의 확장자뽑아서 저장
																		//확장자 추출 후 소문자로 강제 변경.t oLowerCase()
		File destinationFile; //java.io 패키지 클래스 임포트
		String destinationFileName; //실제 서버에 저장된 파일의 변경된 이름이 저장될 변수 선언
		
		
		//업로드 파일 상대경로 지정
		Path path = Paths.get("");
//        String fileUrl = path.toAbsolutePath().toString();
//        fileUrl = fileUrl+"/src/main/resources/static/uploadfiles/";
        String fileUrl = "/var/lib/tomcat9/webapps/AgainMarket/WEB-INF/classes/static/uploadfiles/";
		
			
//		String fileUrl = "C:/Users/ici/git/SNS_Project/src/main/resources/static/uploadfiles/";
		
		
		do {
		destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "."+ fileExtension;
		//파일변수명(렌덤 숫자와영문대소문자 32개)뽑기 - 랜덤32자+ . + 확장자
		// 알파벳대소문자와 숫자를 포함한 랜덤 32자 문자열 생성 후 . 을 구분자로 원본 파일의 확장자를 연결->실제 서버에 저장할 파일의 이름
	
		destinationFile = new File(fileUrl+destinationFileName);
		} while(destinationFile.exists());
		//혹시 같은 이름의 파일이름이 존재하는지 확인
		
		destinationFile.getParentFile().mkdir();
		files.transferTo(destinationFile); // 업로드된 파일이 지정한 폴더로 이동완료!!
		
		
		dao.shopWriteDao(title, content, spoint, destinationFileName, fileUrl, fileExtension);

		return String.format("redirect:/pointshop?id=%s",sid);
	}
	
	@RequestMapping(value = "pointshop_modify")
	public String pointshop_modify( HttpServletRequest request,HttpSession session, Model model) {
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int shopidx=Integer.parseInt(request.getParameter("shopidx"));
		ShopPostDto sDto = dao.shopTrade(shopidx);
		model.addAttribute("sDto", sDto);
	
		return "pointshop_modify";
	}
	
	@RequestMapping(value = "pointshop_modifyOk")
	public String pointshop_modifyOk( HttpServletRequest request,HttpSession session, Model model) {
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		String sid = (String) session.getAttribute("sessionId");
		model.addAttribute("sid",sid);
		
		
		int shopidx=Integer.parseInt(request.getParameter("shopidx"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int spoint = Integer.parseInt(request.getParameter("spoint"));
		
		dao.shopModifyDao( shopidx, title, content, spoint);
		
		return String.format("redirect:/pointshop?id=%s",sid);
	}	
	@RequestMapping(value = "pointshop_delete")
	public String pointshop_delete( HttpServletRequest request,HttpSession session, Model model) {
	
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String sid = (String) session.getAttribute("sessionId");
	
		int shopidx=Integer.parseInt(request.getParameter("shopidx"));
		
		dao.shopDeleteDao(shopidx);
		

		return String.format("redirect:/pointshop?id=%s",sid);
	}	
	

	@RequestMapping(value = "/admin_pointshop")
	public String admin_pointshop(HttpServletRequest request, HttpSession session, Model model,Criteria cri) {
		sidebar(session,model);
		String sid = (String)session.getAttribute("sessionId");
		IDao dao = sqlSession.getMapper(IDao.class);
		
			if(sid.equals("admin")) {
				int totalRecord = dao.productCountDao();
				int pageNumInt = 1;
				if(request.getParameter("pageNum") == null) {
					pageNumInt = 1;
				}else {
					pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
				}
				cri.setPageNum(pageNumInt);
				
				cri.setStartNum(cri.getPageNum()-1 * cri.getAmount());  // 해당 페이지의 시작번호를 설정.
				PageDto dto = new PageDto(cri,totalRecord);
				int amount = cri.getAmount();
				int pageNum = cri.getPageNum();
				model.addAttribute("pageMaker", dto);
				model.addAttribute("pageNum", pageNumInt);
				
				List<ProductDto> productList = dao.productListDao(amount, pageNum);
				model.addAttribute("productList", productList);
				
		}else {
			return String.format("redirect:/index?id=%s",sid);
		}
		
		return "admin_pointshop";
	}
	
}