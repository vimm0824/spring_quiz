package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quiz.lesson06.model.Booking;

public interface BookingDAO {

	public List<Booking> selectBookingList();
	
	public int deleteBookingById(int id);
	
	public int insertBooking(
			@Param("name") String name, 
			@Param("date") String date, 
			@Param("day") int day, 
			@Param("headcount") int headcount, 
			@Param("phoneNumber") String phoneNumber);
	
	public Booking selectBookingListByNamePhoneNumber(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
}
