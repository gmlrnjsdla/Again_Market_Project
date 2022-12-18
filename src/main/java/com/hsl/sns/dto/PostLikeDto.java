package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostLikeDto {

	private int postlikeidx; //좋아요 시퀀스
	private int postidx; //좋아요를 받을 포스트아이디
	private String id; // memberId
	private String createdate; //만든날짜
	private String updatedate; //수정시간
	
}
