package com.hsl.sns.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {

	private int productidx;
	private String title;
	private String id;
	private String productaddress;
	private String orderdate;
	private String phone;
	
}
