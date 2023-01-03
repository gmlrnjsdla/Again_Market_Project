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
	private String title; //제목
	private String type;// 제품종류
	private int price; //가격
	private String tradeplace; //희망거래장소 
	private String content; //내용
	private String createdate; //만든시간
	private String buyuser;
	private int buyflag;
	private int sellflag;
	
	private String profileName;
	private String hopedate;
	private String nick;
	
	//스케줄러 날짜
	private String start;

}



