<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>로그인 폼</title>
<title>예약 확인 정보</title>
<style>
html {
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 80px;
	padding-bottom: 40px;
}

.card {
	margin: 0 auto;
	float: none;
	margin-bottom: 10px;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}
</style>
</head>
<body>
	<div class="card align-middle"
		style="width: 20rem; border-radius: 20px;">
		<div class="card-title" style="margin-top: 30px;">
			<h2 class="card-title text-center" style="color: #113366;">예약정보
				확인</h2>
		</div>
		<div class="card-body">
			<form method="POST" action="${ pageContext.request.contextPath }/reserve/chkReserve.do">
				<h5 class="form-signin-heading">핸드폰 번호를 입력하세요</h5>
				<label for="inputEmail" class="sr-only">Your Phone</label> 
				<input
					type="tel" id="phone" name="phone" class="form-control" placeholder="Your Phone"
					required autofocus><BR>
				<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
					type="submit">예매 정보 확인</button>
			</form>
		</div>
	</div>
</script>
</body>
</html>