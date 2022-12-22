package com.quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/quiz01")
@Controller
public class Lesson01Quiz01Controller {

	@ResponseBody
	@RequestMapping("/1")
	public String quiz01() {
		String str = "<h1>테스트 프로젝트 완성</h1>"
				+ "<h4>해당 프로젝트를 통해서 문제 풀이를 진행 합니다.</h4>";
		return str;
	}
	
	@ResponseBody
	@RequestMapping("/2")
	public Map<String, Object> quiz01_1() {
		Map<String, Object> map = new HashMap<>();
		map.put("국어", 80);
		map.put("수학", 90);
		map.put("영어", 85);
		return map;	// jackson 라이브러리로 인해 map -> json으로 변환됨
	}
}
