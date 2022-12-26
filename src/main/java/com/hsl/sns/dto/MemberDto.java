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
	private String profile;
	private String greet;
	
	private PostDto postDto;
	
}