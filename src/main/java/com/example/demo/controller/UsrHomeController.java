package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {
	int i = -1;
	
	
	@GetMapping("/user/home/main") // 이게 요청
	@ResponseBody //아래의 함수 리턴을 통해 응답
	public String showMain() {
		return "Hello 안녕하세요";
	}
	
	@GetMapping("/user/home/int")
	@ResponseBody
	public int test1() {
		return ++i;
	}
	
}
