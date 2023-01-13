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
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hsl.sns.dao.Chat;
import com.hsl.sns.dao.IDao;
import com.hsl.sns.dto.ErrorResponse;
import com.hsl.sns.dto.FollowDto;
import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PostDto;




@Controller
public class MemberController {

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
		
		List<PostDto> buyList = dao.buyListDao(sid); // 예약목록
		model.addAttribute("bList", buyList);
		
		List<PostDto> mypostList = dao.myPostListDao(sid);
		model.addAttribute("pList", mypostList); //판매목록
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
				session.setMaxInactiveInterval(100000);
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
	
	

	
	
	@RequestMapping(value = "/joinOk", method = RequestMethod.POST)
	public String joinOk(HttpServletRequest request, Model model, HttpServletResponse response) {
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String nick = request.getParameter("nick");
		String greet = request.getParameter("greet");
		
		MemberDto mdto = dao.memberInfoDao(id);
		MemberDto ndto = dao.memberInfoDaoNick(nick);
		if(mdto != null ) {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('이미 가입된 아이디입니다!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(ndto != null) {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('이미 존재하는 닉네임입니다!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			dao.joinMemberDao(id, pwd, name, birth, mail, phone, nick, greet);
			model.addAttribute("name", name);
			
			MemberDto dto = dao.memberInfoDao(id);
			int currentPoint = dto.getPoint();
			
			int point = 200;
			String explain = "회원가입 축하 +200p";
			
			dao.pointPlus(point, id);		//point 증가
			dao.pointPlusDao(id, point,currentPoint,explain);	//pointtbl에 증가된 값 저장
		}
		
		
		
		return "joinOk";
	}
	
	@RequestMapping(value = "/memberModify")
	public String memberModify(Model model, HttpSession session) {
		
		sidebar(session,model);
		String sid = (String) session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto memberDto = dao.memberInfoDao(sid);
		
		model.addAttribute("memberDto", memberDto);
		
		
		return "memberModify";
	}
	
	@RequestMapping(value = "/profileModifyOk")
	public String profileModifyOk(HttpServletResponse response,HttpServletRequest request,Model model, HttpSession session,@RequestPart MultipartFile files) throws IllegalStateException, IOException {
	
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String sid = (String) session.getAttribute("sessionId");
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
		
//				String fileUrl = "C:/Users/ici/git/SNS_Project/src/main/resources/static/uploadfiles/";
//				String fileUrl = "C:/Users/user.JY-20200602UADW/git/SNS_Project/src/main/resources/static/uploadfiles/";
		// 첨부된 파일이 저장될 서버의 실제 폴더 경로 url  주소 /로 바까주고 마지막에 / 꼭 추가!
		
		
		do {
		destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "."+ fileExtension;
		//파일변수명(렌덤 숫자와영문대소문자 32개)뽑기 - 랜덤32자+ . + 확장자
		// 알파벳대소문자와 숫자를 포함한 랜덤 32자 문자열 생성 후 . 을 구분자로 원본 파일의 확장자를 연결->실제 서버에 저장할 파일의 이름
	
		destinationFile = new File(fileUrl+destinationFileName);
		} while(destinationFile.exists());
		//혹시 같은 이름의 파일이름이 존재하는지 확인
		
		destinationFile.getParentFile().mkdir();
		files.transferTo(destinationFile); // 업로드된 파일이 지정한 폴더로 이동완료!!
		//add thorws declaration	
				
		int flag = dao.profileModifyDao(sid, destinationFileName, fileUrl, fileExtension);
		if(flag == 0) {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('프로필 사진 실패! 다시 확인해주세요!');hisory.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return String.format("redirect:/sell_List?id=%s", sid);
	}
	
	@RequestMapping(value = "/memberModifyOk")
	public String memberModifyOk(HttpServletRequest request,Model model, HttpSession session) throws IllegalStateException, IOException {
		
		sidebar(session,model);
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String sid = (String) session.getAttribute("sessionId");
		String name =  request.getParameter("name");
		String mail =  request.getParameter("mail");
		String nick =  request.getParameter("nick");
		String phone =  request.getParameter("phone");
		String greet =  request.getParameter("greet");
		
		String snick = (String)session.getAttribute("nick");
		dao.memberModifyDao(sid, name, mail, nick, phone, greet);
		dao.messageModifyDao(snick,nick);
		dao.messageModifyDao1(snick,nick);
		session.setAttribute("nick", nick);
		
		return String.format("redirect:/sell_List?id=%s", sid);
	}

	@RequestMapping(value = "/memberDelete")
	public String memberDelete(HttpServletRequest request,Model model, HttpSession session) {
		sidebar(session,model);
		String sid = (String) session.getAttribute("sessionId");
		String snick = (String) session.getAttribute("nick");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.memberDeleteDao(sid);
		dao.messageDeleteDao(snick);
		
		session.invalidate();
		
		return "redirect:login";
	}
	
	@RequestMapping(value = "/findId")
	public String findId() {
	
		return "/findId";
	}
	@RequestMapping(value = "/findIdOk")
	public String findIdOk(HttpServletRequest request, Model model,HttpServletResponse response) {
		
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto findIdDto = dao.findIdDao(name, mail, phone);
		
		if(findIdDto == null) { //1이면 로그인 OK
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('아이디를 찾을 수 없습니다. 다시확인해주세요!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/findId";
		}else {
		
		model.addAttribute("findId", findIdDto);
		
		return "/findIdOk";
		}
	}
	
	
	@RequestMapping(value = "/findPw")
	public String findPw() {
	
		return "/findPw";
	}
	@RequestMapping(value = "/findPwOk")
	public String findPwOk(HttpServletRequest request, Model model,HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto findPwDto = dao.findPwDao(name, mail, phone, id);
		
		if(findPwDto == null) { //1이면 로그인 OK
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('비밀번호를 찾을 수 없습니다. 다시확인해주세요!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "/findPw";
		}else {
		
		model.addAttribute("findPw", findPwDto);
		System.out.print(findPwDto);
		return "/findPwOk";
		}
	}
}
