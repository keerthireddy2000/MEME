<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<style><%@include file="/WEB-INF/css/gamedetails.css"%></style>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align : center; margin-top:40px">${game.gameName}</h1>
<div class="d-flex  align-items-center" >

<iframe width="560" height="315"  src="https://www.youtube.com/embed/${game.videoLink}" frameborder="0" allowfullscreen class="card-img-top" style="width:400px ;height: 400px; margin-left: 50px"></iframe>
<div style="margin-left:50px">
<h5 class="text-dark mb-0" style="margin-top: 20px">PRICE: $ ${game.pricePerHour} </h5>
<h5 class="text-dark mb-0" style="margin-top: 20px; margin-right:20px;  text-align: justify;
  text-justify: inter-word;">INSTRUCTIONS: ${game.instructions}</h5>
</div>
</div>
</body>
</html>