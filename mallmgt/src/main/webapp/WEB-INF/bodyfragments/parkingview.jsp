<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<style><%@include file="/WEB-INF/css/parkingview.css"%></style>
<section class="vh-100 gradient-custom content">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
          <div class="card-body p-4 p-md-5">
           <%@include file="businessMessage.jsp" %>
           <c:choose>
  				<c:when test="${form.id>0}">
   				    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Edit Parking</h3>
 			</c:when>

  			<c:otherwise>
                    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Add Parking</h3>
  			</c:otherwise>
			</c:choose>
            
            
             
            <sf:form method="post" action="${pageContext.request.contextPath}/addParking" modelAttribute="form">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
              <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="parkingName">
                  <label class="form-label" for="firstName">Parking Name</label>
                  <sf:input type="text" id="parkingName" class="form-control form-control-lg" path="parkingName" name="parkingName"/>
                     <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  
                  </div>
				 
                </div>
                <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="address">
                    <label class="form-label" for="address">Address</label>
                    <sf:input type="text" id="address" class="form-control form-control-lg" path="address"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
               
                </div>
                
              </div>

              <div class="row">

                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="numberOfSlot">
                  <div class="form-outline">
                   <label class="form-label" for="numberOfSlot">Number Of Slots</label>
                    <sf:input type="tel" id="numberOfSlot" class="form-control form-control-lg" path="numberOfSlot" value="24" readonly="true" />
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
					</s:bind>
                </div> 
              </div>
 

                <c:choose>
  				<c:when test="${form.id>0}">
   				  <div class="mt-4 pt-2">
                <input class="btn btn-primary btn-lg" type="submit" value="Update" />
              </div>   
 			</c:when>

  			<c:otherwise>
             <div class="mt-4 pt-2">
                <input class="btn btn-primary btn-lg" type="submit" value="Add" />
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