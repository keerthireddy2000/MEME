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
   				    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Edit Movie</h3>
 			</c:when>

  			<c:otherwise>
                    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Add Movie</h3>
  			</c:otherwise>
			</c:choose>
             
            <sf:form method="post" action="${pageContext.request.contextPath}/addMovie" modelAttribute="form" enctype="multipart/form-data">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
              <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="title">
                  <label class="form-label" for="title">Movie Title</label>
                  <sf:input type="text" id="title" class="form-control form-control-lg" path="title" name="title"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  </div>
				 
                </div>
                <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="description">
                  <label class="form-label" for="address">Movie Description</label>
                    <sf:input type="text" id="description" class="form-control form-control-lg" path="description"/>
                     <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
               
                </div>
                
              </div>

              <div class="row">

                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="show1">
                 <label class="form-label" for="show1">Show 1 Timing</label>
                  <div class="form-outline">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font> 
                    <sf:input type="text" id="show1" class="form-control form-control-lg" path="show1" value="10:00 AM" readonly="true"/>
                  </div>
					</s:bind>
                </div> 
                
                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="show2">
                 <label class="form-label" for="show1">Show 2 Timing</label>
                  <div class="form-outline">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font> 
                    <sf:input type="text" id="show2" class="form-control form-control-lg" path="show2" value="1:00 PM" readonly="true"/>
                  </div>
					</s:bind>
                </div> 
                
                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="show3">
                 <label class="form-label" for="show1">Show 3 Timing</label>
                  <div class="form-outline">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font> 
                    <sf:input type="text" id="show3" class="form-control form-control-lg" path="show3" value="4:00 PM" readonly="true"/>
                  </div>
					</s:bind>
                </div> 
                
             <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="show4">
                 <label class="form-label" for="show4">Show 4 Timing</label>
                  <div class="form-outline">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font> 
                    <sf:input type="text" id="show4" class="form-control form-control-lg" path="show4" value="7:00 PM" readonly="true" />
                  </div>
					</s:bind>
                </div> 
                
                <div class="col-md-6 mb-4 pb-2">
                 <s:bind path="show5">
                 <label class="form-label" for="show5">Show 5 Timing</label>
                  <div class="form-outline">
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font> 
                    <sf:input type="text" id="show5" class="form-control form-control-lg" path="show5" value="10:00 PM" readonly="true"/>
                  </div>
					</s:bind>
                </div> 
                
              </div>
 
 			<div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="duration">
                  <label class="form-label" for="firstName">Movie Duration</label>
                  <sf:input type="text" id="duration" class="form-control form-control-lg" path="duration" name="duration"/>
                   <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  
                  </div>
				 
                </div>
                <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="price">
                   	<label class="form-label" for="address">Ticket Price</label>
                    <sf:input type="text" id="price" class="form-control form-control-lg" path="price"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
               
                </div>
                
              </div>
              
              	<div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="language">
                  <label class="form-label" for="language">Movie language</label>
                  <sf:input type="text" id="language" class="form-control form-control-lg" path="language" name="language"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  
                  </div>
				 
                </div>
                <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="genre">
                   	<label class="form-label" for="genre">Movie Type Genre</label>
                    <sf:input type="text" id="genre" class="form-control form-control-lg" path="genre"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
               
                </div>
                
              </div>
 
 
      	<div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="format">
                  <label class="form-label" for="format">Format-2d/3d</label>
                  <sf:input type="text" id="format" class="form-control form-control-lg" path="format" name="format"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  
                  </div>
				 
                </div>
                <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="releaseDate">
                  <label class="form-label" for="releaseDate">Movie Release Date</label>
                    <sf:input type="text" id="releaseDate" class="form-control form-control-lg" path="releaseDate"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
               
                </div>
                
              <div class="col-md-6 mb-4 pb-2">    
               <label class="form-label select-label">Select Status</label><br/>                              
                  <select class="select form-control-lg" name="status" style="font-size: 14px; width: 100%; border-color:#ced4da;">
                  <option value="1" disabled>Select Status</option>              
                    <option value="streaming">Streaming</option>
      				<option value="upcoming">Upcoming</option>
                  </select>
                </div>
                
              </div>
 
            <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline"> 
                  <label class="form-label" for="image">Movie Poster</label>                  
                  <input type="file"  class="form-control form-control-lg" name="image" required="required"/>     
                  <font color="red" style="font-size: 15px"></font>                  
                  </div>			 
                </div>
  
               <div class="form-outline">   
                  <s:bind path="numberOfSeat">
                  <label class="form-label" for="numberOfSeat">Number Of Seats</label>
                  <sf:input type="text" id="numberOfSeat" class="form-control form-control-lg" path="numberOfSeat" name="numberOfSeat"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                      
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