package com.hsl.sns.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.hsl.sns.dao.Chat;
import com.hsl.sns.dao.IDao;
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
		
		return "memberModify";
	}

	@RequestMapping(value = "/index")
	public String index(Model model, HttpSession session) {
		
		sidebar(session,model);
		
		
		return "index";
	}
	
	
	@RequestMapping(value = "/content_List")
	public String content_List(HttpServletRequest request, HttpSession session, Model model) {
		
		sidebar(session,model);
		
		return "content_List";
	}
	
	
	
	@RequestMapping(value = "content_write")
	public String content_write(HttpSession session, Model model) {
		
		sidebar(session,model);	
		
		return "content_write";
	}
	
	
	
	
	
	
	
	@PostMapping(value = "/writeOk")
	public String writeOk(HttpSession session, Model model, HttpServletRequest request,
			 @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		
		sidebar(session,model);
		
		String sid = (String)session.getAttribute("sessionId");
		IDao dao = sqlSession.getMapper(IDao.class);
		// write
		
			
		//글첨부
		String content = request.getParameter("content");
		
		//그림파일첨부
		String fileOriName = files.getOriginalFilename(); 
		String fileExtension =FilenameUtils.getExtension(fileOriName).toLowerCase();
																		 
		File destinationFile; 
		String destinationFileName; 
		String fileUrl = "C:/Users/ici/git/SNS_Project/src/main/resources/static/uploadfiles/";
		
		
		
		do {
		destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "."+ fileExtension;
		
		destinationFile = new File(fileUrl+destinationFileName);
		} while(destinationFile.exists());
		
		
		destinationFile.getParentFile().mkdir();
		files.transferTo(destinationFile); // 
			
		
		dao.contentWriteContDao(content, sid);
		
		List<PostDto> postList = dao.postInfoDao(sid);
		
		PostDto dto = postList.get(0);
		int postidx = dto.getPostidx();
		
		dao.contentWritePicDao(postidx, fileOriName, destinationFileName, fileExtension, fileUrl);
			
	
		
			
		return "index";
	}
	
	
	@RequestMapping(value = "/content_view")
	public String content_view(HttpSession session, Model model) {
		
		sidebar(session,model);
		
		return "content_view";
	}
	
	
	
	//=============================== Content End ===============================//
	
}