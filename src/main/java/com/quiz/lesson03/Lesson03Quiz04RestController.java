package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
@RequestMapping("/lesson03/quiz04")
public class Lesson03Quiz04RestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// http://localhost:8080/lesson03/quiz04/1?id=20
	@RequestMapping("/1")
	public String quiz04_1(
			@RequestParam("id") int id) {
		realEstateBO.deleteRealEstateById(id);
		return "삭제 성공";
	}
}
