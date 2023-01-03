package com.quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Weather;

@Repository
public interface WeatherHistoryDAO {

	public List<Weather> selectWeatherHistoryList();
	
	public void insertWeather(Weather weather);
}
