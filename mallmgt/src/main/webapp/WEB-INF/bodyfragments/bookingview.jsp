<%@page import="java.text.DateFormat"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<style><%@include file="/WEB-INF/css/bookingview.css"%></style>
<section class="vh-100 gradient-custom content">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
          <div class="card-body p-4 p-md-5">
           <%@include file="businessMessage.jsp" %>
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Book Parking</h3>
            <sf:form method="post" action="${pageContext.request.contextPath}/addBooking" modelAttribute="form">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
            <sf:input type="hidden" id="slotId" class="form-control form-control-lg" path="slotId" name="slotId" value="${slotId}"/>
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

                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="email">
                  <div class="form-outline">
                  <label class="form-label" for="email">Email</label>
                    <sf:input type="tel" id="email" class="form-control form-control-lg" path="email" value="${user.email}" readonly="true"/>
                      <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
					</s:bind>
                </div> 
                
                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="phoneNumber">
                  <div class="form-outline">
                   <label class="form-label" for="phoneNumber">Phone Number</label>
                    <sf:input type="tel" id="phoneNumber" class="form-control form-control-lg" path="phoneNumber" value="${user.phoneNumber}" readonly="true"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
					</s:bind>
                </div> 
                
              </div>
              
                <div class="row">

                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="parkingName">
                  <div class="form-outline">
                  <label class="form-label" for="parkingName">Parking Name</label>
                    <sf:input type="tel" id="parkingName" class="form-control form-control-lg" path="parkingName" value="${parkingDTO.parkingName}" readonly="true"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
					</s:bind>
                </div> 
                
                   <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="address">
                  <div class="form-outline">
                  <label class="form-label" for="address">Address</label>
                    <sf:input type="tel" id="address" class="form-control form-control-lg" path="address" value="${parkingDTO.address}" readonly="true"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
					</s:bind>
                </div>
                
                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="slot">
                  <div class="form-outline">
                  <label class="form-label" for="slot">Slot Id</label>
                    <sf:input type="text" id="slot" class="form-control form-control-lg" path="slot" value="${slot}" readonly="true"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
					</s:bind>
                </div>
               
             <!--  <div class="col-md-6 mb-4 pb-2">    
			    <label class="form-label select-label">Select Slot</label><br/>       
			    <sf:select path="slotId" cssClass="select form-control-lg">
			        <option value="" disabled>Select slot</option>
			        <c:forEach items="${slotList}" var="list" varStatus="u">
			            <option value="${list.id}">${list.slot}</option>
			        </c:forEach>
			    </sf:select>
			</div>  -->
              
  
                
              </div>
              
                <div class="row">
                
                <div class="col-md-6 mb-4 d-flex align-items-center">
                  <s:bind path="fromBookingDate">
                  <div class="form-outline datepicker w-100">
                  <label for="fromBookingDate" class="form-label">FromBookingDate</label>
                    <sf:input type="date" class="form-control form-control-lg" id="fromBookingDate" path="fromBookingDate" placeholder="dd/MM/yyyy" min="<%= df.format(new java.util.Date())%>"/>
                     <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
                  </s:bind>
                </div>
                
                
                 <div class="col-md-6 mb-4 d-flex align-items-center">
                  <s:bind path="fromTime">
                  <div class="form-outline datepicker w-100">
                  <label for="fromTime" class="form-label">FromTime</label>
                    <sf:input type="time" class="form-control form-control-lg" id="fromTime" path="fromTime" placeholder="HH:MM:SS"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
                  </s:bind>
                </div>
                
                </div>
              
               <div class="row">
                
                <div class="col-md-6 mb-4 d-flex align-items-center">
                  <s:bind path="toBookingDate">
                  <div class="form-outline datepicker w-100">
                  <label for="toBookingDate" class="form-label">ToBookingDate</label>
                    <sf:input type="date" class="form-control form-control-lg" id="toBookingDate" path="toBookingDate" placeholder="dd/MM/yyyy" min="<%= df.format(new java.util.Date())%>"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
                  </s:bind>
                </div>
                
                
                 <div class="col-md-6 mb-4 d-flex align-items-center">
                  <s:bind path="toTime">
                  <div class="form-outline datepicker w-100">
                  <label for="toTime" class="form-label">ToTime</label>
                  
                    
                    <sf:input type="time" class="form-control form-control-lg" id="toTime" path="toTime" placeholder="HH:MM:SS" min="00" max="24"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                    
                    
                  </div>
                  </s:bind>
                </div>
                
                </div>
 
                <c:choose>
  				<c:when test="${form.id>0}">
   				  <div class="mt-4 pt-2">
                <input class="btn btn-primary btn-lg" type="submit" value="Book Slot" />
              </div>   
 			</c:when>

  			<c:otherwise>
             <div class="mt-4 pt-2">
                <input class="btn btn-primary btn-lg" type="submit" value="Book Slot" />
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