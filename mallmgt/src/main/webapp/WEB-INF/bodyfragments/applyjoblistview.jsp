<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style><%@include file="/WEB-INF/css/movielistview.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>

<body>

<div class="container content">
<h2 style="padding-top: 30px;padding-bottom: 20px;">Job Applications</h2>
</div>

<div class="container content">
<%@include file="businessMessage.jsp" %>
<table class="table bg-light text-dark">
  <thead>
    <tr>
      <th scope="col">Job Name</th> 
      <th scope="col">Applicant Name</th> 
      <th scope="col">Contact Number</th>
      <th scope="col">Email</th>
      <th scope="col">Experience</th>
      <th scope="col">Resume</th>
       <th scope="col">Status</th>
        <c:choose>
      <c:when test="${sessionScope.user.userRole=='Admin'}"> 
      <th scope="col">Action</th>
      </c:when></c:choose>      
    </tr>
  </thead>
  <tbody>
  
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr> 
      <td>${li.jobName}</td>
      <td>${li.name}</td>
      <td>${li.phoneNumber}</td>
      <td>${li.email}</td>
      <td>${li.experience}</td>
      <td>
      
      <a href="${pageContext.request.contextPath}//getResume/${li.id}" class="btn btn-accept" >Resume</a> 
      
      </td>
      <td>${li.status}</td>
  <c:choose>
      <c:when test="${sessionScope.user.userRole=='Admin'}">  
       <td> 
      <a href="${pageContext.request.contextPath}/accpetJobApplication?id=${li.id}" class="btn btn-accept" >Accept</a>   
      <a href="${pageContext.request.contextPath}/rejectJobApplication?id=${li.id}" class="btn btn-danger">Reject</a> 
      </td>
      </c:when>
      <c:otherwise>      
      </c:otherwise>       
      </c:choose> 

    </tr>
   </c:forEach>
  </tbody>
</table>

</div>

</body>
</html>