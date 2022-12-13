package com.hsl.sns.dao;

import java.util.List;

import com.hsl.sns.dto.MemberDto;

public interface IDao {
	
	public void joinMemberDao(String mid, String mpw, String mphone, String name, String mnickname, String memail);
	public MemberDto memberInfoDao(String mid);
	public List<MemberDto> memberListDao(String mid);
	
}
