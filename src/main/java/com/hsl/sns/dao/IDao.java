package com.hsl.sns.dao;

import java.util.List;

import com.hsl.sns.dto.MemberDto;
import com.hsl.sns.dto.PostDto;
import com.hsl.sns.dto.PostingUrlDto;

public interface IDao {
	
	public void joinMemberDao(String id, String pwd, String name, String birth, String mail, String phone, String nick, String profile, String greet);
	public MemberDto memberInfoDao(String id);
	public List<MemberDto> memberListDao(String id);
	
	
	
	
	
	
	
	
	
	
	//index 관련
	public List<PostDto> postDtos(String id, String content); 
	public List<PostingUrlDto> postingUrlDtos(int postidx, String imgurl); //int, String
	
	
	
	
	
}
