<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"	crossorigin="anonymous"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		
		<div>
			<label for="name">제목</label>
			<input type="text" id="name" name="name" class="form-control col-8" placeholder="사이트 제목을 입력하세요.">
		</div>
		<div>
			<label for="url">주소</label>
			<input type="text" id="url" name="url" class="form-control col-8" placeholder="사이트 주소를 입력하세요.">
		</div>
		<input type="button" id="save" class="btn btn-success col-8 mt-4" value="추가">
	</div>
	
	<script>
		$(document).ready(function() {
			$('#save').on('click', function() {
				// alert("asdf");
				let name = $('#name').val().trim();
				if (name.length < 1) {
					alert("사이트 이름를 입력하세요.");
					return;
				}
				
				let url = $('#url').val().trim();
				if (url.length < 1) {
					alert("사이트 주소를 입력하세요.");
					return;
				}
				
				$.ajax({
					// Request
					type:"POST"
					, url:"/lesson06/quiz01/add_bookmark"
					, data:{"name":name, "url":url}
				
					// Response
					, success:function(data) {
						alert(data);
						location.href = "/lesson06/quiz01/bookmark_view";
					}
					,error:function(e) {
						alert("error");
					}
				});
			});
		});
	</script>
</body>
</html>