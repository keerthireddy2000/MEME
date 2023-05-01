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
	  <c:choose>
	  
	  <c:when test="${list.size() le 0}">
	  
	  <h2 style="text-align:center;">Your Cart is Empty</h2>
	  
	  </c:when>
	  <c:otherwise>

   <c:forEach items="${list}" var="li" varStatus="u">
   		    <div style="width: 100%">	
        	<div class="card" style="margin-bottom: 10px;">
        	<div style="display: flex; flex-direction: row;justify-content:space-between">
          <div style="padding-top: 20px;padding-left: 40px;margin-bottom: 15px;flex: 12;">
            <h5 class="lead mb-0" style="font-weight: bold;">${li.foodName}</h5>
            <p class=" mb-0">$ ${li.foodPrice} </p>
          </div>
          <div class="card-body" style=" margin-top:5px;">
            <div>
             <a  style="font-size: 20px; border: solid 0.5px;margin-right: 5px;" href="${pageContext.request.contextPath}/increaseQuantity?id=${li.id}">+</a>
             <a style="font-size: 20px; margin-right: 5px;" href="#"> ${li.quantity} </a>
             <a  style="font-size: 18px;border: solid 0.5px;padding: 2.5px;" href="${pageContext.request.contextPath}/decreaseQuantity?id=${li.id}">-</a>
            </div>
            <div>
            </div>
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
 
 <div class="container" style="padding: 0px;margin-left: 186px;">
 
<h5>
 <c:if test="${totalPrice>0}">
    <a class="link-primary" href="${pageContext.request.contextPath}/foodPayment?totalPrice=${totalPrice}" style="background-color:black; color: white; border-radius : 5px; padding: 8px;">Total Price: ${totalPrice} Pay Now</a>
    </c:if> 
</h5>
 
 </div>
 
 
 
 
 
 
 
 
  

  
  
  
  
  
  
  
  
  
  
  
  
     
