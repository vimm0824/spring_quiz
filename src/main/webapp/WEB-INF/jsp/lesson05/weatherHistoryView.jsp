<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
				<div class="container mt-3">
					<h2>과거 날씨</h2>
					
					<table class="table text-center">
						<thead>
							<tr>
								<th>날짜</th>
								<th>날씨</th>
								<th>기온</th>
								<th>강수량</th>
								<th>미세먼지</th>
								<th>풍속</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="day" items="${result}">
							<tr>
								<td>
									<fmt:formatDate value="${day.date}" pattern="yyyy년 MM월 dd일"/>
								</td>
								<td>
									<c:choose>
										<c:when test="${day.weather eq '맑음'}">
											<img alt="맑음" src="/img/lesson05/sunny.jpg">
										</c:when>
										<c:when test="${day.weather eq '흐림'}">
											<img alt="흐림" src="/img/lesson05/cloudy.jpg">
										</c:when>
										<c:when test="${day.weather eq '비'}">
											<img alt="비" src="/img/lesson05/rainy.jpg">
										</c:when>
										<c:otherwise>
											<img alt="구름조금" src="/img/lesson05/partlyCloudy.jpg">
										</c:otherwise>
									</c:choose>
								</td>
								<td>${day.temperatures}℃</td>
								<td>${day.precipitation}mm</td>
								<td>${day.microDust}</td>
								<td>${day.windSpeed}km/h</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
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