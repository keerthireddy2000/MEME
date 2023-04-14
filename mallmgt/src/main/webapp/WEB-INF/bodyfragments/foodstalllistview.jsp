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
          <div class="d-flex justify-content-between p-3">
            <p class="lead mb-0" style="font-weight: bold;">${li.stallName}</p>
          </div>
          <img alt="" src="${pageContext.request.contextPath}/getStallImage/${li.id}" height="200px" width="357px">
          <div class="card-body">

            <div class="d-flex justify-content-between mb-3">
            <c:choose>
            <c:when test="${sessionScope.user.userRole=='Admin'}">
              <a href="${pageContext.request.contextPath}/foodStallEdit?id=${li.id}"><i class="fas fa-pen"></i></a>
              <a href="${pageContext.request.contextPath}/foodStallDelete?id=${li.id}"><i class="fas fa-trash"></i></a>
              <a href="${pageContext.request.contextPath}/viewFoodMenuToAddItem?stallId=${li.id}">Add Menu Item</a>
              <a href="${pageContext.request.contextPath}/foodMenuItemList?stallId=${li.id}">View Menu</a>
            </c:when>
            <c:otherwise>
            
             <a href="${pageContext.request.contextPath}/foodMenuItemList?stallId=${li.id}">View Menu</a>
            </c:otherwise>
            
            </c:choose>
              
             
 
            </div>
            <div>
            </div>
           
          </div>
        </div>

   </div>
       </c:forEach>
       </div>
       </div>
 
 </section>
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     
