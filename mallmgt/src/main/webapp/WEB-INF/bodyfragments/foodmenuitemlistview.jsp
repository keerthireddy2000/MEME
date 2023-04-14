<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<style><%@include file="/WEB-INF/css/moviegrid.css"%></style>

 <section style="background-color: white;">
 
  <div class="container py-3 content">
  <%@include file="businessMessage.jsp" %>
  <div class="row">
  
    <c:forEach items="${list}" var="li" varStatus="u">
    <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">	
        <div class="card" style="margin-bottom: 30px;">
         
          	<div class="d-flex justify-content-between p-3">
                  <p  style="font-weight: bold;">${li.stallName}</p>
             </div>
             <img alt="" src="${pageContext.request.contextPath}/getStallImage/${li.stallId}" height="200px" width="90%" style="margin-left:5%;">
            <div class="card-body">
				
			
			<div class="d-flex justify-content-between mb-3" style="margin-left: 5%; margin-right:5%">
              <h5 class="mb-0" style="font-weight:normal;">Food Name</h5>
              <h5  style="font-weight:normal;" class=" mb-0">${li.foodName} </h5>
            </div>
			

			<div class="d-flex justify-content-between mb-3" style="margin-left: 5%; margin-right:5%">
              <h5 class="mb-0" style="font-weight:normal;">Price</h5>
              <h5  style="font-weight:normal;" class=" mb-0">$ ${li.foodPrice} </h5>
            </div>

			<div class="d-flex justify-content-between mb-3" style="margin-left: 5%; margin-right:5%">
              <h5 class="mb-0" style="font-weight:normal;">Delivery Time</h5>
              <h5  style="font-weight:normal;" class=" mb-0">${li.deliveryTime} Minutes</h5>
            </div>
			
            <div class="d-flex justify-content-end mb-3" style="margin-right:5%">
            <c:choose>
            <c:when test="${sessionScope.user.userRole=='Admin'}">
            <a href="${pageContext.request.contextPath}/foodMenuEdit?id=${li.id}" style="margin-right:10px;">Edit </a>
     		<a href="${pageContext.request.contextPath}/foodMenuDelete?id=${li.id}&stallId=${li.stallId}">Delete</a> 
            </c:when>
            <c:otherwise>
            <a href="${pageContext.request.contextPath}/addToCart?id=${li.id}">Add To Cart</a> 
            </c:otherwise>
                     
            </c:choose>
  
            </div>
           
        </div>
	 </div>
   </div>
       </c:forEach>
       </div>
       </div>
 
 </section>
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     
