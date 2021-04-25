<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
<%-- RedirectAttributes에 등록된 msg값 존재여부 확인 후 출력 --%>
<c:if test="${ not empty msg2 }">
	alert('${ msg2 }');
</c:if>
</script>

<style>
    * {
        margin: 0;
        background-color: antiquewhite;
    }

    h1 {
        margin-top: 40px;
        font-size: 80px;
        text-align: center;
        color: rgb(104, 89, 56);
    }

    .container {
        position: absolute;
        left: 25%;
        top: 20%;
    }

    div {
        display: inline;
    }

    .chk_reserved_btn {
        width: 500px;
        height: 500px;
        background-color: rgb(150, 199, 195);
        font-size: 50px;
    }

    .reserve_btn {
        width: 500px;
        height: 500px;
        background-color: rgb(170, 128, 226);
        font-size: 50px;
    }
</style>
</head>
<body>
	<h1>Movie Theater</h1>
	<div class="container">
		<!--예매내역 확인-->
		<div class="chk_reserved">
			<button type="button" class="chk_reserved_btn" onclick="check();">예매내역 확인</button>
		</div>
		<!--영화예매-->
		<div class="reserve">
			<input type="button" class="reserve_btn" value="영화예매" onclick="showMovie();">
		</div>
	</div>

<!-- javaScript -->	
<script type="text/javascript">
function check(){
	window.location.href="${pageContext.request.contextPath}/reserve/chkReserveForm.do";
}

function showMovie(){
	window.location.href="${pageContext.request.contextPath}/movie/showMovieForm.do";
}
</script>	

</body>
</html>