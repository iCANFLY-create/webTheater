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
<title>Insert title here</title>
<style>
	.title {
	         text-align: center;
	         margin: 50px;
	     }
	
	     .movies {
	         margin: 0 auto;
	         position: absolute;
	         left: 18%;
	     }
	
	     .movie {
	         display: inline-block;
	         width: 400px;
	         height: 700px;
	         background-color: pink;
	         margin: 10px;
	     }
	
	     .movie>h1 {
	         text-align: center;
	     }
	
	     .movie>img {
	         width: 100%;
	         height: 80%;
	     }
	
	     .movie>input {
	         height: 30px;
	         margin: 5px;
	     }
</style>
</head>
<body>
	<div class="container">
	  <h1 class="title">영화예매</h1>
	  <div class="movies">
	      <div class="movie movie1">
	          <h1>1관</h1>
	          <img src="${ pageContext.request.contextPath }/resources/images/3.jpg" alt="">
	          <c:forEach items="${movietimeList}" var="mt" varStatus="vs">
		          <c:if test="${mt.movieId == 1}">
			          <input type="button" value="${mt.startTime}" id="${mt.timeId}" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${mt.timeId}">
		          </c:if>
	          </c:forEach>
	      </div>
	      <div class="movie movie2">
	          <h1>2관</h1>
	          <img src="${ pageContext.request.contextPath }/resources/images/2.jpg" alt="">
	          <c:forEach items="${movietimeList}" var="mt" varStatus="vs">
		          <c:if test="${mt.movieId == 2}">
			          <input type="button" value="${mt.startTime}" id="${mt.timeId}" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${mt.timeId}">
		          </c:if>
	          </c:forEach>
	      </div>
	      <div class="movie movie3">
	          <h1>3관</h1>
	          <img src="${ pageContext.request.contextPath }/resources/images/1.jpg" alt="">
	          <c:forEach items="${movietimeList}" var="mt" varStatus="vs">
		          <c:if test="${mt.movieId == 3}">
			          <input type="button" value="${mt.startTime}" id="${mt.timeId}" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${mt.timeId}">
		          </c:if>
	          </c:forEach>
	      </div>
	  </div>
	</div>
	
	<!-- Modal -->
	<c:forEach items="${movietimeList}" var="mt" varStatus="vs">
	    <div class="modal fade" id="exampleModal${mt.timeId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">영화 예매</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
		                <ul class="list-group list-group-flush">
	                        <li class="list-group-item">
	                            <h5>상영관 : ${mt.space}</h5>
	                        </li>
	                        <li class="list-group-item">
	                            <h5>상영작: ${mt.title}</h5>
	                        </li>
	                        <li class="list-group-item">
	                            <h5>상영시간 : ${mt.startTime}</h5>
	                        </li>
	                        <li class="list-group-item">
	                            <h5>남은좌석 : ${mt.totalSeat - mt.reservedSeat}/${mt.totalSeat}</h5>
	                        </li>
	                    </ul>
	                </div>
	                <div class="modal-footer">
	                	<input type="hidden" name="timeId" value="${mt.timeId}">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                    <button type="button" class="btn btn-primary" onclick="seat(${mt.timeId});">좌석 선택하기</button>
	                </div>
	            </div>
	        </div>
	    </div>
    </c:forEach>
    <!-- /Modal -->

<!-- javaScript -->    
<script type="text/javascript">
	function seat(num){
		console.log(num);
		location.href="${pageContext.request.contextPath }/movie/seatForm.do?timeId="+num;
	}
</script>
</body>
</html>