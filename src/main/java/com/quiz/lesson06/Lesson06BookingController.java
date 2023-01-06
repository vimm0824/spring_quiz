package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson06")
@Controller
public class Lesson06BookingController {

	@Autowired
	private 
	
	// http://localhost:8080/lesson06/booking/main
	@GetMapping("/booking/main")
	public String bookingMain() {
		return "lesson06/booking/main";
	}
	
	// http://localhost:8080/lesson06/booking/booking_view
	@GetMapping("/booking/booking_view")
	public String bookingView(Model model) {
		
		List<Map<String, Object>> result = new ArrayList<>();
		
		
		return "lesson06/booking/bookingView";
	}
}
