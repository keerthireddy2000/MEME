<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<style><%@include file="/WEB-INF/css/moviegrid.css"%></style>
<c:choose>
<c:when test="${sessionScope.user.userRole == 'Admin'}">
<section style="background-color: white;">

  <div class="container py-3 content" style="padding: 0px;margin-top: 10px;">
  <div style="display:flex; flex-direction: row;margin-left: 13px;">
<div>
<h2 style="padding-top: 30px;padding-bottom: 20px;">Deals List</h2>
</div>
<div style="margin-top: 35px;">
<c:choose>
     <c:when test="${sessionScope.user.userRole == 'Admin'}">
     <a href="${pageContext.request.contextPath}/deal" style="background-color:black; color: white; border-radius: 5px; padding: 8px; margin-left: 948px; text-decoration:none;">Add Deal</a>
     </c:when>
 </c:choose>   
</div>
</div>
  <div class="row">
  <%@include file="businessMessage.jsp" %>
    <c:forEach items="${list}" var="li" varStatus="u">
    <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">	
        <div class="card" style="margin-bottom: 20px; margin-top: 10px;">
          <div class="d-flex justify-content-center p-3">
            <p class="lead mb-0" style="font-weight: bold;">${li.dealName}</p>
          </div>
          <img alt="" src="${pageContext.request.contextPath}/getDealImage/${li.id}" class="card-img-top" height="300px" style="width:90%; margin-left:5%">
          <div class="card-body">

            <div class="d-flex justify-content-between mb-3">
             
              <h5 class=" mb-0">${li.description} </h5>
            </div>

            <div>
             <div class="col-md-6 mb-4">
             
             <c:choose>
             
             <c:when test="${sessionScope.user.userRole == 'Admin'}">
                <div class="d-flex mb-3" style="margin-left:-10%;">
                <div>
             <a href="${pageContext.request.contextPath}/dealEdit?id=${li.id}">Edit</a>
           	</div>
           	<div style="margin-left:242px;">
             <a href="${pageContext.request.contextPath}/dealDelete?id=${li.id}">Delete</a> 
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
 
  
  
  
</c:when>
<c:otherwise>
<div id="carouselExampleIndicators" class="carousel slide dealcarousel" data-ride="carousel">
  <ol class="carousel-indicators">
    <c:forEach items="${list}" var="li" varStatus="status">
    <c:if test="${li.dealType == 'true'}">
      <li data-target="#carouselExampleIndicators" data-slide-to="${status.index}" class="${status.index == 0 ? 'active' : ''}"></li>
      </c:if>
    </c:forEach>
  </ol>
  <div class="carousel-inner">
    <c:forEach items="${list}" var="li" varStatus="status">
    <c:if test="${li.dealType == 'true'}">
      <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
        <img src="${pageContext.request.contextPath}/getDealImage/${li.id}" class="d-block w-100" alt="${movie.title}" style="height:350px !important;">
        <div class="carousel-caption d-none d-md-block">
          <h5>${li.dealName}</h5>
          <p>${li.description}</p>
        </div>
      </div>
      </c:if>
    </c:forEach>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="row" style="width: 80%;margin-left: 10%;margin-top: 10px;">
    <c:forEach items="${list}" var="li" varStatus="u">
    <c:if test="${li.dealType != 'true'}">
   <div class="col-md-8 col-lg-4 mb-3 mb-lg-0" style="padding:0px;">	
        <div class="card" style="margin-bottom: 20px; margin-top: 10px; background-color: white; border: 1px solid black;color: black; margin-right: 20px;">
          <div class="d-flex justify-content-center p-3">
            <p class="lead mb-0" style="font-weight: bold;">${li.dealName}</p>
          </div>
          <img alt="" src="${pageContext.request.contextPath}/getDealImage/${li.id}" class="card-img-top"  style="width: 80%;margin-left: 10%;height: 170px !important;">
          <div class="card-body">

            <div class="d-flex justify-content-center mb-3">
             
              <h5 class=" mb-0">${li.description} </h5>
            </div>
            </div>
            </div>
            </div>
            </c:if>
      </c:forEach>
</div>
</c:otherwise>
</c:choose>
 
  
  
  
  
  
  
  
  
  
  
  
     
