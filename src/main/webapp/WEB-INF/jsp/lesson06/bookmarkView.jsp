<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="mark" items="${result}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${mark.name}</td>
					<td><a href="${mark.url}" class="text-secondary">${mark.url}</a></td>
					<td><button type="button" class="btn btn-danger delete-btn" value="${mark.id}">삭제</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="http://localhost:8080/lesson06/quiz01/add_bookmark_view" class="btn btn-info col-12">추가하기</a>
	</div>
	
	<script>
		$(document).ready(function() {
			$('.delete-btn').on('click', function() {
				let id = ;
				alert(id);
			});
		});
	</script>
</body>
</html>











