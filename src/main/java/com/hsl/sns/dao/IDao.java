package com.hsl.sns.dao;

import java.util.List;

import com.hsl.sns.dto.MemberDto;

public interface IDao {
	
	public void joinMemberDao(String id, String pwd, String phone, String name, String nick, String mail);
	public MemberDto memberInfoDao(String id);
	public List<MemberDto> memberListDao(String id);
	
}
