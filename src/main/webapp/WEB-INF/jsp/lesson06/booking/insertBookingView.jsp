<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션 - 예약하기</title>
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
				<li class="nav-item"><a href="/lesson06/booking/insert_booking_view" class="nav-link text-white">예약하기</a></li>
				<li class="nav-item"><a href="/lesson06/booking/booking_view" class="nav-link text-white">예약목록</a></li>
			</ul>
		</nav>
		<div class="contents mt-3">
			<h1 class="text-center">예약하기</h1>
			
			<div class="d-flex justify-content-center ml-4">
				<div class="col-6">
					<label for="name"><b>이름</b></label>
					<input type="text" id="name" class="form-control col-12">
				</div>
			</div>
			<div class="d-flex justify-content-center ml-4 mt-2">
				<div class="col-6">
					<label for="date"><b>예약날짜</b></label>
					<input type="text" id="date" class="form-control col-12">
				</div>
			</div>
			<div class="d-flex justify-content-center ml-4 mt-2">
				<div class="col-6">
					<label for="day"><b>숙박일수</b></label>
					<input type="text" id="day" class="form-control col-12">
				</div>
			</div>
			<div class="d-flex justify-content-center ml-4 mt-2">
				<div class="col-6">
					<label for="headcount"><b>숙박인원</b></label>
					<input type="text" id="headcount" class="form-control col-12">
				</div>
			</div>
			<div class="d-flex justify-content-center ml-4 mt-2">
				<div class="col-6">
					<label for="phoneNumber"><b>전화번호</b></label>
					<input type="text" id="phoneNumber" class="form-control col-12" placeholder="ex) 010-XXXX-XXXX">
				</div>
			</div>
			<div class="d-flex justify-content-center ml-4 mt-4">
				<div class="col-6">
					<input type="button" id="btn-insert" class="btn btn-warning col-12 text-white" value="예약하기">
				</div>
			</div>
		</div>
		<footer>
			<div class="text-secondary m-3">
				<div><small>제주특별자치도 제주시 애월읍</small></div>
				<div><small>사업자등록번호:111-222-55555/농어촌민박사업장/대표:김통목</small></div>
				<div><small>Copyright 2025 © tongnamu. All Right reserved</small></div>
			</div>
		</footer>
	</div>
	
	<script>
	
		$(document).ready(function() {
			$('#date').datepicker({
				dateFormat:"yy-mm-dd"
				, minDate:0		// 오늘부터 그 뒤 선택
			});
			
			$('#btn-insert').on('click', function() {
				// alert(111);
				let name = $('#name').val().trim();
				let date = $('#date').val();
				let day = $('#day').val();
				let headcount = $('#headcount').val();
				let phoneNumber = $('#phoneNumber').val().trim();
				
				if (name.length < 1) {
					alert("이름을 입력하세요");
					return;
				}
				if (date.length < 1) {
					alert("예약날짜를 입력하세요");
					return;
				}
				if (day.length < 1) {
					alert("숙박일수를 입력하세요");
					return;
				}
				if (isNaN(day) == true) {
					alert("숙박일수를 숫자로 입력하세요");
					return;
				}
				if (headcount.length < 1) {
					alert("인원수를 입력하세요");
					return;
				}
				if (isNaN(headcount) == true) {
					alert("숙박인원을 숫자로 입력하세요");
					return;
				}
				if (phoneNumber.length < 1) {
					alert("전화번호를 입력하세요");
					return;
				}
				if (phoneNumber.startsWith("010-") == false) {
					alert("전화번호 형식이 잘못되었습니다.(010-)");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/lesson06/booking/insert_booking"
					, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
				
					,success:function(data) {
						if (data.code == 1) {
							location.href = "/lesson06/booking/booking_view";
						}
					}
					,error:function(e) {
						alert("에러" + e);
					}
				});
				
			});
		});
	</script>
</body>
</html>