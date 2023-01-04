package com.hsl.sns.dto;




import lombok.*;

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
	private String greet;
	private String profileName;//프로필사진이름
	private String profileUrl;//프로필사진URL
	private String fileExtension;
	private int point;
	
	private PostDto postDto;
	
}