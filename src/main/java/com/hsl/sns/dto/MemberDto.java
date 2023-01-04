package com.hsl.sns.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;


import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
	
//	@NotBlank(message="공백을 허용하지 않습니다.")
//	private String id;
//	
//	@NotBlank(message="공백을 허용하지 않습니다.")
//	private String pwd;
//	
//	@NotBlank(message="공백을 허용하지 않습니다.")
//	private String name;
//	
//	@NotBlank(message="공백을 허용하지 않습니다.")
//	private String birth;
//	
//	@Email(message = "이메일 형식을 지켜주세요")
//	private String mail;
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
	
	
//	public User toEntity(){
//        return User.builder()
//        		.user_id(id)
//        		.password(pwd)
//                .user_name(name)
//                .birth(birth)
//                .email(mail)
//                
//                .build();
//	}
	
}