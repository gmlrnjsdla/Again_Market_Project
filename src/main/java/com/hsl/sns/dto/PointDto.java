package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointDto {

	private int pointidx;
	private String id;
	private int pluspoint;
	private int minuspoint;
	private int currentpoint;
	private String explain;
	
}
