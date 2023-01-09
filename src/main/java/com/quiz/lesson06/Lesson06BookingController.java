package com.quiz.lesson06;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06")
@Controller
public class Lesson06BookingController {

	@Autowired
	private BookingBO bookingBO;
	
	// http://localhost:8080/lesson06/booking/main
	@GetMapping("/booking/main")
	public String bookingMain() {
		return "lesson06/booking/main";
	}
	
	// http://localhost:8080/lesson06/booking/booking_view
	@GetMapping("/booking/booking_view")
	public String bookingView(Model model) {
		
		List<Booking> result = bookingBO.getBookingList();
		
		model.addAttribute("result", result);
		
		return "lesson06/booking/bookingView";
	}
	
	// http://localhost:8080/lesson06/booking/del_booking
	@DeleteMapping("/booking/del_booking")
	@ResponseBody
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id
			) {
		Map<String, Object> result = new HashMap<>();
		
		int row = bookingBO.deleteBookingById(id);
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("result", "실패");
		}
		
		return result;
	}
	
	// http://localhost:8080/lesson06/booking/insert_booking_view
	@GetMapping("/booking/insert_booking_view")
	public String insertBookingView() {
		
		return "lesson06/booking/insertBookingView";
	}
	
	// http://localhost:8080/lesson06/booking/insert_booking
	@PostMapping("/booking/insert_booking")
	@ResponseBody
	public Map<String, Object> insertBooking(
			@RequestParam("name") String name
			, @RequestParam("date") String date
			, @RequestParam("day") int day
			, @RequestParam("headcount") int headcount
			, @RequestParam("phoneNumber") String phoneNumber
			) {
		Map<String, Object> result = new HashMap<>();
		
		int row = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("result", "실패");
		}
		
		return result;
	}
	
	// http://localhost:8080/lesson06/booking/check_booking
	@PostMapping("/booking/check_booking")
	@ResponseBody
	public Map<String, Object> checkBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		Map<String, Object> result = new HashMap<>();
		
		Booking booking = bookingBO.getBookingListByNamePhoneNumber(name, phoneNumber);
		
		if (booking != null) {
			result.put("code", 1);
			result.put("message", "성공");
			result.put("result", booking);
		} else {
			result.put("code", 500);
			result.put("message", "실패");
		}
		
		return result;
	}
	// https://marobiana.tistory.com/168 => 강사님 블로그
}
