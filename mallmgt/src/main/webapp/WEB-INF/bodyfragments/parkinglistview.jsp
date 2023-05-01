<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<style><%@include file="/WEB-INF/css/parkinglistview.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
<script>
$(function() {
	  const ths = $("th");
	  let sortOrder = 1;

	  ths.on("click", function() {
	    const rows = sortRows(this);
	    rebuildTbody(rows);
	    updateClassName(this);
	    sortOrder *= -1; 
	  })

	  function sortRows(th) {
	    const rows = $.makeArray($('tbody > tr'));
	    const col = th.cellIndex;
	    const type = th.dataset.type;
	    rows.sort(function(a, b) {
	      return compare(a, b, col, type) * sortOrder;      
	    });
	    return rows;
	  }

	  function compare(a, b, col, type) {
	    let _a = a.children[col].textContent;
	    let _b = b.children[col].textContent;
	    if (type === "number") {
	      _a *= 1;
	      _b *= 1;
	    } else if (type === "string") {
	      
	      _a = _a.toLowerCase();
	      _b = _b.toLowerCase();
	    }

	    if (_a < _b) {
	      return -1;
	    }
	    if (_a > _b) {
	      return 1;
	    }
	    return 0;
	  }

	  function rebuildTbody(rows) {
	    const tbody = $("tbody");
	    while (tbody.firstChild) {
	      tbody.remove(tbody.firstChild);
	    }

	    let j;
	    for (j=0; j<rows.length; j++) {
	      tbody.append(rows[j]);
	    }
	  }

	  function updateClassName(th) {
	    let k;
	    for (k=0; k<ths.length; k++) {
	      ths[k].className = "";
	    }
	    th.className = sortOrder === 1 ? "asc" : "desc";   
	  }
	  
	});
</script>

</head>
<body >

<div class="container content" >
<div style="display:flex; flex-direction: row;">
<div>
<h2 style="padding-top: 30px; padding-bottom: 30px;">Parking List</h2>
</div>
<div style="margin-top: 40px;">
<c:choose>
     <c:when test="${sessionScope.user.userRole == 'Admin'}">
     <a href="${pageContext.request.contextPath}/parking" style="background-color:black; color:white; border-radius: 5px; padding: 8px; margin-left: 1049px; text-decoration:none; ">Add Parking</a>
     </c:when>
 </c:choose> 
</div> 
</div>   
<%@include file="businessMessage.jsp" %>
<table class="table bg-light text-dark" id="myTable">
  <thead>
    <tr>
      <th scope="col" data-type="string">Parking Name</th>
      <th scope="col" data-type="string">Address</th>
      <th scope="col" data-type="number">Number of Slots</th>    
      <c:choose>
      <c:when test="${sessionScope.user.userRole=='Admin'}">   
      <th scope="col">Action</th>
      <th scope="col">View Parking Slot</th>
      </c:when>
      <c:otherwise>
      <th scope="col">Book</th>
      </c:otherwise>
      </c:choose>
      
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr>     
      <td>${li.parkingName}</td>
      <td>${li.address}</td>
      <td>${li.numberOfSlot}</td>
     
      <c:choose>
      <c:when test="${sessionScope.user.userRole=='Admin'}">  
       <td> 
      <a href="${pageContext.request.contextPath}/parkingEdit?id=${li.id}" ><i class="fas fa-pen"></i></a>
      <a href="${pageContext.request.contextPath}/parkingDelete?id=${li.id}"><i class="fas fa-trash"></i></a> 
      </td>
       <td>      
      <a href="${pageContext.request.contextPath}/viewparkingSlot?id=${li.id}">View</a>    
      </td>
      </c:when>
      <c:otherwise>
       <td>      
      <a href="${pageContext.request.contextPath}/viewparkingSlot?id=${li.id}">Book</a>    
      </td>
      </c:otherwise>
      </c:choose>     
     
    </tr>
   </c:forEach>
  </tbody>
</table>

</div>

</body>
</html>