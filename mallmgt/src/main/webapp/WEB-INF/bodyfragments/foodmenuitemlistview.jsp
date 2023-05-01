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
   <c:choose>
	  
	  <c:when test="${list.size() le 0}">
	  
	  <h2 style="text-align:center;">Menu is Empty</h2>
	  
	  </c:when>
	  <c:otherwise>
  <div>
  <h2>${list.get(0).stallName}</h2>
  <p style="margin-bottom: 15px; font-size: 20px;">${list.get(0).cuisine}</p>
  <div style="margin-top: -72px;margin-bottom: 50px;"><a href="${pageContext.request.contextPath}/foodStallList" style="background-color: black; color: white; font-size: 20px;padding: 8px;border-radius: 5px;margin-left: 1034px;font-weight:normal;">Food Stalls</a>  </div> 
  <c:choose>
  <c:when test="${sessionScope.user.userRole == 'User'}">
  <div style="margin-left: 879px;margin-top: -81px;margin-bottom: 45px;">
     <a href="${pageContext.request.contextPath}/viewCart" style="background-color: black; color: white; font-size: 20px;padding: 8px;border-radius: 5px;">View Food Cart</a>
  </div>
   </c:when> 
  </c:choose>
  </div>
  <!-- <img alt="" src="${pageContext.request.contextPath}/getStallImage/${list.get(0).stallId}" height="200px" width="90%" style="margin-left:5%;">  -->
    <c:forEach items="${list}" var="li" varStatus="u">
    <div style="width: 100%">	
        <div class="card" style="margin-bottom: 10px;">
        	<div style="display: flex; flex-direction: row;">
        	<div>
             <img alt="" src="${pageContext.request.contextPath}/getMenuImage/${li.id}" style="margin-left: 15%;height: 150px;width: 150px; margin-top: 19px;">
             </div>
            <div class="card-body" style="margin-top: 26px;">
				
			<div class="d-flex justify-content-start mb-3" style="margin-left: 5%; margin-right:5%">
              <h5 class="mb-0" style="font-weight:normal;">Food Name : </h5>
              <h5  style="font-weight:normal;margin-left: 50px !important;" class=" mb-0">${li.foodName} </h5>
            </div>
			

			<div class="d-flex justify-content-start mb-3" style="margin-left: 5%; margin-right:5%">
              <h5 class="mb-0" style="font-weight:normal;">Price : </h5>
              <h5  style="font-weight:normal; margin-left: 110px !important;" class=" mb-0">$ ${li.foodPrice} </h5>
            </div>

			<div class="d-flex justify-content-start mb-3" style="margin-left: 5%; margin-right:5%">
              <h5 class="mb-0" style="font-weight:normal;">Delivery Time : </h5>
              <h5  style="font-weight:normal;margin-left: 34px !important;" class=" mb-0">${li.deliveryTime} Minutes</h5>
            </div>
			
            
           
        </div>
        <div class="d-flex justify-content-end mb-3" style="margin-right:5%">
            <c:choose>
            <c:when test="${sessionScope.user.userRole=='Admin' || (sessionScope.user.userRole=='FoodAdmin')}">
            <a href="${pageContext.request.contextPath}/foodMenuEdit?id=${li.id}" style="margin-right:10px; margin-top: 20px;"><i class="fas fa-pen"></i></a>
     		<a href="${pageContext.request.contextPath}/foodMenuDelete?id=${li.id}&stallId=${li.stallId}" style="margin-left:20px; margin-top: 20px;"><i class="fas fa-trash"></i></a> 
            </c:when>
            <c:otherwise>
            <a href="${pageContext.request.contextPath}/addToCart?id=${li.id}" style="margin-top: 15px;margin-right: -32px;">Add To Cart</a> 
            </c:otherwise>
                     
            </c:choose>
  
            </div>
	 </div>
	 </div>
   </div>
       </c:forEach>
       </c:otherwise>
	  </c:choose>
       </div>
       </div>
 
 </section>
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     
