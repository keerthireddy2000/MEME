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
    <div class="col-md-5 col-lg-5 col-xl-4 image-class" style="margin-top: -15px;">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLBgOWP98_2Rlnng4s59O-aCt3q8M5YgeEnAHQ_4nhTOLswodFk1rBfBJPtYtwfU9ssQ4&usqp=CAU"
          class="img-fluid" alt="Phone image">
      </div>
      <div class="col-md-9 col-lg-7 col-xl-7 offset-xl-1">
        <div class="card shadow-2-strong card-registration">
          <div class="card-body p-4 p-md-5">
           <%@include file="businessMessage.jsp" %>
        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Add Menu Item</h3> 
           

            <sf:form method="post" action="${pageContext.request.contextPath}/addFoodMenu" modelAttribute="form" enctype="multipart/form-data">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
            <sf:input type="hidden" id="stallId" class="form-control form-control-lg" path="stallId" name="stallId" value="${dto.stallId}"/>
            <sf:input type="hidden" id="stallName" class="form-control form-control-lg" path="stallName" name="stallName" value="${dto.stallName}"/>
            <sf:input type="hidden" id="cuisine" class="form-control form-control-lg" path="cuisine" name="cuisine" value="${dto.cuisine}"/>
            
              <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">   
                  <s:bind path="foodName">
                  <label class="form-label" for="foodName">Food Name</label>
                  <sf:input type="text" id="foodName" class="form-control form-control-lg" path="foodName" name="foodName"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  
                  
                  </div>
				 
                </div>
                <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="foodPrice">
                  <label class="form-label" for="foodPrice">Price</label>
                    <sf:input type="text" id="foodPrice" class="form-control form-control-lg" path="foodPrice"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
               
                </div>
                
               <div class="col-md-6 mb-4">
                
                  <div class="form-outline">
                  <s:bind path="deliveryTime">
                  <label class="form-label" for="deliveryTime">Delivery Time In Minutes</label>
                    <sf:input type="text" id="deliveryTime" class="form-control form-control-lg" path="deliveryTime"/>
                    <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>
                  </div>
                
                 <div class="col-md-8 mb-6" style="padding: 0px;max-width: 100%;">
                  <div class="form-outline">
                  <label class="form-label" for="image">Image</label>                  
                  <input type="file"  class="form-control form-control-lg" name="image" required="required"/>     
                  <font color="red" style="font-size: 15px"></font>              
                  </div>			 
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
                <input class="btn btn-primary btn-lg" type="submit" value="Add to Menu" />
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