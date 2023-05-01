<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<style><%@include file="/WEB-INF/css/seatview.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body >

<div class="container" >
<h2 style="padding-top: 30px; margin-bottom: 20px;">Seats for: <span>${bean.title}</span></h2>
<%@include file="businessMessage.jsp" %>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Seat</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr>     
      <td><span>Seat </span> ${li.seat}</td>
      <c:choose>
      <c:when test="${li.status =='Available'}">
      <td>
       <input class="form-check-input" type="checkbox" value=""  disabled="disabled">
      </td>   
      </c:when>     
      <c:otherwise>
      <td>
       <input class="form-check-input" type="checkbox" value="" checked="checked" disabled="disabled">
    </td>
      <c:if test="${sessionScope.user.userRole == 'Admin'}">
      <td><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateSeat?id=${li.id}&movieId=${bean.id}">Mark It Available</a></td>
      </c:if>
      </c:otherwise> 
      </c:choose>

    </tr>
   </c:forEach>
  </tbody>
</table>

</div>



</body>
</html>