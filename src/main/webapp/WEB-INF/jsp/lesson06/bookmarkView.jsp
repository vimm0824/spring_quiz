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
				<c:forEach var="bookmark" items="${result}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${bookmark.name}</td>
					<td><a href="${bookmark.url}" class="text-secondary">${bookmark.url}</a></td>
					<td>
						<%-- 1)  --%>
						<%-- <button type="button" class="btn btn-danger delete-btn" value="${mark.id}">삭제</button> --%>
						<%-- 2) data를 이용해서 태그에 임시 저장하기 --%>
						<%-- 주의: 대문자 사용 불가 --%>
						<button type="button" class="btn btn-danger delete-btn" data-bookmark-id="${bookmark.id}">삭제</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="http://localhost:8080/lesson06/quiz01/add_bookmark_view" class="btn btn-info col-12">추가하기</a>
	</div>
	
	<script>
		$(document).ready(function() {
			$('.delete-btn').on('click', function(e) {
				// 방법 1
				//let id = $(this).val();
				//let id = $(this).attr('value');
				
				// 방법 2(강의: e => 클릭된 객체의 정보(function(e) -- e 필수))
				//let id = e.target.value;
				
				// 방법 3(강의: data를 이용해서 태그에 임시 저장하기)
				// 태그: data-bookmark-id		data-뒤에 우리가 이름을 정한다(대문자 사용불가)
				// 스크립트: $(this).data('bookmark-id');
				
				let id = $(this).data('bookmark-id');
				
				$.ajax({
					type:"delete"
					, url:"/lesson06/quiz01/delete_bookmark_view"
					, data: {"id":id}
				
					, success:function(data) {
						if (data.code == 1) {
							// 성공
							location.reload(true);
						} else if (data.code == 500) {
							// 에러
							alert(data.error_message);
						}
						// location.href => 이거로 새로고침하면 스크롤이 다시 맨위로 올라감
						// location.href = "/lesson06/quiz01/bookmark_view";
						
						// 혹시 location.reload() =error> + window. , + document.
						// location.reload();
					}
					, error:function(e) {
						alert("에러" + e);
					}
				});
			});
		});
	</script>
</body>
</html>











