<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	int row = (Integer)request.getAttribute("row");
	int column = (Integer)request.getAttribute("column");
	int price = (Integer)request.getAttribute("price");
	String timeId = (String)request.getAttribute("timeId");
	
	pageContext.setAttribute("row",row);
	pageContext.setAttribute("column", column);
	pageContext.setAttribute("price", price);
	pageContext.setAttribute("timeId",timeId);
%>
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
        * {
            width: 100%;
            margin: 0;
            background-color: rgb(14, 11, 31);
        }

        .container {
            position: absolute;
            line-height: 50px;
            text-align: center;
            width: 45%;
            left: 10%;
            top: 5%;
        }

        th {
            border: 1px solid whitesmoke;
            margin: 0;
            color: whitesmoke;
            font-size: 30px;
        }

        tr>td {
            width: 5%;
            height: 40px;
            border: 1px solid whitesmoke;
            color: whitesmoke;
            font-size: 25px;
            cursor: pointer;
        }

        .seat:hover {
            background-color: aqua;
        }

        .test {
            background-color: red;
        }
        
        .reserved {
        	background-color: pink;
        	pointer-events: none;
        }


        /*check*/
        .check {
            position: absolute;
            line-height: 300px;
            text-align: center;
            width: 30%;
            right: 15%;
            top: 5%;
        }

        .chkseat {
            line-height: 100px;
        }

        /*reserve*/
        .reserveBtn {
            position: absolute;
            width: 10%;
            right: 15%;
            bottom: 15%;
        }

        #reserve {
            height: 50px;
            text-align: center;
            background-color: aliceblue;
            cursor: pointer;
        }
    </style>
</head>
<body>
	   <div class="container">
        <table>
            <tbody>
                <thead>
                    <th colspan="14">SCREEN</th>
                </thead>
                	<%
                		for(int i=0; i< row; i++ ){
                	%>
	                <tr>
	                	<%
	                		for(int j=0; j<column; j++ ){
	                	%>
	                    <td class="seat" id="<%=(char)(i+65)%>-<%=j+1%>"><%=(char)(i+65)%>-<%=j+1%></td>
	                    <%
	                		}
	                	%>
	                </tr>
	                <%
                		}	                
	                %>
            </tbody>
        </table>
    </div>

    <div class="check">
        <div class="chkseat">
            <table>
                <tbody>
                    <tr>
                        <td>좌석 선택</td>
                    </tr>
                    <tr>
                        <td class="chkSeat"></td>
                    </tr>
                    <tr>
                        <td>관람 인원</td>
                    </tr>
                    <tr>
                        <td class="numSeat"></td>
                    </tr>
                     <tr>
                        <td>총 가격</td>
                    </tr>
                    <tr>
                        <td class="totalPrice"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="reserveBtn">
        <input id="reserve" value="예매하기" readonly="readonly">
        <input type="hidden" value="<%=price%>" id="price">
        <input type="hidden" value="<%=timeId%>" id="timeId">
        <input type="hidden" value="${seat}" id="seat">
    </div>

    <!--javaScript-->
    <script type="text/javaScript">
        $(function(){
            var seat = $("#seat").val();
            var seatSplit = seat.split(",");
			
            for(var i in seatSplit){    
                for(var j in $(".seat")){
					if($(".seat")[j].id == seatSplit[i]){
						console.log("dd = "+$(".seat")[j].id);
						var reservedId = $(".seat")[j].id;
						console.log(reservedId);
						var checkBox = document.getElementById(reservedId).className += ' reserved';
						console.log(checkBox);
						//document.getElementById('ex').className = 'foo'
					}
                }
            }
                        
            var price = $("#price").val();
            var timeId = $("#timeId").val();
            var arr = [];
 
            $(".seat").hover(function(event){
                $(this).click(function(event){
                    if($(this).hasClass("test")){
                        $(this).removeClass("test");
                        for(let i = 0; i < arr.length; i++){
							if(arr[i] === $(this).text()){
                            	arr.splice(i,1);
							}
                        }
                    }else{
                        $(this).addClass("test");
	                    arr.push($(this).text());
                    }
	                $(".chkSeat").text(arr);
	                $(".numSeat").text(arr.length+"명");
	                $(".totalPrice").text(price * arr.length + "원");
	            
                });
            });

			$("#reserve").click(function(){

				var seat = $(".chkSeat").text();
				var peopleNum = arr.length;
				var totalPrice = price * arr.length;

				 if (confirm('좌석 = '+seat+
						 	 '\n인원 = '+peopleNum+'명'+
						 	 '\n총가격 = '+totalPrice + '원'+
						 	 '\n예매하시겠습니까?')) {
					 location.href = "${ pageContext.request.contextPath }/reserve/reserveInfo.do?seat="+seat+"&peopleNum="+peopleNum+
					 					"&totalPrice="+totalPrice+"&timeId="+timeId;
	            }
			});
        });
    </script>
</body>
</html>