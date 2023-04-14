<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<section class="vh-100 gradient-custom ">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px; margin-bottom:30px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); background-color: black !important; color: white;">
          <div class="card-body p-4 p-md-5">
           <%@include file="businessMessage.jsp" %>
           
            
            <c:choose>
  				<c:when test="${form.id>0}">
   				    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Edit Event</h3>
 			</c:when>

  			<c:otherwise>
                    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Add Event</h3>
  			</c:otherwise>
			</c:choose>
             
            <sf:form method="post" action="${pageContext.request.contextPath}/addEvent" modelAttribute="form" enctype="multipart/form-data">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
              
              <div class="row">
                
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="eventName">
                  <label class="form-label" for="eventName">Event Name</label>
                  <sf:input type="text" id="eventName" class="form-control form-control-lg" path="eventName" name="eventName"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  </div>
				 
                </div>
                 <div class="col-md-6 mb-4">
                
                <div class="form-outline">
                  <s:bind path="theatreNumber">
                  <label class="form-label" for="theatreNumber">Screen Number</label>
                    <sf:input type="text" id="theatreNumber" class="form-control form-control-lg" path="theatreNumber"/>
                     <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div> 
               
                </div>
                
              </div>

              <div class="row">

                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="venue">
                 <label class="form-label" for="venue">Venue</label>
                  <div class="form-outline">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font> 
                    <sf:input type="text" id="venue" class="form-control form-control-lg" path="venue"/>
                  </div>
					</s:bind>
                </div> 
                
                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="type">
                 <label class="form-label" for="email">Event Type</label>
                  <div class="form-outline">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font> 
                    <sf:input type="text" id="type" class="form-control form-control-lg" path="type"/>
                  </div>
					</s:bind>
                </div> 
                
                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="date">
                 <label class="form-label" for="date">Date</label>
                  <div class="form-outline">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font> 
                    <sf:input type="text" id="date" class="form-control form-control-lg" path="date"/>
                  </div>
					</s:bind>
                </div> 
                
             <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="time">
                 <label class="form-label" for="time">Time</label>
                  <div class="form-outline">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font> 
                    <sf:input type="text" id="time" class="form-control form-control-lg" path="time" />
                  </div>
					</s:bind>
                </div> 

                
              </div>
 
            <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline"> 
                  <label class="form-label" for="image">Event Image</label>                  
                  <input type="file"  class="form-control form-control-lg" name="image" required="required"/>     
                  <font color="red" style="font-size: 15px"></font>                  
                  </div>			 
                </div>
  
  
              </div>
 
 
              

                <c:choose>
  				<c:when test="${form.id>0}">
   				  <div class="mt-4 pt-2">
                <input class="btn btn-primary btn-lg" style="border-color: white; color: black; background-color: white; font-weight: bold;" type="submit" value="Update" />
              </div>   
 			</c:when>

  			<c:otherwise>
             <div class="mt-4 pt-2">
                <input class="btn btn-primary btn-lg" style="border-color: white; color: black; background-color: white; font-weight: bold;" type="submit" value="Add" />
              </div>
  			</c:otherwise>
			</c:choose> 

           </sf:form>
          
          </div>
        </div>
      </div>
    </div>
  </div>
</section>