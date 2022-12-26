package com.hsl.sns.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.hsl.sns.dao.Chat;
import com.hsl.sns.dao.IDao;
import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PostDto;
import com.hsl.sns.dto.PostingUrlDto;

@Controller
public class ContentController {

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
	
	
	@RequestMapping(value = "/content_List")
	public String content_List(HttpServletRequest request, HttpSession session, Model model) {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		String id = request.getParameter("id");
		MemberDto dto = dao.memberInfoDao(id);
		
		model.addAttribute("minfo", dto);
		model.addAttribute("id", dto.getId()); 
		
		//팔로우 수
		int follow = dao.followCountDao(id);
		model.addAttribute("follow", follow);
		
		//팔로워 수
		int follower = dao.followerCountDao(id);
		model.addAttribute("follower", follower);
		
		//게시글 수
		int post = dao.postCountDao(id);
		model.addAttribute("post", post);
		
		return "content_List";
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
		System.out.println(files.length);
		
		for (int i = 0; i < files.length; i++) {
			//그림파일첨부
			String fileOriName = files[i].getOriginalFilename(); 
			String fileExtension =FilenameUtils.getExtension(fileOriName).toLowerCase();
																			 
			File destinationFile; 
			String destinationFileName; 
			String fileUrl = "C:/Users/ici/git/SNS_Project/src/main/resources/static/uploadfiles/";
			
			do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "."+ fileExtension;
			
			destinationFile = new File(fileUrl+destinationFileName);
			} while(destinationFile.exists());
			
			destinationFile.getParentFile().mkdir();
			files[i].transferTo(destinationFile); // 
			
			dao.contentWritePicDao(postidx, fileOriName, destinationFileName, fileExtension, fileUrl);
			
		}
		}
			
		return "content_view";
	}
	
	
	@RequestMapping(value = "/content_view")
	public String content_view(HttpSession session, Model model, HttpServletRequest request) {
		
		sidebar(session,model);
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		//게시자,프로필사진, 컨텐츠 사진, contentlist
		
		String sid = (String) request.getAttribute("sessionId");
		
		List<PostingUrlDto> listDto = dao.postViewDao();
		PostingUrlDto postViewDto = listDto.get(0); 
		model.addAttribute("postView", postViewDto);
		System.out.print(postViewDto);
		
		
		return "content_view";
	}
	
	@RequestMapping(value = "/buying_List")
	public String buying_List(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		
		
		return "buying_List";
	}
	
	@RequestMapping(value = "/tradeView")
	public String tradeViw(HttpServletRequest request, HttpSession session, Model model) {
		sidebar(session,model);
		String postidx = request.getParameter("postidx");
		IDao dao = sqlSession.getMapper(IDao.class);
		MemberDto dto = dao.postInfomationDao(postidx);
		System.out.println(dto.getPostDto().getTitle());
		model.addAttribute("pinfo", dto);
		
		return "tradeView";
	}
	
}
