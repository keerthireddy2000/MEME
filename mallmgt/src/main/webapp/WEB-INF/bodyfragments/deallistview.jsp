<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<style><%@include file="/WEB-INF/css/moviegrid.css"%></style>

 <section style="background-color: white;">

  <div class="container py-3 content">
  <div class="row">
  
    <c:forEach items="${list}" var="li" varStatus="u">
    <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">	
        <div class="card">
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
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     
