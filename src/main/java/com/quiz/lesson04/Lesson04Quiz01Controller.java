package com.quiz.lesson04;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {

	// http://localhost:8080/lesson04/quiz01/1
	@RequestMapping("/1")
	public String addSeller() {
		return "lesson04/add_seller";
	}
}
