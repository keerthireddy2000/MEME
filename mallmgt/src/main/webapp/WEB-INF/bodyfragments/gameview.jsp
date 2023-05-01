<%@page import="java.text.DateFormat"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page import="java.util.Date"%>
<style><%@include file="/WEB-INF/css/registration.css"%></style>

<body>
<section class="vh-100 gradient-custom ">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
    <div class="col-md-5 col-lg-5 col-xl-4 image-class" style="margin-top:-15px;">
        <img src="https://previews.123rf.com/images/grgroup/grgroup1504/grgroup150403159/38321669-video-games-design-over-white-background-vector-illustration.jpg"
          class="img-fluid" alt="Phone image">
      </div>
      <div class="col-md-9 col-lg-7 col-xl-7 offset-xl-1">
        <div class="card shadow-2-strong card-registration">
          <div class="card-body p-4 p-md-5">
           <%@include file="businessMessage.jsp" %>
           <c:choose>
  				<c:when test="${form.id>0}">
   				    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Update</h3>
 			</c:when>

  			<c:otherwise>
                    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Add Game Details</h3>
  			</c:otherwise>
			</c:choose> 
             
            <sf:form method="post" action="${pageContext.request.contextPath}/addGame" modelAttribute="form" enctype="multipart/form-data">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
             
              <div class="row">
              
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="gameName">
                  <label class="form-label" for="gameName">Game Name</label>
                  <sf:input type="text" id="gameName" class="form-control form-control-lg" path="gameName" name="gameName"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  </div>
				 
                </div>
                <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="pricePerHour">
                  <label class="form-label" for="pricePerHour">Price Per Hour</label>
                    <sf:input type="text" id="pricePerHour" class="form-control form-control-lg" path="pricePerHour" name="pricePerHour"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
               
                </div>
                
              </div>

              <div class="row">
                <div class="col-md-6 mb-4 d-flex align-items-center">
                  <s:bind path="instructions">
                  <div class="form-outline datepicker w-100">
                   <label for="instructions" class="form-label">Game Instruction</label>
                    <sf:textarea type="text" class="form-control form-control-lg" id="instructions" path="instructions" placeholder="Enter instructions" />
                   <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </div>
                  </s:bind>
                </div>
              </div>
              
                <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline"> 
                  <label class="form-label" for="image">Game Image</label>                  
                  <input type="file"  class="form-control form-control-lg" name="image" required="required"/>     
                  <font color="red" style="font-size: 15px"></font>                  
                  </div>			 
                </div>
  
  
              </div>
              
               <div class="row">
                <div class="col-md-6 mb-4">
                <s:bind path="videoLink">
                  <div class="form-outline"> 
                  <label class="form-label" for="videoLink">Video Link</label>                  
                  <sf:input type="text" class="form-control form-control-lg" id="videoLink" path="videoLink" placeholder="Enter Video Link"/>     
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>            
                  </div>
                  </s:bind>   			 
                </div>
  
  
              </div>
              
                <c:choose>
  				<c:when test="${form.id>0}">
   				  <div >
                <input class="btn btn-primary btn-lg" type="submit" value="Update" />
              </div>   
 			</c:when>

  			<c:otherwise>
             <div >
                <input class="btn btn-primary btn-lg" type="submit" value="Submit" />
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