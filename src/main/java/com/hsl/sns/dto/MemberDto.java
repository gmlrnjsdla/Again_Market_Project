package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {

	private String id;
	private String pwd;
	private String name;
	private String birth;
	private String mail;
	private String phone;
	private String nick;
	private String rdate;
	private String profile;//프로필사진원래이름
	private String greet;
	private String profilename;//프로필사진이름
	private String profileurl;//프로필사진URL
	
	
	private PostDto postDto;
	
}