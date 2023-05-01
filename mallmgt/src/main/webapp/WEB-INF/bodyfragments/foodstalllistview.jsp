<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<style><%@include file="/WEB-INF/css/moviegrid.css"%></style>

 <section style="background-color: white;">
<div class="container content movies" style="margin-top: 15px;">
<h2 style="padding-top: 10px;margin-bottom: 0px;">Food Stalls</h2>
<sf:form method="post" action="${pageContext.request.contextPath}/searchStallByFilter" modelAttribute="form">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
              <div class="row">
                <div class="col-md-8 mb-4 d-flex" style="padding-left: 0px;">
                  <div class="form-outline">   
                  <s:bind path="cuisine">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  <sf:input type="text" id="cuisine" class="form-control" path="cuisine" placeholder="Search By Cuisine" name="cuisine" style="width: 300px;"/>
                  </s:bind>                       
                  </div>
                  <input class="btn btn-primary" type="submit" value="Search" name="operation" style="margin-left: 10px;"/>
                <input class="btn btn-primary" type="submit" value="Reset" name="operation" style="margin-left: 10px;"/>				 
                </div>              
              </div>
           </sf:form>
</div>
  <div class="container py-3 content" style="padding: 0px;margin-top: -101px;">
  
  <c:choose>
     <c:when test="${sessionScope.user.userRole == 'Admin'}">
     <a href="${pageContext.request.contextPath}/foodStall" style="background-color:black; border-radius: 5px; padding: 8px; margin-left: 1064px;">Add Food Stall</a>
     </c:when>
     <c:when test="${sessionScope.user.userRole == 'User'}">
     <a href="${pageContext.request.contextPath}/viewCart" style="background-color:black; border-radius: 5px; padding: 8px; margin-left: 1064px;"> View Food Cart</a>
     </c:when>
  </c:choose>
  <%@include file="businessMessage.jsp" %>
  <div class="row" style="margin-top:20px;">
    <c:choose>
    <c:when  test="${sessionScope.user.userRole=='FoodAdmin'}">
    	
    	<c:forEach items="${list}" var="li" varStatus="u">
    	<c:if test="${sessionScope.user.foodStallId == li.id}">
    <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">	
        <div class="card" style="margin-bottom: 20px; margin-top: 10px;">
          <div class="d-flex justify-content-between p-3">
            <p class="lead mb-0" style="font-weight: bold;">${li.stallName}</p>
          </div>
          <img alt="" src="${pageContext.request.contextPath}/getStallImage/${li.id}" height="200px" width="357px" style="margin-left: 5px;">
          <div class="card-body">
			  <div class="d-flex justify-content-between" style="margin-bottom: 15px;">
              <h5 class="mb-0" style="color:white !important; ">${li.cuisine}</h5>
            </div>
            <div class="d-flex justify-content-between mb-3">
            <c:choose>
            <c:when test="${sessionScope.user.userRole=='Admin'}">
            <div class="mb-3">
              <div class="d-flex justify-content-between mb-3">
              <a href="${pageContext.request.contextPath}/foodStallEdit?id=${li.id}" style="margin-right: 20px;"><i class="fas fa-pen"></i></a>
              <a href="${pageContext.request.contextPath}/foodStallDelete?id=${li.id}" style="margin-right: 20px;"><i class="fas fa-trash"></i></a>
              <a href="${pageContext.request.contextPath}/viewFoodMenuToAddItem?stallId=${li.id}" style="margin-right: 20px;">Add Menu Item</a>
              <a href="${pageContext.request.contextPath}/foodMenuItemList?stallId=${li.id}">View Menu</a>
              </div>
              <div>
              <a href="${pageContext.request.contextPath}/foodmanagerlist?stallId=${li.id}">Manage Stall Managers</a>
              </div>
              </div>
            </c:when>
            <c:when test="${sessionScope.user.userRole=='FoodAdmin' && sessionScope.user.foodStallId == li.id}">  
              <a href="${pageContext.request.contextPath}/foodMenuItemList?stallId=${li.id}">View Menu</a>
              <a href="${pageContext.request.contextPath}/viewFoodMenuToAddItem?stallId=${li.id}">Add Menu Item</a>
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
   </c:if>
       </c:forEach>
    	
    </c:when>
    <c:otherwise>
    <c:forEach items="${list}" var="li" varStatus="u">
    <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">	
        <div class="card" style="margin-bottom: 20px; margin-top: 10px;">
          <div class="d-flex justify-content-between p-3">
            <p class="lead mb-0" style="font-weight: bold;">${li.stallName}</p>
          </div>
          <img alt="" src="${pageContext.request.contextPath}/getStallImage/${li.id}" height="200px" width="357px" style="margin-left: 5px;">
          <div class="card-body">
			  <div class="d-flex justify-content-between" style="margin-bottom: 15px;">
              <h5 class="mb-0" style="color:white !important; ">${li.cuisine}</h5>
            </div>
            <div class="d-flex justify-content-between mb-3">
            <c:choose>
            <c:when test="${sessionScope.user.userRole=='Admin'}">
            <div class="mb-3">
              <div class="d-flex justify-content-between mb-3">
              <a href="${pageContext.request.contextPath}/foodStallEdit?id=${li.id}" style="margin-right: 20px;"><i class="fas fa-pen"></i></a>
              <a href="${pageContext.request.contextPath}/foodStallDelete?id=${li.id}" style="margin-right: 20px;"><i class="fas fa-trash"></i></a>
              <a href="${pageContext.request.contextPath}/viewFoodMenuToAddItem?stallId=${li.id}" style="margin-right: 20px;">Add Menu Item</a>
              <a href="${pageContext.request.contextPath}/foodMenuItemList?stallId=${li.id}">View Menu</a>
              </div>
              <div>
              <a href="${pageContext.request.contextPath}/foodmanagerlist?stallId=${li.id}">Manage Stall Managers</a>
              </div>
              </div>
            </c:when>
            <c:when test="${sessionScope.user.userRole=='FoodAdmin' && sessionScope.user.foodStallId == li.id}">  
              <a href="${pageContext.request.contextPath}/foodMenuItemList?stallId=${li.id}">View Menu</a>
              <a href="${pageContext.request.contextPath}/viewFoodMenuToAddItem?stallId=${li.id}">Add Menu Item</a>
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
    </c:otherwise>
    </c:choose>
    
       </div>
       </div>
 
 </section>
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     
