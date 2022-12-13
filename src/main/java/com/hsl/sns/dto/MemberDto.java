package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {

	private String mid;
	private String mpw;
	private String mname;
	private String mnickname;
	private String mphone;
	private String memail;
	
}
