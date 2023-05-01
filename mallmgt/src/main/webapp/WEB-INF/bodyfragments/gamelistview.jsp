<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
   <style><%@include file="/WEB-INF/css/movielistview.css"%></style>
   <style><%@include file="/WEB-INF/css/moviegrid.css"%></style>
<c:choose>
     <c:when test="${sessionScope.user.userRole != 'Admin'}">
 <section style="background-color: white;">

  <div class="container py-3 content" style="padding: 0px;margin-top: 10px;">
  <div class="row" style="margin-top: 10px;">
    <c:forEach items="${list}" var="li" varStatus="u">
    <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">	
        <div class="card" style="margin-bottom: 20px; margin-top: 10px;">
          <div class="d-flex justify-content-between p-3">
            <p class="lead mb-0" style="font-weight: bold;">${li.gameName}</p>
          </div>
          <img alt="" src="${pageContext.request.contextPath}/getGameImage/${li.id}" class="card-img-top" height="300px">
          <div class="card-body">

            <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Price</h5>
              <h5 class="mb-0" style="font-weight:normal;">$ ${li.pricePerHour} </h5>
            </div>

           <!--   <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Instructions</h5>
              <h5 class="mb-0" style="font-weight:normal;" >${li.instructions}</h5>
            </div>-->
            <div>
             <div class="col-md-12 mb-4 d-flex justify-content-between" >
             
             <c:choose>
             
             <c:when test="${sessionScope.user.userRole == 'Admin'}">
             <div class="d-flex justify-content-between mb-3" >
             <a href="${pageContext.request.contextPath}/gameDetails?id=${li.id}" style="margin-left: -15px">Get Details</a>
            </div>
              <div class= "d-flex justify-content-end " style="margin-right:-15px ;">
                <div class="d-flex justify-content-between mb-6" style="margin-right:10px ; margin-left: 0px">
             <a href="${pageContext.request.contextPath}/gameEdit?id=${li.id}">Edit</a>
            </div>
               <div class="d-flex justify-content-between mb-6 " style="margin-right:0px ; margin-left: 0px">
             <a href="${pageContext.request.contextPath}/gameDelete?id=${li.id}">Delete</a> 
              </div>
              </div>
              
                
             </c:when>
             <c:otherwise>
              <div class="d-flex justify-content-between mb-3" style="margin-left: -5%;">
             <a href="${pageContext.request.contextPath}/gameDetails?id=${li.id}">Get Instructions & More Details</a>
            </div>
             
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
  </c:when>
   <c:otherwise>
<div class="container content">
<div style="display:flex; flex-direction: row;">
<div>
<h2 style="padding-top: 30px;padding-bottom: 20px;">Games List</h2>
</div>
<div style="margin-top: 35px;">
<c:choose>
     <c:when test="${sessionScope.user.userRole == 'Admin'}">
     <a href="${pageContext.request.contextPath}/game" style="background-color:black; color: white; border-radius: 5px; padding: 8px; margin-left: 922px; text-decoration:none;">Add Game</a>
     </c:when>
 </c:choose>   
</div>
</div>
<%@include file="businessMessage.jsp" %>
<table class="table bg-light text-dark">
  <thead>
    <tr>
      <th scope="col">Image</th>
      <th scope="col">Name</th>
      <th scope="col">Price</th> 
      <th scope="col">Video Link</th>    
      <th scope="col">Details</th>
      <th scope="col">Action</th> 
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr>     
      <td><img alt="" src="${pageContext.request.contextPath}/getGameImage/${li.id}" height="100px" width="100px"></td>
      <td>${li.gameName}</td>
      <td>$ ${li.pricePerHour}</td>
      <td>${li.videoLink}</td>
      <td><a href="${pageContext.request.contextPath}/gameDetails?id=${li.id}"><i style="font-size:20px;" class="fa fa-info-circle"></i></a></td> 
       <td> 
      <a href="${pageContext.request.contextPath}/gameEdit?id=${li.id}" ><i class="fas fa-pen"></i></a>
     
      <a href="${pageContext.request.contextPath}/gameDelete?id=${li.id}"><i class="fas fa-trash"></i></a> 
      </td>
    </tr>
   </c:forEach>
  </tbody>
</table>

</div>
   </c:otherwise>
  </c:choose>
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     
