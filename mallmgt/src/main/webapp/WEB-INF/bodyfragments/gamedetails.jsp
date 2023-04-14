<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align : center; margin-top:40px">${game.gameName}</h1>
<div class="d-flex  align-items-center" >


<img alt="" src="${pageContext.request.contextPath}/getGameImage/${game.id}" class="card-img-top" style="width:400px ;height: 400px; margin-left: 50px">
<div style="margin-left:50px">
<h5 class="text-dark mb-0" style="margin-top: 20px">PRICE: $ ${game.pricePerHour} </h5>
<h5 class="text-dark mb-0" style="margin-top: 20px; margin-right:20px;  text-align: justify;
  text-justify: inter-word;">INSTRUCTIONS: ${game.instructions}</h5>
</div>
</div>
</body>
</html>