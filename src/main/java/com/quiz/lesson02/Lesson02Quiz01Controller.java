package com.quiz.lesson02;

import java.util.List;

import org.apache.catalina.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;

// 강사님 깃허브 /marobiana

@RestController
public class Lesson02Quiz01Controller {

	@Autowired
	private StoreBO storeBO;
	
	public List<Store> quiz01() {
		List<Store> storeList = storeBO.getStoreList(); 
		return storeList;
	}
}
