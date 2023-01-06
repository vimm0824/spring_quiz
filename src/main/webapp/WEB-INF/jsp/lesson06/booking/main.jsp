<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="/css/booking/style.css">
</head>
<body>
	<div id="wrap" class="container">
		<header>
			<div class="d-flex justify-content-center align-items-center">
				<a href="http://localhost:8080/lesson06/booking/main" class="logo">통나무 팬션</a>
			</div>
		</header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link text-white">팬션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">객실보기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">예약하기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">예약목록</a></li>
			</ul>
		</nav>
		<div class="contents">
			<div class="banner">
				<img alt="배너" src="/img/booking/banner1.jpg" width="1110">
			</div>
			<div class="d-flex bottom">
				<div class="col-4 left-right h-100 d-flex justify-content-center align-items-center">
					<div>
						<div class="display-3 text-white">실시간</div>
						<div class="display-3 text-white">예약하기</div>
					</div>
				</div>
				<div class="col-4 login"></div>
				<div class="col-4 left-right h-100 d-flex justify-content-center align-items-center">
					<div class="mr-3">
						<div class="h1 text-white">예약문의:</div>
						<div class="h1 text-white">010-</div>
						<div class="h1 text-white">1111-2222</div>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<div class="text-secondary">
				<div><small>제주특별자치도 제주시 애월읍</small></div>
				<div><small>사업자등록번호:111-222-55555/농어촌민박사업장/대표:김통목</small></div>
				<div><small>Copyright 2025 © tongnamu. All Right reserved</small></div>
			</div>
		</footer>
	</div>
</body>
</html>