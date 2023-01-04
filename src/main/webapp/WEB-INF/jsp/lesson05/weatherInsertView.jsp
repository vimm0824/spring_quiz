<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청 - 날씨 입력</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<link rel="stylesheet" type="text/css" href="/css/lesson05/style.css">

</head>
<body>
	<div id="wrap" class="">
		<div class="domain d-flex">
			<div class="menu bg-primary col-2 pl-2">
				<div class="logo">
					<img alt="기상청 로고" src="/img/lesson05/logoColor.jpg" width=200 hight=90>
				</div>
				<aside>
					<ul class="nav flex-column">
						<li class="nav-item"><a href="http://localhost:8080/lesson05/weather_history_view" class="nav-link text-white">날씨</a></li>
						<li class="nav-item"><a href="http://localhost:8080/lesson05/weather_insert_view" class="nav-link text-white">날씨 입력</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-white">테마날씨</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-white">관측 기후</a></li>
					</ul>
				</aside>
			</div>
			<div class="contents col-10">
				<div class="container col-12 mt-4">
					<h2>날씨 입력</h2>
					
					<form method="post" action="/lesson05/add_weather">
						<div class="d-flex mt-3">
							<div class="form-group col-4 input-group">
								<span class="m-2">날짜</span>
								<input type="text" id="date" name="date" class="form-control">
								<script>
								 	$(document).ready(function() {
									    $("#date").datepicker();
									})
								</script>
							</div>
							<div class="form-group col-4 input-group">
								<span class="m-2">날씨</span>
								<select name="weather" class="form-control"> 
									<option selected>맑음</option>
									<option>구름조금</option>
									<option>흐림</option>
									<option>비</option>
								</select>
							</div>
							<div class="form-group col-4 input-group">
								<span class="m-2">미세먼지</span>
								<select name="microDust" class="form-control"> 
									<option selected>좋음</option>
									<option>보통</option>
									<option>나쁨</option>
									<option>최악</option>
								</select>
							</div>
						</div>
						<div class="d-flex">
							<div class="form-group col-4 input-group">
								<span class="m-2">기온</span>
								<input type="text" id="temperatures" name="temperatures" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">℃</span>
								</div>	
							</div>
							<div class="form-group col-4 input-group">
								<span class="m-2">강수량</span>
								<input type="text" id="precipitation" name="precipitation" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">mm</span>
								</div>	
							</div>
							<div class="form-group col-4 input-group">
								<span class="m-2">풍속</span>
								<input type="text" id="windSpeed" name="windSpeed" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">km/h</span>
								</div>	
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn-success">저장</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<footer class="d-flex">
			<div>
				<img alt="기상청 로고" src="/img/lesson05/logo.jpg" widgh=150 height=80>
			</div>
			<div class="m-3 pl-4 footer-text text-secondary">
				<div>(07062) 서울시 동작구 여의대방로 16길 61</div>
				<div>Copyright © 2020 KMA. All Rights RESERVED</div>
			</div>
		</footer>
	</div>
</body>
</html>