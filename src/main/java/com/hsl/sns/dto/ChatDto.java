package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatDto {
	
	private String no; 
	private int room;
	private String sendnick;
	private String recvnick;
	private String sendtime;
	private String readtime;
	private String content;
	private String readchk;
	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String othernick;
	
	// 현재 사용자의 메세지 상대 profile을 담는다.
	private String profileName;
	
	// 현재 사용자 nick
	private String nick;
	
	// 안읽은 메세지 갯수 
	private int unread;
	
	
	
}
