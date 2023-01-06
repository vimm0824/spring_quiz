<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
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
			<input type="text" id="name" class="form-control col-10" placeholder="사이트 제목을 입력하세요.">
		</div>
		
		<div class="mt-2">
			<label for="url">주소</label>
			<div class="d-flex">
				<input type="text" id="url" class="form-control col-9" placeholder="사이트 주소를 입력하세요.">
				<input type="button" id="urlStatusBtn" class="btn btn-info" value="중복확인">
			</div>
			<small id="urlStatusArea"></small>
		</div>
		
		<input type="button" id="save" class="btn btn-success col-10 mt-4" value="추가">
	</div>
	
	<script>
		$(document).ready(function() {
			$('#urlStatusBtn').on('click', function() {
				let url = $('#url').val().trim();
				if (url.length < 1) {
					alert("사이트 주소를 입력하세요.");
					return;
				}
				
				if (url.startsWith("http") == false && url.startsWith("https") == false) {
					alert("주소 형식이 잘못되었습니다.");
					return;
				}
				$('#urlStatusArea').empty();
				
				$.ajax({
					type:"post"
					, url:"/lesson06/quiz01/is_duplication"
					, data:{"url":url}
				
					, success:function(data) {
						if (data.is_duplication > 0) {
							$('#urlStatusArea').append('<span class="text-danger">중복된 url입니다.</span>');
						} else {
							$('#urlStatusArea').append('<span class="text-info">추가 가능한 url입니다.</span>');
						}
					}
					, error:function(e) {
						alert("에러 " + e);
					}
				})
			});
			
			
			$('#save').on('click', function() {

				let name = $('#name').val().trim();
				if (name.length < 1) {
					alert("사이트 이름을 입력하세요.");
					return;
				}
				
				let url = $('#url').val().trim();
				if (url.length < 1) {
					alert("사이트 주소를 입력하세요.");
					return;
				}
				
				if (url.startsWith("http") == false && url.startsWith("https") == false) {
					alert("주소 형식이 잘못되었습니다.");
					return;
				}
				
				$.ajax({	
					// call back 함수 (무언가를 하고 기다렸다가 응답값을 주는것 => Request + Response)
					
					// Request
					type:"POST"
					, url:"/lesson06/quiz01/add_bookmark"
					, data:{"name":name, "url":url}
				
					// Response
					, success:function(data) {	// String json => object
						// alert(data);
						if (data.result == "성공") {
							location.href = "/lesson06/quiz01/bookmark_view";
						}
					}
					,error:function(e) {
						alert("error" + e);
					}
					
				});
			});
		});
	</script>
</body>
</html>