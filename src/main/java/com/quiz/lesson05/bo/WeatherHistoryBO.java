package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherHistoryDAO;
import com.quiz.lesson05.model.Weather;

@Service
public class WeatherHistoryBO {
	
	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;
	
	public List<Weather> getWeatherHistoryList() {
		return weatherHistoryDAO.selectWeatherHistoryList();
	}
	
	public void addWeather(Weather weather) {
		weatherHistoryDAO.insertWeather(weather);
	}
}
