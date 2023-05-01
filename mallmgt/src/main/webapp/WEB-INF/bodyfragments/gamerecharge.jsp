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
                    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Recharge Card</h3>
                    <label class="form-label"><strong>Card Id:</strong></label>
                     <label class="form-label">${sessionScope.user.id}</label>
                   <label class="form-label" style="margin-left: 150px"><strong>Holder Name:</strong></label>
                   <label class="form-label">${sessionScope.user.firstName} <span>${ sessionScope.user.lastName}</span></label>

                   <!--   <c:if test="${balance >=0}">
                    <h5>Current Balance: 1000</h5>
                    </c:if>
                    <c:if test="${balance < 0}">
                    <h5>Current Balance: 1015</h5>
                    </c:if> -->
                    <h5>Current Balance: ${balance}</h5>
                   <!--  <c:choose>
					    <c:when test="${balance >=0}">
					       <h5>Current Balance: 1000</h5>
					    </c:when>    
					    <c:otherwise>
					        <h5>Current Balance: 1100</h5>
					    </c:otherwise>
					</c:choose>  -->
            
            <sf:form method="post" action="${pageContext.request.contextPath}/addGameRecharge" modelAttribute="form">
            <sf:input type="hidden" id="id" class="form-control form-control-lg" path="id" name="id" value="${form.id}"/>
              <div class="row">
                <div class="col-md-6 mb-4">
                  
                
                  <div class="form-outline">   
                  <s:bind path="amount">
                  <label class="form-label" for="firstName">Amount</label>
                  <sf:input type="text" id="amount" class="form-control form-control-lg" path="amount" name="amount"/>
                  <font color="red" style="font-size: 15px"><sf:errors path="${status.expression}" /></font>
                  </s:bind>      
                  </div>
				 
                </div>
                
              </div>

  

                <c:choose>
  				<c:when test="${form.id>0}">
   				  <div >
                <input class="btn btn-primary btn-lg" type="submit" value="Pay" />
              </div>   
 			</c:when>

  			<c:otherwise>
             <div >
                <input class="btn btn-primary btn-lg" type="submit" value="Pay" />
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