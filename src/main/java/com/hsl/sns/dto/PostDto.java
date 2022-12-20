package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostDto {

	private int postidx; //post(시퀀스)
	private String id; //포스트 memberID
	private String content;
	private String createdate; //만든시간
	private String updatedate; //수정시간
	
	
}
