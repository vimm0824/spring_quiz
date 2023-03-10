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
				<li class="nav-item"><a href="/lesson06/booking/insert_booking_view" class="nav-link text-white">예약하기</a></li>
				<li class="nav-item"><a href="/lesson06/booking/booking_view" class="nav-link text-white">예약목록</a></li>
			</ul>
		</nav>
		<div class="contents">
			<div class="banner">
				<img alt="배너" src="/img/booking/banner1.jpg" id="bannerImage" width="1110">
			</div>
			<div class="d-flex bottom">
				<div class="col-4 left-right h-100 d-flex justify-content-center align-items-center">
					<div>
						<div class="display-3 text-white">실시간</div>
						<div class="display-3 text-white">예약하기</div>
					</div>
				</div>
				<div class="col-4 login">
					<div class="container mt-4">
						<div class="text-white h3">예약확인</div>
						<div class="d-flex justify-content-center align-items-center mt-3">
							<div class="mt-4">
								<div class="ml-4">
									<label for="name"><span class="text-white">이름:</span></label>
								</div>
								<div class="mt-3">
									<label for="phoneNumber"><span class="text-white">전화번호:</span></label>
								</div>
							</div>
							<div class="mt-3 ml-2">
								<div>
									<input type="text" id="name" class="form-control">
								</div>
								<div class="mt-3">
									<input type="text" id="phoneNumber" class="form-control">
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-end mt-3">
							<input type="button" id="btn-check" class="btn btn-success" value="조회하기">
						</div>
					</div>
				</div>
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
			<div class="text-secondary m-3">
				<div><small>제주특별자치도 제주시 애월읍</small></div>
				<div><small>사업자등록번호:111-222-55555/농어촌민박사업장/대표:김통목</small></div>
				<div><small>Copyright 2025 © tongnamu. All Right reserved</small></div>
			</div>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			
			let bannerSrcArr = ['/img/booking/banner1.jpg', '/img/booking/banner2.jpg',
				'/img/booking/banner3.jpg', '/img/booking/banner4.jpg'];
            let currentIndex = 0;
            setInterval(function() {
                $('#bannerImage').attr('src', bannerSrcArr[currentIndex]);
                currentIndex++;

                if (currentIndex > bannerSrcArr.length) { // 인덱스 값이 배열의 크기를 넘으면 0으로(처음 이미지) 세팅
                    currentIndex = 0;
                }
            }, 3000); // 3초에 한번씩 함수 실행
			
			$('#btn-check').on('click', function() {
				let name = $('#name').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();
				
				if (name.length < 1) {
					alert("이름을 입력하세요.");
					return;
				}
				if (phoneNumber.length < 1) {
					alert("전화번호를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/lesson06/booking/check_booking"
					, data:{"name":name, "phoneNumber":phoneNumber}
				
					,success:function(data) {
						if (data.code == 1) {
							alert("이름: " + data.result.name + 
									"\n날짜: " + data.result.date.slice(0, 10) + 
									"\n일수: " + data.result.day +
									"\n인원: " + data.result.headcount +
									"\n상태: " + data.result.state);
						} else {
							alert("예약된 항목이 없습니다.");
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