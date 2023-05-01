<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style><%@include file="/WEB-INF/css/movielistview.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body >

<div class="container content">
<div style="display:flex; flex-direction: row;">
<div>
<h2 style="padding-top: 30px;padding-bottom: 20px;">Movies List</h2>
</div>
<div style="margin-top: 50px;">
<c:choose>
     <c:when test="${sessionScope.user.userRole == 'Admin'}">
     <a href="${pageContext.request.contextPath}/movie" style="background-color:black; color: white; border-radius: 5px; padding: 8px; margin-left: 1064px; text-decoration:none;">Add Movie</a>
     </c:when>
 </c:choose>   
</div>
</div>
<sf:form method="post" action="${pageContext.request.contextPath}/searchMovieByFilter" modelAttribute="form">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
              <div class="row">
                <div class="col-md-8 mb-4 d-flex">
                  <div class="form-outline">   
                  <s:bind path="genre">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  <sf:input type="text" id="genre" class="form-control" path="genre" placeholder="Search by Genre Or Format Or Language" name="genre" style="width: 300px;"/>
                  </s:bind>                       
                  </div>
                  <input class="btn btn-primary" type="submit" value="Search" name="operation" style="margin-left: 10px;"/>
                <input class="btn btn-primary" type="submit" value="Reset" name="operation" style="margin-left: 10px;"/>				 
                </div>              
              </div>

   			    

           </sf:form>        
</div>


<div class="container content">
<%@include file="businessMessage.jsp" %>
<table class="table bg-light text-dark">
  <thead>
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Description</th>    
      <th scope="col">Duration</th>
      <th scope="col">Price</th>
      <th scope="col">Language</th>
      <th scope="col">Genre</th>
      <th scope="col">Format</th>
      <th scope="col">ReleaseDate</th>
      <th scope="col">Status</th>
      <th scope="col">Image</th> 
        <c:choose>
      <c:when test="${sessionScope.user.userRole=='Admin'}"> <th scope="col">Action</th>
      </c:when></c:choose>
      
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr>     
      <td>${li.title}</td>
      <td>${li.description}</td>
      <td>${li.duration}</td>
      <td>${li.price}</td>
      <td>${li.language}</td>
      <td>${li.genre}</td>
      <td>${li.format}</td>
      <td>${li.releaseDate}</td>
      <td>${li.status}</td>
      <td><img alt="" src="${pageContext.request.contextPath}/getImage/${li.id}" height="100px" width="100px"></td>
  <c:choose>
      <c:when test="${sessionScope.user.userRole=='Admin'}">  
       <td> 
      <a href="${pageContext.request.contextPath}/movieEdit?id=${li.id}" ><i class="fas fa-pen"></i></a>
     
      <a href="${pageContext.request.contextPath}/movieDelete?id=${li.id}"><i class="fas fa-trash"></i></a> 
      </td>
      </c:when>
      </c:choose>     

    </tr>
   </c:forEach>
  </tbody>
</table>

</div>

</body>
</html>