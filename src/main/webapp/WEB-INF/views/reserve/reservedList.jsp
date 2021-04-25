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
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
<title>예매 완료 확인</title>

<style>
    html {
        height: 100%;
    }

    body {
        width: 100%;
        height: 100%;
        background-color: rgb(136, 211, 182);
    }

    .container {
        display: inline;
        margin: 0 auto;
        width: 100%;
        padding-bottom: 40px;
    }

    .title {
        text-align: center;
        padding-top: 80px;
    }

    .card {
        margin: 70px;
        display: inline-block;
    }
    
    #movie{
    	position: absolute;
    	top: 10px;
    	left: 10px;
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
    <h1 class="title">01048179843님의 예매내역</h1>
    <div class="container">
	
	    <c:forEach items="${reserveTimeList}" var="rt">
	        <div class="card align-middle" style="width:20rem; border-radius:20px;">
	            <div class="card-title" style="margin-top:30px;">
	                <h2 class="card-title text-center" style="color:#113366;">예매번호(${rt.reserveId})</h2>
	            </div>
	            <div class="card-body form-signin">
                    <h5 class="form-signin-heading">좌석번호</h5>
                    <input type="text" id="seat" class="form-control" placeholder="${rt.seat}" readonly><BR>
                    <h5 class="form-signin-heading">총 금액</h5>
                    <input type="text" id="totalPrice" class="form-control" placeholder="${rt.totalPrice}원" readonly><BR>
                    <h5 class="form-signin-heading">상영관</h5>
                    <input type="text" id="totalPrice" class="form-control" placeholder="${rt.space}" readonly><BR>
                    <h5 class="form-signin-heading">영화제목</h5>
                    <input type="text" id="totalPrice" class="form-control" placeholder="${rt.title}" readonly><BR>
                    <h5 class="form-signin-heading">상영시작시간</h5>
                    <input type="text" id="totalPrice" class="form-control" placeholder="${rt.startTime}" readonly><BR>
                    <h5 class="form-signin-heading">관람 인원</h5>
                    <input type="text" id="peopleNum" class="form-control" placeholder="${rt.peopleNum}명" readonly><BR>
	         	</div>
	        </div>
	    </c:forEach>
    
    </div>
    
    <input type="button" value="영화예매하기" id="movie">
    
    <script type="text/javascript">
		$("#movie").click(function(){
			location.href='${ pageContext.request.contextPath }/';
		});

    </script>	
</body>
</html>