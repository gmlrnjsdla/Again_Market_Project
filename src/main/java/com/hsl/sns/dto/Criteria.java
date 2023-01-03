package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria {
	
	private int pageNum = 1; 	//현재 페이지 번호
	private int amount = 10; 	//한 페이지에 출력 표시될 글의 수
	private int startNum; 		//현재 선택된 페이지에서 시작할 글 번호
	
	public String getQuerryString() {	//페이지 파라미터 값을 넘김
		
		return String.format("page=%d&pageSize=%d",pageNum,amount);
	}
	
}
