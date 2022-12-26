package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstateId(int id) {
		return realEstateDAO.selectRealEstateId(id);
	}
	
	public List<RealEstate> getRealEstateRentPrice(int rentPrice) {
		return realEstateDAO.selectRealEstateRentPrice(rentPrice);
	}

	public List<RealEstate> getRealEstateAreaPrice(int area, int price) {
		return realEstateDAO.selectRealEstateAreaPrice(area, price);
	}
}
