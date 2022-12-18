package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostingUrlDto {

	private int postingimgurlidx; //이미지포스팅URLNUM(시퀀스)
	private int postidx; // 포스트(시퀀스)
	private String imgurl; // 이미지 url 저장된곳
	private String createdate; //만든날짜
	private String updatedate; //수정시간
	
	
}

