package com.hsl.sns.dao;

import java.util.ArrayList;
import java.util.List;

import com.hsl.sns.dto.CommentDto;
import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PostDto;
import com.hsl.sns.dto.PostingUrlDto;



public interface IDao {
	
	public void joinMemberDao(String id, String pwd, String name, String birth, String mail, String phone, String nick, String profile, String greet);
	public MemberDto memberInfoDao(String id);
	public List<MemberDto> memberListDao(String id);
	public void memberModifyDao(String id, String name, String mail, String nick, String phone, String greet);
	public void memberDeleteDao(String id);
	
	
	//contentWrite 관련
	public void contentWriteContDao(String title, String type, int price, String tradeplace, String content, String id); //post write content insert
	public void contentWritePicDao(int postidx, String fileOriName, String fileName, String fileExtension, String fileUrl); //post write imgurl insert
	public List<PostDto> postInfoDao(String id); //파일업로드시 postidx 찾는 DAO
	public int postCountDao(String id); //총게시글 DAO
	
	//index 관련
	
	public List<PostDto> postListDao(); //index postList
	public List<PostingUrlDto> postUrlListDao(); //index 사진List
	public List<PostingUrlDto> postViewDao(); //contentView
	public MemberDto postInfomationDao(String postidx);
	
	
	//follow
	public void followDao(int followcontent, String followid);
	public int followCheckDao(String followid,int followcontent);
	public int followCountDao(int followcontent);
	public int followerCountDao(String followid);
	
	//댓글관련
	public void commentDao(String id, String postidx, String content);//댓글입력
	public List<CommentDto> commentListDao(String postidx);//댓글전체리스트
	public PostDto commentViewDao(String postidx);//해당댓글
	
}
