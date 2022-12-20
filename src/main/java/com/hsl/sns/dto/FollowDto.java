package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowDto {

	private int followidx; //팔로우시퀀스
	private String followeridx; //팔로워 아이디
	private String followeeidx; //팔로잉 아이디
	private String createdate; //만든시간
	private String updatedate; //수정시간
	
}
