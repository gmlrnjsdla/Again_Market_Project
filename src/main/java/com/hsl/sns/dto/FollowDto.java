package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowDto {

	private int followidx; //팔로우시퀀스
	private String followcontent; // 찜한 게시물 번호
	private String followid; //팔로잉 아이디
	
	private PostDto postDto;
}
