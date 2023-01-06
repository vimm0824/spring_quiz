package com.quiz.lesson06;

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

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.model.Bookmark;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Quiz01Controller {

	@Autowired
	private BookmarkBO bookmarkBO;

	// http://localhost:8080/lesson06/quiz01/add_bookmark_view
	@GetMapping("/quiz01/add_bookmark_view")
	public String addBookmarkView() {
		
		return "lesson06/addBookmarkView";
	}
	
	@PostMapping("/quiz01/is_duplication")
	@ResponseBody
	public Map<String, Integer> isDuplication(
			@RequestParam("url") String url) {
		
		Map<String, Integer> result = new HashMap<>();
		result.put("is_duplication", bookmarkBO.existUserByUrl(url));
		
		return result;
	}
	
	// 
	@PostMapping("/quiz01/add_bookmark")
	@ResponseBody
	public Map<String, String> addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		bookmarkBO.addBookmark(name, url);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "성공");
		
		return result;	// jackson => JSON String 
	}

	// http://localhost:8080/lesson06/quiz01/bookmark_view
	@GetMapping("/quiz01/bookmark_view")
	public String bookmarkView(Model model) {
		
		List<Bookmark> result = bookmarkBO.getBookmarkList();
		model.addAttribute("result", result);
		
		return "lesson06/bookmarkView";
	}
	
	// Mapping 종류(RCD)
	// (Read)Get: 조회  쿼리스트링, request body 없음
	// (Create)Post: insert, add
	// (Delete)Delete: 삭제
	// Put: 수정
	
	// http://localhost:8080/lesson06/quiz01/delete_bookmark_view
	@DeleteMapping("/quiz01/delete_bookmark_view")
	@ResponseBody
	public Map<String, Object> deleteBookmark(
			@RequestParam("id") int id) {
		
		Map<String, Object> result = new HashMap<>();
		
		int row = bookmarkBO.deleteBookmarkById(id);
		if (row > 0) {
			result.put("code", 1);	// 성공
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("result", "실패");
			result.put("error_message", "삭제된 행이 없습니다.");
		}
		
		return result;
	}
}
