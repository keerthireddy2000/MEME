<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page import="java.text.DateFormat"%>
<style><%@include file="/WEB-INF/css/moviebookingview.css"%></style>
<%DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>

<section class="vh-100 gradient-custom content">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
          <div class="card-body p-4 p-md-5">
           <%@include file="businessMessage.jsp" %>
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Movie Booking</h3>
            
             
            <sf:form method="post" action="${pageContext.request.contextPath}/addMovieBooking" modelAttribute="form">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
            <input type="hidden" id="showId" class="form-control form-control-lg" name="showId" value="${showID}"/>
            
            
              <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="title">
                  <label class="form-label" for="title">Movie Name</label>
                  <sf:input type="text" id="title" class="form-control form-control-lg" path="title" name="title" value="${movieDTO.title}" readonly="true"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  
                  </div>
				 
                </div>
                <div class="col-md-6 mb-4">
                <label class="form-label" for="title">Select Seats</label>
                  <div class="form-outline">
                  <s:bind path="seats">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                   
                    <c:forEach items="${list}" var="li" varStatus="u">
                      <c:choose>
     				<c:when test="${li.status == 'Available'}"> 
                    <sf:checkbox path="seats" value="${li.id}"/>
  					</c:when>
  					<c:otherwise>
  					<sf:checkbox path="seats" value="${li.id}" checked="checked" disabled="true"/>
  					
  					</c:otherwise>
  					
  					</c:choose>
  					
  					</c:forEach>
                  </s:bind>
                  </div>
               
                </div>
                
              </div>
              
                   <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="firstName">
                  <label class="form-label" for="firstName">First Name</label>
                  <sf:input type="text" id="firstName" class="form-control form-control-lg" path="firstName" name="firstName" value="${user.firstName}" readonly="true"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  
                  </div>
				 
                </div>
                <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="lastName">
                  <label class="form-label" for="lastName">Last Name</label>
                    <sf:input type="text" id="lastName" class="form-control form-control-lg" path="lastName" value="${user.lastName}" readonly="true"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
               
                </div>
                
              </div>

             <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="email">
                  <label class="form-label" for="email">Email</label>
                  <sf:input type="text" id="email" class="form-control form-control-lg" path="email" name="email" value="${user.email}" readonly="true"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>                        
                  </div>			 
                </div>
                
                   <div class="col-md-6 mb-4 d-flex align-items-center">
                  <s:bind path="date">
                  <div class="form-outline datepicker w-100">
                    <label for="date" class="form-label">Date</label>
                    <sf:input type="date" class="form-control form-control-lg" id="date" path="date" placeholder="dd/MM/yyyy" min="<%= df.format(new java.util.Date())%>"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
                  </s:bind>

                </div>
                
                  <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="price">
                  <label class="form-label" for="price">Price in dollars</label> 
                  <sf:input type="text" id="price" class="form-control form-control-lg" path="price" name="price" value="${movieDTO.price}" readonly="true"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                                   
                  </div>			 
                </div>

              </div>
              
              
   		<div class="mt-4 pt-2">
                <input class="btn btn-primary btn-lg" type="submit" value="Book and Pay" />
              </div>   
           </sf:form>
          
          </div>
        </div>
      </div>
    </div>
  </div>
</section>