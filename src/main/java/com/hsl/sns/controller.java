package com.hsl.sns;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class controller {

	@RequestMapping(value = "test")
	public String test() {
		
		return "test";
	}
	
}
