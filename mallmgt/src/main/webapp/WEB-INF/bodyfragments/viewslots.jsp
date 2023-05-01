<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<style><%@include file="/WEB-INF/css/viewslots.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body >

<div class="container content" >

<h2 style="padding-top: 30px">Slots</h2>
<%@include file="businessMessage.jsp" %>
<!--<table class="table">
  <thead>
    <tr>
      <th scope="col">Slots</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr>     
      <td><span>Slot </span> ${li.slot}</td>
      <c:choose>
      <c:when test="${li.status == true}">
      <td class="bg-success">Available</td>   
        
      </c:when>     
      <c:otherwise>
      <td class="bg-danger">Booked</td>
      <c:if test="${sessionScope.user.userRole == 'Admin'}">
      <td><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}">Mark It Available</a></td>
      </c:if>
      </c:otherwise> 
      </c:choose>

    </tr>
   </c:forEach>
  </tbody>
</table>
  -->
  <div style="margin-left: 139px;">
<img src="https://i.ibb.co/H42WcPP/Copy-of-Regel-Cinemas-2.png" alt="Shop-Map" border="0" style="width: 90%;height: 80%;">
<c:choose>
<c:when test="${sessionScope.user.userRole == 'Admin'}">
<c:forEach items="${list}" var="li" varStatus="u">
<div style="margin-top: -393px;margin-left: 144px;width: fit-content;">
<c:if test="${li.slot == 1 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="height: 35px;width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 1 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 413px;margin-left: 144px;position: absolute;">
<c:if test="${li.slot == 2 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 2 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 465px;margin-left: 144px;position: absolute;">
<c:if test="${li.slot == 3 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 3 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 518px;margin-left: 144px; position: absolute;">
<c:if test="${li.slot == 4 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 4 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 564px;margin-left: 144px; position: absolute;">
<c:if test="${li.slot == 5 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 5 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 610px;margin-left: 144px; position: absolute;">
<c:if test="${li.slot == 6 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 6 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 656px; margin-left: 144px; position: absolute;">
  <c:if test="${li.slot == 7 && li.status == true}">
    <a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
  </c:if>
  <c:if test="${li.slot == 7 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 358px; margin-left: 397px; position: absolute;">
  <c:if test="${li.slot == 8 && li.status == true}">
    <a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
  </c:if>
  <c:if test="${li.slot == 8 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>


<div style="margin-top: 414px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 9 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 9 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 470px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 10 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 10 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

<div style="margin-top: 515px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 11 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 11 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

<div style="margin-top: 561px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 12 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 12 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 609px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 13 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 13 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 358px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 14 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 14 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 414px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 15 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 15 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 467px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 16 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 16 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 516px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 17 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 17 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 564px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 18 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 18 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

<div style="margin-top: 609px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 19 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 19 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 355px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 20 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 20 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

<div style="margin-top: 412px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 21 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 21 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 467px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 22 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 22 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 516px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 23 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 23 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 565px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 24 && li.status == true}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 24 && li.status == false}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/updateslot?id=${li.id}" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

</c:forEach>
</c:when>
<c:otherwise>
<c:forEach items="${list}" var="li" varStatus="u">
<div style="margin-top: -393px;margin-left: 144px;width: fit-content;">
<c:if test="${li.slot == 1 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="height: 35px;width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 1 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 413px;margin-left: 144px;position: absolute;">
<c:if test="${li.slot == 2 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 2 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 465px;margin-left: 144px;position: absolute;">
<c:if test="${li.slot == 3 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 3 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 518px;margin-left: 144px; position: absolute;">
<c:if test="${li.slot == 4 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 4 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 564px;margin-left: 144px; position: absolute;">
<c:if test="${li.slot == 5 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 5 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 610px;margin-left: 144px; position: absolute;">
<c:if test="${li.slot == 6 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 6 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 656px; margin-left: 144px; position: absolute;">
  <c:if test="${li.slot == 7 && li.status == true}">
    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
  </c:if>
  <c:if test="${li.slot == 7 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 358px; margin-left: 397px; position: absolute;">
  <c:if test="${li.slot == 8 && li.status == true}">
    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
  </c:if>
  <c:if test="${li.slot == 8 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>


<div style="margin-top: 414px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 9 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 9 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 470px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 10 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 10 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

<div style="margin-top: 515px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 11 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 11 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

<div style="margin-top: 561px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 12 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 12 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 609px; margin-left: 397px; position: absolute;">
<c:if test="${li.slot == 13 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 13 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 358px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 14 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 14 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 414px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 15 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 15 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 467px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 16 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 16 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 516px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 17 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 17 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 564px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 18 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 18 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

<div style="margin-top: 609px;
    margin-left: 490px;
    position: absolute;">
<c:if test="${li.slot == 19 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 19 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 355px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 20 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 20 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

<div style="margin-top: 412px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 21 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 21 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 467px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 22 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 22 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="margin-top: 516px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 23 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 23 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>
<div style="
    margin-top: 565px;
    margin-left: 717px;
    position: absolute;">
<c:if test="${li.slot == 24 && li.status == true}">
<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/bookBySlotById?slotId=${li.id}" style="width: fit-content;color: green;"> Book ${li.slot}</a> 
</c:if>
<c:if test="${li.slot == 24 && li.status == false}">
<a class="nav-link active" aria-current="page" href="#" style="width: fit-content;color:red;"> Book ${li.slot}</a> 
</c:if>
</div>

</c:forEach>
</c:otherwise>
</c:choose>
  </div>
</div>

</body>
</html>