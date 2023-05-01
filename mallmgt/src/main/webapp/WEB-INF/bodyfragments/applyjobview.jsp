<%@page import="java.text.DateFormat"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page import="java.util.Date"%>
<style><%@include file="/WEB-INF/css/registration.css"%></style>

<%DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>

<body>
<section class="vh-100 gradient-custom ">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
    <div class="col-md-5 col-lg-5 col-xl-4 image-class">
        <img src="https://i.pinimg.com/736x/4b/39/a9/4b39a94252cddcc7d20326c140278c4e.jpg"
          class="img-fluid" alt="Phone image">
      </div>
      <div class="col-md-9 col-lg-7 col-xl-7 offset-xl-1">
        <div class="card shadow-2-strong card-registration">
          <div class="card-body p-4 p-md-5">
           <%@include file="businessMessage.jsp" %>
           <c:choose>
  				<c:when test="${form.id>0}">
   				    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Apply Job</h3>
 			</c:when>

  			<c:otherwise>
                    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Apply Job</h3>
  			</c:otherwise>
			</c:choose> 
           
            
             
            <sf:form method="post" action="${pageContext.request.contextPath}/addApplyJob" modelAttribute="form" enctype="multipart/form-data">
            
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
            
            <sf:input type="hidden" id="jobId" class="form-control form-control-lg" path="jobId" name="jobId" value="${jobId}"/>
            <sf:input type="hidden" id="jobName" class="form-control form-control-lg" path="jobName" name="jobName" value="${jobName}"/>
            
            <sf:input type="hidden" id="userId" class="form-control form-control-lg" path="userId" name="userId" value="${user.getId()}"/>
            
              <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="name">
                  <label class="form-label" for="name">Name</label>
                  <sf:input type="text" id="name" class="form-control form-control-lg" path="name" name="name" value="${user.getFirstName()}" readonly="true"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  
                  </div>
				 
                </div>
                
                <div class="col-md-6 mb-4 pb-2">
                  <s:bind path="email">
                  <div class="form-outline">
                  <label class="form-label" for="emailAddress">Email</label>
                    <sf:input type="email" id="emailAddress" class="form-control form-control-lg"  path="email" value="${user.getEmail() }" readonly="true"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
                  </s:bind>

                </div>
                
            <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="phoneNumber">
                  <div class="form-outline">
                  <label class="form-label" for="phoneNumber">Phone Number</label>
                    <sf:input type="tel" id="phoneNumber" class="form-control form-control-lg" path="phoneNumber"  value="${user.getPhoneNumber() }" readonly="true"/>
                      <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
					</s:bind>
                </div> 
                      
                <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="experience">
                  <label class="form-label" for="experience">Experience in Months</label>
                    <sf:input type="text" id="experience" class="form-control form-control-lg" path="experience"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
               
                </div>
                
                   
                <div class="col-md-6 mb-4">
                  <div class="form-outline"> 
                  <label class="form-label" for="file">Upload Resume</label>                  
                  <input type="file"  class="form-control form-control-lg" name="file" required="required"/>     
                  <font color="red" style="font-size: 15px"></font>                  
                  </div>			 
                </div>
  
             
              </div>
                
  
                <c:choose>
  				<c:when test="${form.id>0}">
   				  <div >
                <input class="btn btn-primary btn-lg" type="submit" value="Apply" />
              </div>   
 			</c:when>

  			<c:otherwise>
             <div >
                <input class="btn btn-primary btn-lg" type="submit" value="Apply" />
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
</body>