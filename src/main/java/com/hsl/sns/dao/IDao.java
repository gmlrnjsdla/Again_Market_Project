package com.hsl.sns.dao;

import java.util.List;

import com.hsl.sns.dto.MemberDto;

public interface IDao {
	
	public void joinMemberDao(String id, String pwd, String name, String birth, String mail, String phone, String nick, String profile, String greet);
	public MemberDto memberInfoDao(String id);
	public List<MemberDto> memberListDao(String id);
	
}
