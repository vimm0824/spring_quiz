package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz01RestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// http://localhost:8080/lesson03/quiz01/1?id=20
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01(
				@RequestParam("id") int id
			) {
		
		return realEstateBO.getRealEstateId(id);
	}
	
	//http://localhost/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/lesson03/quiz01/2")
	public RealEstate quiz02(@RequestParam("rent_price") int rentPrice) {
		return ;
	}
}
