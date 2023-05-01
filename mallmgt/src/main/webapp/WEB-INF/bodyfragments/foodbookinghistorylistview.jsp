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
<title>Food Booking List</title>
</head>
<body >

<div class="container content" >

<h2 style="padding: 30px">Food Booking</h2>
<%@include file="businessMessage.jsp" %>
<table class="table bg-light text-dark">
  <thead>
    <tr>
     <th scope="col">Token No.</th>
      <th scope="col">Food Name</th>
      <th scope="col">Food Price</th>
      <th scope="col">Stall Name</th>     
     <!--   <th scope="col">Payment Status</th> -->
      <th scope="col">Order By</th>
      <th scope="col">Order Status</th>
     <th scope="col">Delivery Status</th>
      
    <c:if test="${sessionScope.user.userRole=='Admin' || sessionScope.user.userRole=='FoodAdmin'}">
     <th scope="col">Mark AS</th>
     <th scope="col">Action</th>
     </c:if>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr>  
      <td>${li.id}</td>   
      <td>${li.foodName}</td>
      <td>${li.foodPrice}</td>
      <td>${li.stallName}</td>
    <!--  <td>${li.paymentStatus}</td>  --> 
     
       <td>${li.orderby}</td>
       <td>${li.status}</td>
        <td>${li.deliveryStatus}</td>
      <c:if test="${sessionScope.user.userRole=='Admin' || sessionScope.user.userRole=='FoodAdmin'}">
      <td><a href="${pageContext.request.contextPath}/updateDeliveryStatus?id=${li.id}">Ready To Pick</a></td>
      <td>
       <a href="${pageContext.request.contextPath}/acceptFoodBooking?id=${li.id}" class="btn btn-primary btn-sm">Accept</a>
       <a href="${pageContext.request.contextPath}/rejectFoodBooking?id=${li.id}" class="btn btn-secondary btn-sm">Reject</a>
      </td>
      </c:if>
      
    </tr>
   </c:forEach>
  </tbody>
</table>

</div>

</body>
</html>