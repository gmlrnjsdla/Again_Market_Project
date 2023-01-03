package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDto {
	
	private int startPage; 	// 현재화면에서 보여질 시작 페이지 번호
	private int endPage; 	// 현재화면에서 보여질 마지막 페이지 번호
	private boolean prev;
	private boolean next;
	private int total; 		//전체 페이지 개수

	private Criteria cri;
	
	public PageDto(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) Math.ceil((cri.getPageNum()/5.0)) * 5;	//Math.ceil -> 올림
		this.startPage = this.endPage - 4;
		
		int realEnd = (int) Math.ceil((total*1.0) /cri.getAmount());
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
