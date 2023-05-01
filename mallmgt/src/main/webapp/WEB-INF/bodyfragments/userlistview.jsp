<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style><%@include file="/WEB-INF/css/userlistview.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body >

<div class="container content" >
<div style="display:flex; flex-direction: row;">
<div>
<h2 style="padding-top: 30px;padding-bottom: 20px;">Users List</h2>
</div>
<div style="margin-top: 40px;">
<c:choose>
     <c:when test="${sessionScope.user.userRole == 'Admin'}">
     <a href="${pageContext.request.contextPath}/registration" style="background-color:black; color: white; border-radius: 5px; padding: 8px; margin-left: 1101px; text-decoration:none;">Add User</a>
     </c:when>
 </c:choose>   
</div>
</div>
<%@include file="businessMessage.jsp" %>
<table class="table bg-light text-dark" style="margin-top: 10px;">
  <thead>
    <tr>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone Number</th>
      <th scope="col">Date of Birth</th>      
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr>     
      <td>${li.firstName}</td>
      <td>${li.lastName}</td>
      <td>${li.email}</td>
      <td>${li.phoneNumber}</td>
      <td>${li.dob}</td>
      <td>      
      <a href="${pageContext.request.contextPath}/userEdit?id=${li.id}"><i class="fas fa-pen"></i></a>
      <a href="${pageContext.request.contextPath}/userDelete?id=${li.id}"><i class="fas fa-trash"></i></a>      
      </td>
    </tr>
   </c:forEach>
  </tbody>
</table>

</div>

</body>
</html>