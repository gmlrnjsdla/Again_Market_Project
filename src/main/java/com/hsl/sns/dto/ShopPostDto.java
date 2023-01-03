package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShopPostDto {
	private int shopidx; //post(시퀀스)
	private String title; //제목
	private String content; //내용
	private int spoint; //포인트
	private String fileName;//제품사진이름
	private String fileUrl;//제품사진URL
	private String fileExtension;
}
