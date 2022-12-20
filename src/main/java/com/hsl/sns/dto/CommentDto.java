package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDto {

	private int commentidx; //댓글 시퀀스
	private String id; //memberId
	private int postidx; //해당 포스트
	private String content; //댓글내용
	private int parentcommentidx; //상위댓글 idx;
	private String createdate; //만든시간
	private String updatedate; //수정시간
	
	
}
