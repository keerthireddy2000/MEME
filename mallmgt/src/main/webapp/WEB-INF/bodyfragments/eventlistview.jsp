<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<style><%@include file="/WEB-INF/css/moviegrid.css"%></style>

 <section style="background-color: white;">
<div style="display:flex; flex-direction: row;margin-left: 183px;">
<div>
<h2 style="padding-top: 30px;padding-bottom: 20px;">Events List</h2>
</div>
<div style="margin-top: 35px;">
<c:choose>
     <c:when test="${sessionScope.user.userRole == 'Admin'}">
     <a href="${pageContext.request.contextPath}/event" style="background-color:black; color: white; border-radius: 5px; padding: 8px; margin-left: 915px; text-decoration:none;">Add Event</a>
     </c:when>
 </c:choose>   
</div>
</div>
<%@include file="businessMessage.jsp" %>
  <div class="container py-3 content">
  <div class="row">
  
    <c:forEach items="${list}" var="li" varStatus="u">
    <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">	
        <div class="card">
          <div class="d-flex justify-content-between p-3">
            <p class="lead mb-0" style="font-weight: bold;">Event Name: ${li.eventName}</p>
          </div>
          <img alt="" src="${pageContext.request.contextPath}/getEventImage/${li.id}" class="card-img-top" height="300px">
          <div class="card-body">

          <!--   <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Theater Number</h5>
              <h5 class="text-dark mb-0">$ ${li.theatreNumber} </h5>
            </div> -->

            <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Venue</h5>
              <h5 class="mb-0" style="font-weight:normal;">${li.venue}</h5>
            </div>
            
             <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Event Type</h5>
              <h5 class=" mb-0" style="font-weight:normal;">${li.type}</h5>
            </div>
            
             <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Date</h5>
              <h5 class="mb-0" style="font-weight:normal;">${li.date}</h5>
            </div>
            
             <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Timings</h5>
              <h5 class="mb-0" style="font-weight:normal;">${li.time}</h5>
            </div>
            
            
            <div>
             <div class="col-md-12 mb-4">
             
             <c:choose>
             
             <c:when test="${sessionScope.user.userRole == 'Admin'}">
             <div class= "d-flex justify-content-end " style="margin-right:-15px ;">
                <div class="d-flex justify-content-between mb-6" style="margin-right:10px ; margin-left: 0px">
             <a href="${pageContext.request.contextPath}/eventEdit?id=${li.id}">Edit</a>
            </div>
               <div class="d-flex justify-content-between mb-6 " style="margin-right:0px ; margin-left: 0px">
             <a href="${pageContext.request.contextPath}/eventDelete?id=${li.id}">Delete</a> 
              </div>
              </div>
             </c:when>
             <c:otherwise>
  
             
             </c:otherwise>
               
             </c:choose>
           
    
             </div>
            </div>
            
         
          </div>
        </div>

   </div>
       </c:forEach>
       </div>
       </div>
 
 </section>
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     
