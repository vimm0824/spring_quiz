<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/lesson05/style2.css">
</head>
<body>
	<div id="wrap" class="container">
			<header class="bg-info">
				<div class="p-2">
					<h1 class="text-white">배탈의 민족</h1>
				</div>
			</header>
			<div class="contents">
				<div class="container">
					<h1>우리동네 가게</h1>
					<c:forEach var="store" items="${stores}">
						<div class="rounded col-12 border border-info content-box mb-3">
							<div class="mt-2">
								<a href="" class="h4 font-weight-bold">${store.name}</a>
								<div><small class="font-weight-bold">전화번호 : ${store.phoneNumber}</small></div>
								<div><small class="font-weight-bold">주소 : ${store.address}</small></div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<footer class="border-top">
				<div class="mt-4">
					<h4>(주)우와한형재</h4>
					<div class="font-weight-light text-secondary"><small>고객센터:1500-1500</small></div>
				</div>
			</footer>
	</div>
</body>
</html>