<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션 - 예약 목록 보기</title>
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
			<div class="container mt-2">
				<h1 class="text-center">예약 목록 보기</h1>
				
				<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="one" items="${result}">
						<tr>
							<td>${one.name}</td>
							<td>
								<fmt:formatDate value="${one.date}" pattern="yyyy년 MM월 dd일" />
							</td>
							<td>${one.day}</td>
							<td>${one.headcount}</td>
							<td>${one.phoneNumber}</td>
							<td>
								<c:choose>
									<c:when test="${one.state eq '대기중'}">
										<span class="text-info">${one.state}</span>
									</c:when>
									<c:when test="${one.state eq '확정'}">
										<span class="text-success">${one.state}</span>
									</c:when>
									<c:otherwise>
										<span class="text-success">${one.state}</span>
									</c:otherwise>
								</c:choose>
							</td>
							<td><button type="button" class="btn btn-danger btn-delete" data-booking-id="${one.id}">삭제</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
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
			$('.btn-delete').on('click', function() {
				let id = $(this).data('booking-id');
				//alert(id);
				
				$.ajax({
					type:"delete"
					, url:"/lesson06/booking/del_booking"
					, data:{"id":id}
					
					,success:function(data) {
						if (data.code == 1) {
							location.reload(true);
						} else {
							alert(data.result);
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