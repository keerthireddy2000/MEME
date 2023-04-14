<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<style><%@include file="/WEB-INF/css/moviebookingviewlist.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body >

<div class="container content" >

<h2 style="padding: 30px">Movie Booking History</h2>
<%@include file="businessMessage.jsp" %>
<table class="table bg-light text-dark">
  <thead>
    <tr>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Email</th>     
      <th scope="col">Total Price</th>
      <th scope="col">Movie Title</th>
     <th scope="col">Date</th>
     <th scope="col">Time</th>
     <th scope="col">Ticket</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr>     
      <td>${li.firstName}</td>
      <td>${li.lastName}</td>
      <td>${li.email}</td>
      <td>${li.price}</td>
      <td>${li.title}</td>
      <td>${li.date}</td>
      <td>${li.showTime}</td>
      <td><a href="${pageContext.request.contextPath}/viewBookedTicket?id=${li.id}" >View Ticket</a></td>
    </tr>
   </c:forEach>
  </tbody>
</table>

</div>

</body>
</html>