package com.hsl.sns.dao;

import java.util.ArrayList;

import com.hsl.sns.dto.ChatDto;

public interface Chat {

	public ArrayList<ChatDto> messageList(ChatDto to);
	public ArrayList<ChatDto> roomContentList(ChatDto to);
	public int messageSendInlist(ChatDto to);
	public int messageExist(String nick);
	
}
