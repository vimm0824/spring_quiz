package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesoon04Quiz02Controller {

	@Autowired
	private RealtorBO realtorBO;
	
	// http://localhost:8080/lesson04/quiz02/add_realtor_view
	@GetMapping("/add_realtor_view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	// http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealor(
			@ModelAttribute Realtor realtor, Model model) {
		realtorBO.addRealtor(realtor);
		
		Realtor result = realtorBO.getRealtorById(realtor.getId());
		model.addAttribute("result", result);
		model.addAttribute("subject", "공인중개사 정보");
		
		return "lesson04/afterAddRealtor";
	}

	// 아이디 줘서 위에거랑 연동해보기
	// http://localhost:8080/lesson04/quiz02/realtor_info
	@GetMapping("/realtor_info")
	public String realtorInfo(@RequestParam(value="id", required = false) Integer id, Model model) {
		if (id == null) {
			id = 1;
		}
		Realtor result = realtorBO.getRealtorById(id);
		model.addAttribute("result", result);
		model.addAttribute("subject", "공인중개사 정보");
		return "lesson04/afterAddRealtor";
	}
}
