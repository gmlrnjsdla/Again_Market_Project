package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentLikeDto {

	private int commentlikeidx; //댓글좋아요 시퀀스
	private int commentidx; //좋아요 원글의 idx
	private String id; //memberId
	
	
	private CommentDto	commentDto;
	
	
}
