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
 

 <!--  <div class="container py-3 content" style="padding: 0px;margin-top: 10px;">
  <c:choose>
     <c:when test="${sessionScope.user.userRole == 'Admin'}">
     <a href="${pageContext.request.contextPath}/shop" style="background-color:black; border-radius: 5px; padding: 8px; margin-left: 1098px;">Add Shop</a>
     </c:when>
  </c:choose>
  <div class="row">
  
    <c:forEach items="${list}" var="li" varStatus="u">
    <div class="col-md-12 col-lg-6 mb-6 mb-lg-0">	
        <div class="card" style="margin-bottom: 20px; margin-top: 10px;">
          <div class="d-flex justify-content-center p-3">
            <p class="lead mb-0" style="font-weight: bold;">${li.shopName}</p>
          </div>
          <img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" class="card-img-top" height="300px" style="width:90%;margin-left:5%">
          <div class="card-body">

            <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Owner Name</h5>
              <h5  style="font-weight:normal;" class=" mb-0">${li.ownerName} </h5>
            </div>

            <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Contact Number</h5>
              <h5 style="font-weight:normal;" class=" mb-0">${li.contactNumber}</h5>
            </div>
            
             <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Email</h5>
              <h5  style="font-weight:normal;" class=" mb-0">${li.email}</h5>
            </div>
            
             <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Opening Time</h5>
              <h5 style="font-weight:normal;" class=" mb-0">${li.openingTime}</h5>
            </div>
            
             <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0" style="font-weight:normal;">Closing Time</h5>
              <h5 style="font-weight:normal;" class=" mb-0">${li.closingTime}</h5>
            </div>
            
            
            <div>
             <div class="col-md-12 mb-4">
             
             <c:choose>
             
             <c:when test="${sessionScope.user.userRole == 'Admin'}">
                             <div class= "d-flex justify-content-end " style="margin-right:-15px ;">
                <div class="d-flex justify-content-between mb-6" style="margin-right:10px ; margin-left: 0px">
             <a href="${pageContext.request.contextPath}/shopEdit?id=${li.id}">Edit</a>
            </div>
               <div class="d-flex justify-content-between mb-6 " style="margin-right:0px ; margin-left: 0px">
             <a href="${pageContext.request.contextPath}/shopDelete?id=${li.id}">Delete</a> 
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
       </div>  -->
<div style="margin-left: 15%;">
<img src="https://i.ibb.co/SPn1j1s/Copy-of-Copy-of-Copy-of-Regel-Cinemas.png" alt="Shop-Map" border="0" style="width: 100%;
    height: 100%;">


 <c:forEach items="${list}" var="li" varStatus="u">

<c:if test="${li.shopId == '3'}">
<div style="margin-top: -389px;
    margin-left: 259px;position: absolute;">

<a
class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
role="button" data-toggle="dropdown" aria-haspopup="true"
aria-expanded="false" style="color: white;"><span style="color: black; font-size: 10px;margin-right: 4px;">${li.shopName}</span><i class="fa fa-info-circle" style="color:black; font-size: 20px;"></i> </a>	
			<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
			<div style="display: flex; flex-direction: row;">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" style="height: 125px; width: 140px;">	
			</div>
			<div style="margin-left: 8px;width: 243px;">
				Shop Name : ${li.shopName} <br/> Owner Name: ${li.ownerName} <br/> Opening Time: ${li.openingTime} <br/> Closing Time: ${li.closingTime}<br/> Contact: ${li.contactNumber}
			</div>	
			</div>
			</div>	
			</div>
</div>
</c:if>

 </c:forEach>
 
 
 <c:forEach items="${list}" var="li" varStatus="u">
 <c:if test="${li.shopId == '8'}">
<div style="margin-top: -224px;margin-left: 522px;position: absolute;">

<a
class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
role="button" data-toggle="dropdown" aria-haspopup="true"
aria-expanded="false" style="color: white;"><span style="color: black; font-size: 10px;margin-right: 4px;">${li.shopName}</span><i class="fa fa-info-circle" style="color:black; font-size: 20px;"></i> </a>
							
				<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
			<div style="display: flex; flex-direction: row;">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" style="height: 125px; width: 140px;">	
			</div>
			<div style="margin-left: 8px;width: 243px;">
				Shop Name : ${li.shopName} <br/> Owner Name: ${li.ownerName} <br/> Opening Time: ${li.openingTime} <br/> Closing Time: ${li.closingTime}<br/> Contact: ${li.contactNumber}
			</div>	
			</div>
			</div>
</div>
</c:if>
 </c:forEach>
 
 <c:forEach items="${list}" var="li" varStatus="u">
 <c:if test="${li.shopId == '6' }">
<div style="margin-top: -324px;margin-left: 797px;position: absolute;">

<a
class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
role="button" data-toggle="dropdown" aria-haspopup="true"
aria-expanded="false" style="color: white;"><span style="color: black; font-size: 10px;margin-right: 4px;">${li.shopName}</span> <i class="fa fa-info-circle" style="color:black; font-size: 20px;"></i> </a>
							
				<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
			<div style="display: flex; flex-direction: row;">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" style="height: 125px; width: 140px;">	
			</div>
			<div style="margin-left: 8px;width: 243px;">
				Shop Name : ${li.shopName} <br/> Owner Name: ${li.ownerName} <br/> Opening Time: ${li.openingTime} <br/> Closing Time: ${li.closingTime}<br/> Contact: ${li.contactNumber}
			</div>	
			</div>
			</div>	
</div>
</c:if>
 </c:forEach>
 
  <c:forEach items="${list}" var="li" varStatus="u">
  <c:if test="${li.shopId == '4' }">
<div style="margin-top: -326px;
    margin-left: 494px;position: absolute;">

<a
class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
role="button" data-toggle="dropdown" aria-haspopup="true"
aria-expanded="false" style="color: white;"><span style="color: black; font-size: 10px;margin-right: 4px;">${li.shopName}</span> <i class="fa fa-info-circle" style="color:black; font-size: 20px;"></i> </a>
							
				<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
			<div style="display: flex; flex-direction: row;">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" style="height: 125px; width: 140px;">	
			</div>
			<div style="margin-left: 8px;width: 243px;">
				Shop Name : ${li.shopName} <br/> Owner Name: ${li.ownerName} <br/> Opening Time: ${li.openingTime} <br/> Closing Time: ${li.closingTime}<br/> Contact: ${li.contactNumber}
			</div>	
			</div>
			</div>
</div>
</c:if>
  </c:forEach>

  <c:forEach items="${list}" var="li" varStatus="u">
  <c:if test="${li.shopId == '9'}">
<div style="margin-top: -460px; margin-left: 500px;position: absolute;">

<a
class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
role="button" data-toggle="dropdown" aria-haspopup="true"
aria-expanded="false" style="color: white;"><span style="color: black; font-size: 10px;margin-right: 4px;">${li.shopName}</span><i class="fa fa-info-circle" style="color:black; font-size: 20px;"></i> </a>			
				<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
			<div style="display: flex; flex-direction: row;">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" style="height: 125px; width: 140px;">	
			</div>
			<div style="margin-left: 8px;width: 243px;">
				Shop Name : ${li.shopName} <br/> Owner Name: ${li.ownerName} <br/> Opening Time: ${li.openingTime} <br/> Closing Time: ${li.closingTime}<br/> Contact: ${li.contactNumber}
			</div>	
			</div>
			</div>
</div>
</c:if>
  </c:forEach>
   <c:forEach items="${list}" var="li" varStatus="u">
   <c:if test="${li.shopId == '1' }">
<div style="margin-top: -384px;
    margin-left: 623px;position: absolute;">

<a
class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
role="button" data-toggle="dropdown" aria-haspopup="true"
aria-expanded="false" style="color: white;"><span style="color: black; font-size: 10px;margin-right: 4px;">${li.shopName}</span> <i class="fa fa-info-circle" style="color:black; font-size: 20px;"></i> </a>
							
				<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
			<div style="display: flex; flex-direction: row;">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" style="height: 125px; width: 140px;">	
			</div>
			<div style="margin-left: 8px;width: 243px;">
				Shop Name : ${li.shopName} <br/> Owner Name: ${li.ownerName} <br/> Opening Time: ${li.openingTime} <br/> Closing Time: ${li.closingTime}<br/> Contact: ${li.contactNumber}
			</div>	
			</div>
			</div>
</div>
</c:if>
   </c:forEach>
   
<c:forEach items="${list}" var="li" varStatus="u">
<c:if test="${li.shopId == '2'}">
<div style="margin-top: -466px;margin-left: 659px;position: absolute;">

<a
class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
role="button" data-toggle="dropdown" aria-haspopup="true"
aria-expanded="false" style="color: white;"><span style="color: black; font-size: 10px;margin-right: 4px;">${li.shopName}</span> <i class="fa fa-info-circle" style="color:black; font-size: 20px;"></i> </a>
							
				<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
			<div style="display: flex; flex-direction: row;">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" style="height: 125px; width: 140px;">	
			</div>
			<div style="margin-left: 8px;width: 243px;">
				Shop Name : ${li.shopName} <br/> Owner Name: ${li.ownerName} <br/> Opening Time: ${li.openingTime} <br/> Closing Time: ${li.closingTime}<br/> Contact: ${li.contactNumber}
			</div>	
			</div>
			</div>
</div>

</c:if>
</c:forEach>
<c:forEach items="${list}" var="li" varStatus="u">
<c:if test="${li.shopId == '7' }">
<div style="margin-top: -385px;
    margin-left: 724px;position: absolute;">

<a
class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
role="button" data-toggle="dropdown" aria-haspopup="true"
aria-expanded="false" style="color: white;"><span style="color: black; font-size: 10px;margin-right: 4px;">${li.shopName}</span><i class="fa fa-info-circle" style="color:black; font-size: 20px;"></i> </a>
							
				<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
			<div style="display: flex; flex-direction: row;">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" style="height: 125px; width: 140px;">	
			</div>
			<div style="margin-left: 8px;width: 243px;">
				Shop Name : ${li.shopName} <br/> Owner Name: ${li.ownerName} <br/> Opening Time: ${li.openingTime} <br/> Closing Time: ${li.closingTime}<br/> Contact: ${li.contactNumber}
			</div>	
			</div>
			</div>
</div>
</c:if>
</c:forEach>


  <c:forEach items="${list}" var="li" varStatus="u">
  <c:if test="${li.shopId == '5' }">
<div style="margin-top: -385px;
    margin-left: 815px;position: absolute;">

<a
class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
role="button" data-toggle="dropdown" aria-haspopup="true"
aria-expanded="false" style="color: white;"> <span style="color: black; font-size: 10px;margin-right: 4px;">${li.shopName}</span><i class="fa fa-info-circle" style="color:black; font-size: 20px;"></i> </a>
							
				<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
			<div style="display: flex; flex-direction: row;">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" style="height: 125px; width: 140px;">	
			</div>
			<div style="margin-left: 8px;width: 243px;">
				Shop Name : ${li.shopName} <br/> Owner Name: ${li.ownerName} <br/> Opening Time: ${li.openingTime} <br/> Closing Time: ${li.closingTime}<br/> Contact: ${li.contactNumber}
			</div>	
			</div>
			</div>
</div>

</c:if>
  </c:forEach>




















</div>

 </c:when>
 <c:otherwise>
 <div class="container content">
<%@include file="businessMessage.jsp" %>
<div style="display:flex; flex-direction: row;">
<div>
<h2 style="padding-top: 30px;padding-bottom: 20px;">Shops List</h2>
</div>
<div style="margin-top: 35px;">
<c:choose>
     <c:when test="${sessionScope.user.userRole == 'Admin'}">
     <a href="${pageContext.request.contextPath}/shop" style="background-color:black; color: white; border-radius: 5px; padding: 8px; margin-left: 935px; text-decoration:none;">Add Shop</a>
     </c:when>
 </c:choose>   
</div>
</div>
<table class="table bg-light text-dark">
  <thead>
    <tr>
    <th scope="col">Image</th>
      <th scope="col">Shop Id</th>
      <th scope="col">Shop Name</th>
      <th scope="col">Owner Name</th>    
      <th scope="col">Contact Number</th>
      <th scope="col">Email Id</th>
      <th scope="col">Opening Time</th>
      <th scope="col">Closing Time</th>
      
        <c:choose>
      <c:when test="${sessionScope.user.userRole=='Admin'}"> <th scope="col">Action</th>
      </c:when></c:choose>
      
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr> 
    <td><img alt="" src="${pageContext.request.contextPath}/getShopImage/${li.id}" height="100px" width="100px"></td>    
       <td>${li.shopId}</td>
      <td>${li.shopName}</td>
      <td>${li.ownerName}</td>
      <td>${li.contactNumber}</td>
      <td>${li.email}</td>
      <td>${li.openingTime}</td>
      <td>${li.closingTime}</td>
      
  <c:choose>
      <c:when test="${sessionScope.user.userRole=='Admin'}">  
       <td> 
      <a href="${pageContext.request.contextPath}/shopEdit?id=${li.id}" ><i class="fas fa-pen"></i></a>
     
      <a href="${pageContext.request.contextPath}/shopDelete?id=${li.id}"><i class="fas fa-trash"></i></a> 
      </td>
      </c:when>
      </c:choose>     

    </tr>
   </c:forEach>
  </tbody>
</table>

</div>
 </c:otherwise>
 </c:choose>
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     
