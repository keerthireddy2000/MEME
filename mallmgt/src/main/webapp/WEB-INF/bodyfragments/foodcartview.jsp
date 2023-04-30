<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt" %>
        <%@taglib uri="http://www.springframework.org/tags" prefix="s" %>

          <style>
            <%@include file="/WEB-INF/css/moviegrid.css" %>
          </style>

          <section style="background-color: white;">

            <div class="container py-3 content">
              <div class="row">
                <c:choose>

                  <c:when test="${list.size() le 0}">

                    <h5>Empty Food Cart</h5>

                  </c:when>
                  <c:otherwise>

                    <c:forEach items="${list}" var="li" varStatus="u">
                      <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">
                        <div class="card">
                          <div class="d-flex justify-content-between p-3">
                            <p class="lead mb-0" style="font-weight: bold;">${li.foodName}</p>
                          </div>
                          <!-- <img alt="" src="${pageContext.request.contextPath}/getStallImage/${li.id}" height="200px" width="357px"> -->
                          <div class="card-body">

                            <div class="d-flex justify-content-between mb-3">
                              <h5 class="mb-0" style="font-weight:normal;">Price</h5>
                              <h5 class=" mb-0">$ ${li.foodPrice} </h5>
                            </div>

                            <div class="d-flex justify-content-between mb-3">
                              <a style="font-size: 30px"
                                href="${pageContext.request.contextPath}/increaseQuantity?id=${li.id}">+</a>
                              <a style="font-size: 30px"
                                href="${pageContext.request.contextPath}/decreaseQuantity?id=${li.id}">-</a>

                            </div>
                            <div>
                            </div>

                          </div>
                        </div>

                      </div>
                    </c:forEach>


                  </c:otherwise>
                </c:choose>
              </div>
            </div>



          </section>

          <div>



          </div>

          <div class="container">

            <h3>
              <c:if test="${totalPrice>0}">
                <a class="link-primary"
                  href="${pageContext.request.contextPath}/foodPayment?totalPrice=${totalPrice}">Total Price:
                  ${totalPrice} Pay Now</a>
              </c:if>
            </h3>

          </div>