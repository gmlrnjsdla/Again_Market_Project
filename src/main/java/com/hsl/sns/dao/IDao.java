package com.hsl.sns.dao;

import java.util.List;

import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PostDto;
import com.hsl.sns.dto.PostingUrlDto;

public interface IDao {
	
	public void joinMemberDao(String id, String pwd, String name, String birth, String mail, String phone, String nick, String profile, String greet);
	public MemberDto memberInfoDao(String id);
	public List<MemberDto> memberListDao(String id);
	public void memberModifyDao(String id, String name, String mail, String nick, String phone, String greet);
	public void memberDeleteDao(String id);
	
	
	
	
	
	
	
	//index 관련
	public void contentWriteContDao(String content, String id); //post write content insert
	public void contentWritePicDao(int postidx, String fileOriName, String fileName, String fileExtension, String fileUrl); //post write imgurl insert
	public List<PostDto> postInfoDao(String id); 
	public int postCountDao(String id);
	
	
	//follow
	public void followDao(String followeeid, String followid);
	public int followCheckDao(String followeeid, String followid);
	public int followCountDao(String followid);
	public int followerCountDao(String followeeid);
	
}
